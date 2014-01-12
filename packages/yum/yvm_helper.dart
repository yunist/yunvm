part of yvm;

abstract class yvmWrapper
{
  static int _keySerial=0;
  Type vmClass;
  String vmAlias;
  SendPort vmPort;
  bool isReady=false;
  ReceivePort myPort;

  Map<String,Completer> _FutureMap={};

  Map<String,dynamic> _StatusMap={};

  yvmWrapper(this.vmClass,[this.vmAlias=null])
  {
    if (vmAlias==null)
      vmAlias=MirrorSystem.getName(reflectType(vmClass).simpleName)+"#"
        +((_keySerial<0x7FFFFFFFFFFFFFFF)?(++_keySerial):(_keySerial=1)).toString();
  }

  Future<bool> CreateVM()
  {
    if (isReady)
      return new Future(()=>!isReady);

    var completer=new Completer<bool>();
    if (myPort==null)
    {
      myPort=new ReceivePort();
      myPort.listen((msg){
        if (msg is InitResultMessage)
        {
          if (msg.vmError!=null)
            isReady=false;
          else
          {
            vmPort=msg.vmPort;
            isReady=true;
          }
          completer.complete(isReady);
        }
        else if (msg is CallbackMessage)
        {
          var fur=_FutureMap.remove(msg.sourceMSGKEY);
          if (fur!=null)
            fur.complete(msg.result);
        }
        else if (msg is ErrorMessage)
        {
          var fur=_FutureMap.remove(msg.sourceMessage.MSGKEY);
          if (fur!=null)
            fur.completeError(msg.errorKey);
        }
        else if (msg is StatusChangedMessage)
        {
          _StatusMap[msg.statusKey]=msg.newStatusValue;
        }
        else if (msg is VMClosedMessage)
        {
          if (msg.vmAlias==vmAlias)
          {
            isReady=false;
            //something to do
            myPort.close();
            myPort=null;
          }
        }
        else if (msg is Message)
        {
          onMessage(msg);
        }
      });
    }
    var result=create_yvm(vmAlias,vmClass,myPort.sendPort);

    return completer.future;
  }

  Future<bool> CloseVM()
  {
    if (!isReady)
      return new Future(()=>isReady);

    isReady=false;
    var isOK=false;
    var completer=new Completer<bool>();
    var msg=new VMClosingMessage()
                ..vmAlias=vmAlias
                ..reasonKey=VMClosingMessage.reasonKey_WrapperClosing;
    var result=SendMessage(msg)
        ..then((ok){
            isOK=(ok==null)?false:ok;
            // something to do
          })
        ..whenComplete(completer.complete(isOK));
    return completer.future;
  }

  Future<bool> RegisterPort(yvmWrapper vmHelper)
  {
    if (!isReady)
      return new Future(()=>isReady);
    var msg=new RegisterPortMessage()
              ..aliasName=vmHelper.vmAlias
              ..vmPort=vmHelper.vmPort
              ;
    return SendMessage(msg);
  }

  Future<bool> UnregisterPort(yvmWrapper vmHelper)
  {
    if (!isReady)
      return new Future(()=>isReady);
    var msg=new UnregisterPortMessage()
              ..aliasName=vmHelper.vmAlias
              ;
    return SendMessage(msg);
  }

  Future<bool> AddListener(Symbol msgid,yvmWrapper vmHelper)
  {
    if (!isReady)
      return new Future(()=>isReady);
    var msg=new AddListenerMessage()
              ..messageID=msgid
              ..aliasName=vmHelper.vmAlias
              ;
    return SendMessage(msg);
  }

  Future<bool> RemoveListener(Symbol msgid,yvmWrapper vmHelper)
  {
    if (!isReady)
      return new Future(()=>isReady);
    var msg=new RemoveListenerMessage()
              ..messageID=msgid
              ..aliasName=vmHelper.vmAlias
              ;
    return SendMessage(msg);
  }

  Future<bool> SetStatus(String key,value)
  {
    if (!isReady)
      return new Future(()=>isReady);
    if (!check_type(value))
      return new Future(()=>false);
    var msg=new SetStatusMessage()
              ..statusKey=key
              ..statusValue=value
              ;
    return SendMessage(msg);
  }

  Future<bool> UnsetStatus(String key)
  {
    if (!isReady)
      return new Future(()=>isReady);
    var msg=new UnsetStatusMessage()
              ..statusKey=key
              ;
    return SendMessage(msg);
  }

  Future<dynamic> SendMessage(Message msg)
  {
    var completer=new Completer();
    _FutureMap[msg.MSGKEY]=completer;
    msg.SENDER=yvmbase.Key_Port_Creator;
    PostMessage(msg);
    return completer.future;
  }


  void PostMessage(Message msg)
  {
    msg.POSTER=vmAlias;
    vmPort.send(msg);
  }

  void onMessage(Message msg);

}