part of yvm;

abstract class yvmWrapper
{
  static int _keySerial=0;
  Type vmClass;
  String vmAlias;
  SendPort vmPort;
  bool isReady;
  ReceivePort myPort;

  yvmWrapper(this.vmClass,[this.vmAlias=null])
  {
    if (vmAlias==null)
      vmAlias=reflectType(vmClass).simpleName.toString()+"#"
        +((_keySerial<0xFFFFFFFF)?(++_keySerial):1).toString();
  }

  Future<bool> CreateVM()
  {
    if (isReady)
      return new Future(()=>!isReady);
    if (myPort==null)
      myPort=new ReceivePort();
    var completer=new Completer<bool>();
    var result=create_yvm(vmAlias,vmClass,myPort.sendPort)
        ..then((msg){
          var message=Message.FromMap(msg);
          if (message is InitResultMessage)
          {
            vmPort=message.vmPort;
            isReady=true;
          }
        }, onError:(errmsg){
          var error=Message.FromMap(errmsg);
          if (error is ErrorMessage)
          {

          }
        })
        ..whenComplete(completer.complete(isReady));
    return completer.future;
  }

  Future<bool> CloseVM()
  {
    if (!isReady)
      return new Future(()=>isReady);

    isReady=false;
    var isOK=false;
    var completer=new Completer<bool>();
    var result=SendMessage(null)
        ..then((ok){isOK=(ok==null)?false:ok;})
        ..whenComplete(completer.complete(isOK));
    return completer.future;
  }

  Future<bool> RegisterPort(yvmWrapper vmHelper)
  {
    if (!isReady)
      return new Future(()=>isReady);

    var isOK=false;
    var completer=new Completer<bool>();
    var result=SendMessage(null)
        ..then((ok){isOK=(ok==null)?false:ok;})
        ..whenComplete(completer.complete(isOK));
    return completer.future;
  }

  Future<bool> UnRegisterPort(yvmWrapper vmHelper)
  {
    if (!isReady)
      return new Future(()=>isReady);

    var isOK=false;
    var completer=new Completer<bool>();
    var result=SendMessage(null)
        ..then((ok){isOK=(ok==null)?false:ok;})
        ..whenComplete(completer.complete(isOK));
    return completer.future;
  }

  Future<bool> AddListener(yvmWrapper vmHelper)
  {
    if (!isReady)
      return new Future(()=>isReady);

    var isOK=false;
    var completer=new Completer<bool>();
    var result=SendMessage(null)
        ..then((ok){isOK=(ok==null)?false:ok;})
        ..whenComplete(completer.complete(isOK));
    return completer.future;
  }

  Future<bool> RemoveListener(yvmWrapper vmHelper)
  {
    if (!isReady)
      return new Future(()=>isReady);

    var isOK=false;
    var completer=new Completer<bool>();
    var result=SendMessage(null)
        ..then((ok){isOK=(ok==null)?false:ok;})
        ..whenComplete(completer.complete(isOK));
    return completer.future;
  }

  Future<dynamic> SendMessage(Message msg)
  {
    var completer=new Completer();
    msg.MSGCALLBACK=new Completer();
    msg.MSGCALLBACK.future
      ..then((cbmsg){
        if (cbmsg is CallbackMessage)
        {
          completer.complete(cbmsg.result);
        }
      },onError:(errmsg){
        var error=Message.FromMap(errmsg);
        if (error is ErrorMessage)
        {
          completer.completeError(error);
        }
        else
          assert(error==null);
      });
    PostMessage(msg);
    return completer.future;
  }

  void PostMessage(Message msg)
  {
    vmPort.send(msg.toMap());
  }
}