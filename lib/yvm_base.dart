part of yvm;

abstract class yvmbase
{
  Map<IDkey,List<String>> _EventMap={};
  Map<String,SendPort> _PortMap={};

  Map<IDkey,Function> _MessageHandles={};
  String VMAlias;

  bool RegisterFunction(IDkey msgid,Function func)
  {
    var ofunc=_MessageHandles[msgid];
    if (ofunc!=null)
      return false;
    _MessageHandles[msgid]=func;
    return true;
  }

  bool UnRegisterFunction(IDkey msgid)
  {
    return (_MessageHandles.remove(msgid)==null)?false:true;
  }

  bool _RegisterPort(String name,SendPort port)
  {
    var oport=_PortMap[name];
    if (oport!=null)
      return false;
    _PortMap[name]=port;
    return true;
  }

  bool _UnRegisterPort(String name)
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

  bool PostMessage(Message msg)
  {
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
    IDkey MSGID=msg[Message_MSGID];
    String MSGKEY=msg[Message_MSGKEY];
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