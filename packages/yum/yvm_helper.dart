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
        } else if (msg is CallbackMessage)
        {
          var fur=_FutureMap.remove(msg.sourceMSGKEY);
          if (fur!=null)
            fur.complete(msg.result);
        } else if (msg is ErrorMessage)
        {
          var fur=_FutureMap.remove(msg.sourceMessage.MSGKEY);
          if (fur!=null)
            fur.completeError(msg.errorKey);
        } else if (msg is StatusChangedMessage)
        {

        } else if (msg is Message)
        {
          onMessage(msg);
        }
      });
    }
    var result=create_yvm(vmAlias,vmClass,myPort.sendPort);

    return completer.future;
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