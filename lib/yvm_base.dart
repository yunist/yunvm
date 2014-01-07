part of yvm;

abstract class yvmbase
{
  Map<IDkey,List<String>> _EventMap={};
  Map<String,SendPort> _PortMap={};

  Map<String,dynamic> _StatusMap={};

  Map<IDkey,Function> _MessageHandles={};
  String VMAlias;
  IDkey currentMSGID;
  String currentMSGKEY;
  SendPort routerPort;
  SendPort debugPort;

  yvmbase()
  {
    RegisterFunction(VMClosingMessage_MSGID,_On_VMClosingMessage);
    RegisterFunction(VMClosingMessage_MSGID,_On_RegisterPortMessage);
    RegisterFunction(VMClosingMessage_MSGID,_On_UnregisterPortMessage);
    RegisterFunction(VMClosingMessage_MSGID,_On_AddListenerMessage);
    RegisterFunction(VMClosingMessage_MSGID,_On_RemoveListenerMessage);
    RegisterFunction(VMClosingMessage_MSGID,_On_SetStatusMessage);
    RegisterFunction(VMClosingMessage_MSGID,_On_UnsetStatusMessage);
  }

  bool _On_VMClosingMessage(Message msg)
  {
    if (msg is VMClosingMessage)
      return _CloseVM();
    return false;
  }

  bool _On_RegisterPortMessage(Message msg)
  {
    if (msg is RegisterPortMessage)
      return _RegisterPort(msg.aliasName, msg.vmPort);
    return false;
  }

  bool _On_UnregisterPortMessage(Message msg)
  {
    if (msg is UnregisterPortMessage)
      return _UnregisterPort(msg.aliasName);
    return false;
  }

  bool _On_AddListenerMessage(Message msg)
  {
    if (msg is AddListenerMessage)
      return _AddListener(msg.messageID, msg.aliasName);
    return false;
  }

  bool _On_RemoveListenerMessage(Message msg)
  {
    if (msg is RemoveListenerMessage)
      return _RemoveListener(msg.messageID, msg.aliasName);
    return false;
  }

  bool _On_SetStatusMessage(Message msg)
  {
    if (msg is SetStatusMessage)
      return _SetStatus(msg.statusKey, msg.statusValue);
    return false;
  }

  bool _On_UnsetStatusMessage(Message msg)
  {
    if (msg is UnsetStatusMessage)
      return _UnsetStatus(msg.statusKey);
    return false;
  }

  bool RegisterFunction(IDkey msgid,Function func)
  {
    var ofunc=_MessageHandles[msgid];
    if (ofunc!=null)
      return false;
    _MessageHandles[msgid]=func;
    return true;
  }

  bool UnregisterFunction(IDkey msgid)
  {
    return (_MessageHandles.remove(msgid)==null)?false:true;
  }

  bool _CloseVM()
  {

  }

  bool _RegisterPort(String name,SendPort port)
  {
    var oport=_PortMap[name];
    if (oport!=null)
      return false;
    _PortMap[name]=port;
    return true;
  }

  bool _UnregisterPort(String name)
  {
    return (_PortMap.remove(name)==null)?false:true;
  }

  bool _AddListener(IDkey msgid,String name)
  {
    var bclist=_EventMap[msgid];
    if (bclist==null)
    {
      bclist=_EventMap[msgid]=[name];
      return true;
    }
    if (bclist.contains(name))
      return false;
    bclist.add(name);
    return true;
  }

  bool _RemoveListener(IDkey msgid,String name)
  {
    var bclist=_EventMap[msgid];
    if (bclist==null)
      return false;
    return bclist.remove(name);
  }

  bool _SetStatus(String key,value)
  {
    var v=_StatusMap[key];
    if (v!=value)
    {
      _StatusMap[key]=value;
      var msg=new StatusChangedMessage()
          ..statusKey=key
          ..oldStatusValue=v
          ..newStatusValue=value;
      PostMessage(msg);
    }
    return true;
  }

  bool _UnsetStatus(String key)
  {
    var b=_StatusMap.containsKey(key);
    if (b!=true)
      return b;

    var v=_StatusMap.remove(key);
    var msg=new StatusChangedMessage()
      ..statusKey=key
      ..oldStatusValue=v
      ..newStatusValue=null;
    PostMessage(msg);
    return b;
  }


  bool PostMessage(Message msg)
  {
    if (debugPort!=null)
    {
      // msg should be tagged debug information;
      debugPort.send(msg.toMap());
    }

    if (routerPort!=null)
    {
      // msg should be tagged router information;
      routerPort.send(msg.toMap());
      return true;
    }

    var bclist=_EventMap[msg.MSGID];
    if (bclist==null)
      return false;
    var posted=false;
    bclist.forEach((name){
      var port=_PortMap[name];
      if (port!=null)
        posted=true;
        port.send(msg.toMap());
    });
    return posted;
  }

  bool OnMessage(msg)
  {
    if (msg is! Map<Symbol,dynamic>)
      return false;
    IDkey MSGID=currentMSGID=msg[Message_MSGID];
    String MSGKEY=currentMSGKEY=msg[Message_MSGKEY];
    Completer MSGCALLBACK=msg[Message_MSGCALLBACK];
    Message message=Message.FromMap(msg);

    Function func=_MessageHandles[MSGID];
    if (func==null)
    {
      if (MSGCALLBACK!=null)
      {
        MSGCALLBACK.completeError(
            (new ErrorMessage()
              ..vmAlias=this.VMAlias
              ..errorKey=ErrorMessageKey_NoMessageHandle
              ..description='No message handle'
              ..sourceMessage=message
              ..sourceMSGKEY=MSGKEY
            ).toMap());
      }
      return false;
    }
    dynamic result=null;
    try
    {
      result=func(message);
      if (MSGCALLBACK!=null)
        MSGCALLBACK.complete(
            (new CallbackMessage()
              ..vmAlias=this.VMAlias
              ..sourceMessage=message
              ..sourceMSGKEY=MSGKEY
              ..result=result
            ).toMap());
    }
    catch (e)
    {
      if (MSGCALLBACK!=null)
        MSGCALLBACK.completeError(
            (new ErrorMessage()
              ..vmAlias=this.VMAlias
              ..errorKey=ErrorMessageKey_FunctionError
              ..description=e.toString()
              ..sourceMessage=message
              ..sourceMSGKEY=MSGKEY
              ..error=e
            ).toMap());
      else
        assert(e==null);
    }
    return true;
  }
}