part of yvm;

abstract class yvmbase
{
  static const Key_Port_Creator='##creator#';
  static const Key_Port_Owner='##owner#';
  static const Key_Port_Router='##router#';
  static const Key_Port_Debugger='##debugger#';

  Map<Symbol,List<String>> _EventMap={
    StatusChangedMessage.ID:[Key_Port_Creator,],

  };
  Map<String,SendPort> _PortMap={
    Key_Port_Creator:null,
    Key_Port_Owner:null,
    Key_Port_Router:null,
    Key_Port_Debugger:null,
  };

  Map<String,dynamic> _StatusMap={};

  Map<Symbol,Function> _MessageHandles={};

  String VMAlias;
  ReceivePort myPort;

  SendPort _creatorPort=null;
  SendPort get creatorPort=>_creatorPort;
  void set creatorPort(SendPort port){if(_creatorPort==null) _creatorPort=_PortMap[Key_Port_Creator]=port;}
  SendPort get ownerPort=>_PortMap[Key_Port_Owner];
  void set ownerPort(SendPort port){_PortMap[Key_Port_Owner]=port;}
  SendPort get routerPort=>_PortMap[Key_Port_Router];
  void set routerPort(SendPort port){_PortMap[Key_Port_Router]=port;}
  SendPort get debuggerPort=>_PortMap[Key_Port_Debugger];
  void set debuggerPort(SendPort port){_PortMap[Key_Port_Debugger]=port;}

  Message currentMessage;


  bool RegisterFunction(Symbol msgid,Function func)
  {
    var ofunc=_MessageHandles[msgid];
    if (ofunc!=null)
      return false;
    _MessageHandles[msgid]=func;
    return true;
  }

  bool UnregisterFunction(Symbol msgid)
  {
    return (_MessageHandles.remove(msgid)==null)?false:true;
  }

  bool _CloseVM()
  {

  }

  bool _RegisterPort(String name,SendPort port)
  {
    if (name==Key_Port_Creator) return false;
    var oport=_PortMap[name];
    if (oport!=null)
      return false;
    _PortMap[name]=port;
    return true;
  }

  bool _UnregisterPort(String name)
  {
    if (name==Key_Port_Creator) return false;
    return (_PortMap.remove(name)==null)?false:true;
  }

  bool _AddListener(Symbol msgid,String name)
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

  bool _RemoveListener(Symbol msgid,String name)
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
    msg.POSTER=VMAlias;
    if (debuggerPort!=null)
    {
      // msg should be tagged debug information;
      debuggerPort.send(msg);
    }

    if (routerPort!=null)
    {
      // msg should be tagged router information;
      routerPort.send(msg);
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
        port.send(msg);
    });

    return posted;
  }

  void onMessage(msg)
  {
    if (msg is Message)
    {
      Message resultmsg;
      currentMessage=msg;
      Function func=_MessageHandles[msg.MSGID];
      if (func!=null)
      {
        try {
          resultmsg=new CallbackMessage()
                    ..vmAlias=VMAlias
                    ..sourceMSGKEY=msg.MSGKEY
                    ..result=func(msg)
                    ;
        } catch(e) {
          resultmsg=new Error_VMCallFailedMessage()
                    ..vmAlias=VMAlias
                    ..sourceMessage=msg
                    ;
        }
      } else {
        resultmsg=new Error_VMNoneHandleMessage()
                  ..vmAlias=VMAlias
                  ..sourceMessage=msg
                  ;
      }

      resultmsg.POSTER=VMAlias;

      var caller=msg.SENDER;
      if (caller!=null)
      {
        var cport=_PortMap[caller];
        if (cport!=null)
          cport.send(resultmsg);
      }
    }
  }

  call(msg)=>onMessage(msg);
}