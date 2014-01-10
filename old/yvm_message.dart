part of yvm;

final Symbol Message_MSGID=_GetClassMemberSymbol(Message,'MSGID');
final Symbol Message_MSGKEY=_GetClassMemberSymbol(Message,'MSGKEY');
final Symbol Message_MSGCLASS=_GetClassMemberSymbol(Message,'MSGCLASS');
final Symbol Message_MSGCALLBACK=_GetClassMemberSymbol(Message,'MSGCALLBACK');

final Symbol InitMessage_MSGID=Message_MSGID;
final Symbol InitMessage_MSGKEY=Message_MSGKEY;
final Symbol InitMessage_MSGCLASS=Message_MSGCLASS;
final Symbol InitMessage_MSGCALLBACK=Message_MSGCALLBACK;
final Symbol InitMessage_vmAlias=_GetClassMemberSymbol(InitMessage,'vmAlias');
final Symbol InitMessage_type=_GetClassMemberSymbol(InitMessage,'type');
final Symbol InitMessage_reportPort=_GetClassMemberSymbol(InitMessage,'reportPort');
final Symbol InitMessage_constructorName=_GetClassMemberSymbol(InitMessage,'constructorName');
final Symbol InitMessage_positionalArguments=_GetClassMemberSymbol(InitMessage,'positionalArguments');
final Symbol InitMessage_namedArguments=_GetClassMemberSymbol(InitMessage,'namedArguments');
final Symbol InitMessage_completer=_GetClassMemberSymbol(InitMessage,'completer');
final Symbol InitMessage_initResult=_GetClassMemberSymbol(InitMessage,'initResult');

final Symbol InitResultMessage_MSGID=Message_MSGID;
final Symbol InitResultMessage_MSGKEY=Message_MSGKEY;
final Symbol InitResultMessage_MSGCLASS=Message_MSGCLASS;
final Symbol InitResultMessage_MSGCALLBACK=Message_MSGCALLBACK;
final Symbol InitResultMessage_sourceMSGKEY=_GetClassMemberSymbol(InitResultMessage,'sourceMSGKEY');
final Symbol InitResultMessage_vmAlias=_GetClassMemberSymbol(InitResultMessage,'vmAlias');
final Symbol InitResultMessage_vmPort=_GetClassMemberSymbol(InitResultMessage,'vmPort');
final Symbol InitResultMessage_vmError=_GetClassMemberSymbol(InitResultMessage,'vmError');

final Symbol ErrorMessage_MSGID=Message_MSGID;
final Symbol ErrorMessage_MSGKEY=Message_MSGKEY;
final Symbol ErrorMessage_MSGCLASS=Message_MSGCLASS;
final Symbol ErrorMessage_MSGCALLBACK=Message_MSGCALLBACK;
final Symbol ErrorMessage_vmAlias=_GetClassMemberSymbol(ErrorMessage,'vmAlias');
final Symbol ErrorMessage_errorKey=_GetClassMemberSymbol(ErrorMessage,'errorKey');
final Symbol ErrorMessage_description=_GetClassMemberSymbol(ErrorMessage,'description');
final Symbol ErrorMessage_sourceMessage=_GetClassMemberSymbol(ErrorMessage,'sourceMessage');
final Symbol ErrorMessage_sourceMSGKEY=_GetClassMemberSymbol(ErrorMessage,'sourceMSGKEY');
final Symbol ErrorMessage_error=_GetClassMemberSymbol(ErrorMessage,'error');

const String ErrorMessageKey_NoMessageHandle='NoMessageHandle';
const String ErrorMessageKey_FunctionError='FunctionError';

final Symbol CallbackMessage_MSGID=Message_MSGID;
final Symbol CallbackMessage_MSGKEY=Message_MSGKEY;
final Symbol CallbackMessage_MSGCLASS=Message_MSGCLASS;
final Symbol CallbackMessage_MSGCALLBACK=Message_MSGCALLBACK;
final Symbol CallbackMessage_vmAlias=_GetClassMemberSymbol(CallbackMessage,'vmAlias');
final Symbol CallbackMessage_sourceMessage=_GetClassMemberSymbol(CallbackMessage,'sourceMessage');
final Symbol CallbackMessage_sourceMSGKEY=_GetClassMemberSymbol(CallbackMessage,'sourceMSGKEY');
final Symbol CallbackMessage_result=_GetClassMemberSymbol(CallbackMessage,'result');

final Symbol VMClosingMessage_MSGID=Message_MSGID;
final Symbol VMClosingMessage_MSGKEY=Message_MSGKEY;
final Symbol VMClosingMessage_MSGCLASS=Message_MSGCLASS;
final Symbol VMClosingMessage_MSGCALLBACK=Message_MSGCALLBACK;
final Symbol VMClosingMessage_vmAlias=_GetClassMemberSymbol(VMClosingMessage,'vmAlias');
final Symbol VMClosingMessage_reasonKey=_GetClassMemberSymbol(VMClosingMessage,'reasonKey');

const String VMClosingMessageKey_WrapperClosing='WrapperClosing';

final Symbol VMClosedMessage_MSGID=Message_MSGID;
final Symbol VMClosedMessage_MSGKEY=Message_MSGKEY;
final Symbol VMClosedMessage_MSGCLASS=Message_MSGCLASS;
final Symbol VMClosedMessage_MSGCALLBACK=Message_MSGCALLBACK;
final Symbol VMClosedMessage_vmAlias=_GetClassMemberSymbol(VMClosedMessage,'vmAlias');
final Symbol VMClosedMessage_sourceMessage=_GetClassMemberSymbol(VMClosedMessage,'sourceMessage');
final Symbol VMClosedMessage_sourceMSGKEY=_GetClassMemberSymbol(VMClosedMessage,'sourceMSGKEY');

final Symbol RegisterPortMessage_MSGID=Message_MSGID;
final Symbol RegisterPortMessage_MSGKEY=Message_MSGKEY;
final Symbol RegisterPortMessage_MSGCLASS=Message_MSGCLASS;
final Symbol RegisterPortMessage_MSGCALLBACK=Message_MSGCALLBACK;
final Symbol RegisterPortMessage_aliasName=_GetClassMemberSymbol(RegisterPortMessage,'aliasName');
final Symbol RegisterPortMessage_vmPort=_GetClassMemberSymbol(RegisterPortMessage,'vmPort');

final Symbol UnregisterPortMessage_MSGID=Message_MSGID;
final Symbol UnregisterPortMessage_MSGKEY=Message_MSGKEY;
final Symbol UnregisterPortMessage_MSGCLASS=Message_MSGCLASS;
final Symbol UnregisterPortMessage_MSGCALLBACK=Message_MSGCALLBACK;
final Symbol UnregisterPortMessage_aliasName=_GetClassMemberSymbol(UnregisterPortMessage,'aliasName');

final Symbol AddListenerMessage_MSGID=Message_MSGID;
final Symbol AddListenerMessage_MSGKEY=Message_MSGKEY;
final Symbol AddListenerMessage_MSGCLASS=Message_MSGCLASS;
final Symbol AddListenerMessage_MSGCALLBACK=Message_MSGCALLBACK;
final Symbol AddListenerMessage_messageID=_GetClassMemberSymbol(AddListenerMessage,'messageID');
final Symbol AddListenerMessage_aliasName=_GetClassMemberSymbol(AddListenerMessage,'aliasName');

final Symbol RemoveListenerMessage_MSGID=Message_MSGID;
final Symbol RemoveListenerMessage_MSGKEY=Message_MSGKEY;
final Symbol RemoveListenerMessage_MSGCLASS=Message_MSGCLASS;
final Symbol RemoveListenerMessage_MSGCALLBACK=Message_MSGCALLBACK;
final Symbol RemoveListenerMessage_messageID=_GetClassMemberSymbol(RemoveListenerMessage,'messageID');
final Symbol RemoveListenerMessage_aliasName=_GetClassMemberSymbol(RemoveListenerMessage,'aliasName');

final Symbol SetStatusMessage_MSGID=Message_MSGID;
final Symbol SetStatusMessage_MSGKEY=Message_MSGKEY;
final Symbol SetStatusMessage_MSGCLASS=Message_MSGCLASS;
final Symbol SetStatusMessage_MSGCALLBACK=Message_MSGCALLBACK;
final Symbol SetStatusMessage_statusKey=_GetClassMemberSymbol(SetStatusMessage,'statusKey');
final Symbol SetStatusMessage_statusValue=_GetClassMemberSymbol(SetStatusMessage,'statusValue');

final Symbol UnsetStatusMessage_MSGID=Message_MSGID;
final Symbol UnsetStatusMessage_MSGKEY=Message_MSGKEY;
final Symbol UnsetStatusMessage_MSGCLASS=Message_MSGCLASS;
final Symbol UnsetStatusMessage_MSGCALLBACK=Message_MSGCALLBACK;
final Symbol UnsetStatusMessage_statusKey=_GetClassMemberSymbol(UnsetStatusMessage,'statusKey');

final Symbol StatusChangedMessage_MSGID=Message_MSGID;
final Symbol StatusChangedMessage_MSGKEY=Message_MSGKEY;
final Symbol StatusChangedMessage_MSGCLASS=Message_MSGCLASS;
final Symbol StatusChangedMessage_MSGCALLBACK=Message_MSGCALLBACK;
final Symbol StatusChangedMessage_statusKey=_GetClassMemberSymbol(StatusChangedMessage,'statusKey');
final Symbol StatusChangedMessage_oldStatusValue=_GetClassMemberSymbol(StatusChangedMessage,'oldStatusValue');
final Symbol StatusChangedMessage_newStatusValue=_GetClassMemberSymbol(StatusChangedMessage,'newStatusValue');

Symbol _GetClassMemberSymbol(Type type,String name)
{
  var mtype=reflectClass(type);
  for (Symbol sym in mtype.declarations.keys)
    if (sym.toString==name)
      return sym;
  return null;
}

abstract class Message
{
  IDkey MSGID;
  String MSGKEY;
  ClassMirror MSGCLASS;
  Completer MSGCALLBACK;

  Map<Symbol,dynamic> toMap();
  dynamic fromMap(Map<Symbol,dynamic> map);
  static dynamic FromMap(Map<Symbol,dynamic> map)
  {
    var msgclass=map[Message_MSGCLASS];
    if (msgclass is ClassMirror)
    {
      var mclass=msgclass.newInstance(const Symbol(''),[]);
      var msg=mclass.reflectee;
      if (msg is Message)
        return msg.fromMap(map);
    }

    return null;
  }
}

class InitMessage extends Message
{
  static int _keySerial=0;
  static Symbol SimpleName=reflectType(InitMessage).simpleName;
  final IDkey MSGID=SimpleName;
  final String MSGKEY=SimpleName.toString()+':'
      +((_keySerial<0xFFFFFFFF)?(++_keySerial):1).toString();
  ClassMirror MSGCLASS=reflectClass(InitMessage);

  String vmAlias;
  Type type;
  SendPort reportPort;
  Symbol constructorName;
  List positionalArguments;
  Map<Symbol,dynamic> namedArguments;
  Completer completer;
  Map<Symbol,dynamic> initResult;

  Map<Symbol,dynamic> toMap()
  {
    return {
      InitMessage_MSGID:MSGID,
      InitMessage_MSGKEY:MSGKEY,
      InitMessage_MSGCLASS:MSGCLASS,
      InitMessage_MSGCALLBACK:MSGCALLBACK,
      InitMessage_vmAlias:vmAlias,
      InitMessage_type:type,
      InitMessage_reportPort:reportPort,
      InitMessage_constructorName:constructorName,
      InitMessage_positionalArguments:positionalArguments,
      InitMessage_namedArguments:namedArguments,
      InitMessage_completer:completer,
      InitMessage_initResult:initResult
    };
  }
  dynamic fromMap(Map<Symbol,dynamic> map)
  {
    return new InitMessage()
      ..vmAlias=map[InitMessage_vmAlias]
      ..type=map[InitMessage_type]
      ..reportPort=map[InitMessage_reportPort]
      ..constructorName=map[InitMessage_constructorName]
      ..positionalArguments=map[InitMessage_positionalArguments]
      ..namedArguments=map[InitMessage_namedArguments]
      ..completer=map[InitMessage_completer]
      ..initResult=map[InitMessage_initResult]
    ;
  }
}

class InitResultMessage extends Message
{
  static int _keySerial=0;
  static Symbol SimpleName=reflectType(InitResultMessage).simpleName;
  final IDkey MSGID=SimpleName;
  final String MSGKEY=SimpleName.toString()+':'
      +((_keySerial<0xFFFFFFFF)?(++_keySerial):1).toString();
  ClassMirror MSGCLASS=reflectClass(InitResultMessage);

  String sourceMSGKEY;
  String vmAlias;
  SendPort vmPort;
  dynamic vmError;

  Map<Symbol,dynamic> toMap()
  {
    return {
      InitResultMessage_MSGID:MSGID,
      InitResultMessage_MSGKEY:MSGKEY,
      InitResultMessage_MSGCLASS:MSGCLASS,
      InitResultMessage_MSGCALLBACK:MSGCALLBACK,
      InitResultMessage_sourceMSGKEY:sourceMSGKEY,
      InitResultMessage_vmAlias:vmAlias,
      InitResultMessage_vmPort:vmPort,
      InitResultMessage_vmError:vmError,
    };
  }
  dynamic fromMap(Map<Symbol,dynamic> map)
  {
    return new InitResultMessage()
      ..sourceMSGKEY=map[InitResultMessage_sourceMSGKEY]
      ..vmAlias=map[InitResultMessage_vmAlias]
      ..vmPort=map[InitResultMessage_vmPort]
      ..vmError=map[InitResultMessage_vmError]
    ;
  }
}

class ErrorMessage extends Message
{
  static int _keySerial=0;
  static Symbol SimpleName=reflectType(ErrorMessage).simpleName;
  final IDkey MSGID=SimpleName;
  final String MSGKEY=SimpleName.toString()+':'
      +((_keySerial<0xFFFFFFFF)?(++_keySerial):1).toString();
  ClassMirror MSGCLASS=reflectClass(ErrorMessage);

  String vmAlias;
  String errorKey;
  String description;
  Message sourceMessage;
  String sourceMSGKEY;
  dynamic error;

  Map<Symbol,dynamic> toMap()
  {
    return {
      ErrorMessage_MSGID:MSGID,
      ErrorMessage_MSGKEY:MSGKEY,
      ErrorMessage_MSGCLASS:MSGCLASS,
      ErrorMessage_MSGCALLBACK:MSGCALLBACK,
      ErrorMessage_vmAlias:vmAlias,
      ErrorMessage_errorKey:errorKey,
      ErrorMessage_description:description,
      ErrorMessage_sourceMessage:sourceMessage.toMap(),
      ErrorMessage_sourceMSGKEY:sourceMSGKEY,
      ErrorMessage_error:error,
    };
  }
  dynamic fromMap(Map<Symbol,dynamic> map)
  {
    return new ErrorMessage()
      ..vmAlias=map[ErrorMessage_vmAlias]
      ..errorKey=map[ErrorMessage_errorKey]
      ..description=map[ErrorMessage_description]
      ..sourceMessage=Message.FromMap(map[ErrorMessage_sourceMessage])
      ..sourceMSGKEY=map[ErrorMessage_sourceMSGKEY]
      ..error=map[ErrorMessage_error]
    ;
  }
}


class CallbackMessage extends Message
{
  static int _keySerial=0;
  static Symbol SimpleName=reflectType(CallbackMessage).simpleName;
  final IDkey MSGID=SimpleName;
  final String MSGKEY=SimpleName.toString()+':'
      +((_keySerial<0xFFFFFFFF)?(++_keySerial):1).toString();
  ClassMirror MSGCLASS=reflectClass(CallbackMessage);

  String vmAlias;
  Message sourceMessage;
  String sourceMSGKEY;
  dynamic result;

  Map<Symbol,dynamic> toMap()
  {
    return {
      CallbackMessage_MSGID:MSGID,
      CallbackMessage_MSGKEY:MSGKEY,
      CallbackMessage_MSGCLASS:MSGCLASS,
      CallbackMessage_MSGCALLBACK:MSGCALLBACK,
      CallbackMessage_vmAlias:vmAlias,
      CallbackMessage_sourceMessage:sourceMessage.toMap(),
      CallbackMessage_sourceMSGKEY:sourceMSGKEY,
      CallbackMessage_result:result,
    };
  }
  dynamic fromMap(Map<Symbol,dynamic> map)
  {
    return new CallbackMessage()
      ..vmAlias=map[CallbackMessage_vmAlias]
      ..sourceMessage=Message.FromMap(map[CallbackMessage_sourceMessage])
      ..sourceMSGKEY=map[CallbackMessage_sourceMSGKEY]
      ..result=map[CallbackMessage_result]
    ;
  }
}

class VMClosingMessage extends Message
{
  static int _keySerial=0;
  static Symbol SimpleName=reflectType(VMClosingMessage).simpleName;
  final IDkey MSGID=SimpleName;
  final String MSGKEY=SimpleName.toString()+':'
      +((_keySerial<0xFFFFFFFF)?(++_keySerial):1).toString();
  ClassMirror MSGCLASS=reflectClass(VMClosingMessage);

  String vmAlias;
  String reasonKey;

  Map<Symbol,dynamic> toMap()
  {
    return {
      VMClosingMessage_MSGID:MSGID,
      VMClosingMessage_MSGKEY:MSGKEY,
      VMClosingMessage_MSGCLASS:MSGCLASS,
      VMClosingMessage_MSGCALLBACK:MSGCALLBACK,
      VMClosingMessage_vmAlias:vmAlias,
      VMClosingMessage_reasonKey:reasonKey,
    };
  }
  dynamic fromMap(Map<Symbol,dynamic> map)
  {
    return new VMClosingMessage()
      ..vmAlias=map[VMClosingMessage_vmAlias]
      ..reasonKey=map[VMClosingMessage_reasonKey]
    ;
  }
}

class VMClosedMessage extends Message
{
  static int _keySerial=0;
  static Symbol SimpleName=reflectType(VMClosedMessage).simpleName;
  final IDkey MSGID=SimpleName;
  final String MSGKEY=SimpleName.toString()+':'
      +((_keySerial<0xFFFFFFFF)?(++_keySerial):1).toString();
  ClassMirror MSGCLASS=reflectClass(VMClosedMessage);

  String vmAlias;
  Message sourceMessage;
  String sourceMSGKEY;

  Map<Symbol,dynamic> toMap()
  {
    return {
      VMClosedMessage_MSGID:MSGID,
      VMClosedMessage_MSGKEY:MSGKEY,
      VMClosedMessage_MSGCLASS:MSGCLASS,
      VMClosedMessage_MSGCALLBACK:MSGCALLBACK,
      VMClosedMessage_vmAlias:vmAlias,
      VMClosedMessage_sourceMessage:sourceMessage.toMap(),
      VMClosedMessage_sourceMSGKEY:sourceMSGKEY,
    };
  }
  dynamic fromMap(Map<Symbol,dynamic> map)
  {
    return new VMClosedMessage()
      ..vmAlias=map[VMClosedMessage_vmAlias]
      ..sourceMessage=Message.FromMap(map[VMClosedMessage_sourceMessage])
      ..sourceMSGKEY=map[VMClosedMessage_sourceMSGKEY]
    ;
  }
}

class RegisterPortMessage extends Message
{
  static int _keySerial=0;
  static Symbol SimpleName=reflectType(RegisterPortMessage).simpleName;
  final IDkey MSGID=SimpleName;
  final String MSGKEY=SimpleName.toString()+':'
      +((_keySerial<0xFFFFFFFF)?(++_keySerial):1).toString();
  ClassMirror MSGCLASS=reflectClass(RegisterPortMessage);

  String aliasName;
  SendPort vmPort;

  Map<Symbol,dynamic> toMap()
  {
    return {
      RegisterPortMessage_MSGID:MSGID,
      RegisterPortMessage_MSGKEY:MSGKEY,
      RegisterPortMessage_MSGCLASS:MSGCLASS,
      RegisterPortMessage_MSGCALLBACK:MSGCALLBACK,
      RegisterPortMessage_aliasName:aliasName,
      RegisterPortMessage_vmPort:vmPort,
    };
  }
  dynamic fromMap(Map<Symbol,dynamic> map)
  {
    return new RegisterPortMessage()
      ..aliasName=map[RegisterPortMessage_aliasName]
      ..vmPort=map[RegisterPortMessage_vmPort]
    ;
  }
}

class UnregisterPortMessage extends Message
{
  static int _keySerial=0;
  static Symbol SimpleName=reflectType(UnregisterPortMessage).simpleName;
  final IDkey MSGID=SimpleName;
  final String MSGKEY=SimpleName.toString()+':'
      +((_keySerial<0xFFFFFFFF)?(++_keySerial):1).toString();
  ClassMirror MSGCLASS=reflectClass(UnregisterPortMessage);

  String aliasName;

  Map<Symbol,dynamic> toMap()
  {
    return {
      UnregisterPortMessage_MSGID:MSGID,
      UnregisterPortMessage_MSGKEY:MSGKEY,
      UnregisterPortMessage_MSGCLASS:MSGCLASS,
      UnregisterPortMessage_MSGCALLBACK:MSGCALLBACK,
      UnregisterPortMessage_aliasName:aliasName,
    };
  }
  dynamic fromMap(Map<Symbol,dynamic> map)
  {
    return new UnregisterPortMessage()
      ..aliasName=map[UnregisterPortMessage_aliasName]
    ;
  }
}

class AddListenerMessage extends Message
{
  static int _keySerial=0;
  static Symbol SimpleName=reflectType(AddListenerMessage).simpleName;
  final IDkey MSGID=SimpleName;
  final String MSGKEY=SimpleName.toString()+':'
      +((_keySerial<0xFFFFFFFF)?(++_keySerial):1).toString();
  ClassMirror MSGCLASS=reflectClass(AddListenerMessage);

  IDkey messageID;
  String aliasName;

  Map<Symbol,dynamic> toMap()
  {
    return {
      AddListenerMessage_MSGID:MSGID,
      AddListenerMessage_MSGKEY:MSGKEY,
      AddListenerMessage_MSGCLASS:MSGCLASS,
      AddListenerMessage_MSGCALLBACK:MSGCALLBACK,
      AddListenerMessage_messageID:messageID,
      AddListenerMessage_aliasName:aliasName,
    };
  }
  dynamic fromMap(Map<Symbol,dynamic> map)
  {
    return new AddListenerMessage()
      ..messageID=map[AddListenerMessage_messageID]
      ..aliasName=map[AddListenerMessage_aliasName]
    ;
  }
}

class RemoveListenerMessage extends Message
{
  static int _keySerial=0;
  static Symbol SimpleName=reflectType(RemoveListenerMessage).simpleName;
  final IDkey MSGID=SimpleName;
  final String MSGKEY=SimpleName.toString()+':'
      +((_keySerial<0xFFFFFFFF)?(++_keySerial):1).toString();
  ClassMirror MSGCLASS=reflectClass(RemoveListenerMessage);

  IDkey messageID;
  String aliasName;

  Map<Symbol,dynamic> toMap()
  {
    return {
      RemoveListenerMessage_MSGID:MSGID,
      RemoveListenerMessage_MSGKEY:MSGKEY,
      RemoveListenerMessage_MSGCLASS:MSGCLASS,
      RemoveListenerMessage_MSGCALLBACK:MSGCALLBACK,
      RemoveListenerMessage_messageID:messageID,
      RemoveListenerMessage_aliasName:aliasName,
    };
  }
  dynamic fromMap(Map<Symbol,dynamic> map)
  {
    return new RemoveListenerMessage()
      ..messageID=map[RemoveListenerMessage_messageID]
      ..aliasName=map[RemoveListenerMessage_aliasName]
    ;
  }
}

class SetStatusMessage extends Message
{
  static int _keySerial=0;
  static Symbol SimpleName=reflectType(SetStatusMessage).simpleName;
  final IDkey MSGID=SimpleName;
  final String MSGKEY=SimpleName.toString()+':'
      +((_keySerial<0xFFFFFFFF)?(++_keySerial):1).toString();
  ClassMirror MSGCLASS=reflectClass(SetStatusMessage);

  String statusKey;
  dynamic statusValue;

  Map<Symbol,dynamic> toMap()
  {
    return {
      SetStatusMessage_MSGID:MSGID,
      SetStatusMessage_MSGKEY:MSGKEY,
      SetStatusMessage_MSGCLASS:MSGCLASS,
      SetStatusMessage_MSGCALLBACK:MSGCALLBACK,
      SetStatusMessage_statusKey:statusKey,
      SetStatusMessage_statusValue:statusValue,
    };
  }
  dynamic fromMap(Map<Symbol,dynamic> map)
  {
    return new SetStatusMessage()
      ..statusKey=map[SetStatusMessage_statusKey]
      ..statusValue=map[SetStatusMessage_statusValue]
    ;
  }
}

class UnsetStatusMessage extends Message
{
  static int _keySerial=0;
  static Symbol SimpleName=reflectType(UnsetStatusMessage).simpleName;
  final IDkey MSGID=SimpleName;
  final String MSGKEY=SimpleName.toString()+':'
      +((_keySerial<0xFFFFFFFF)?(++_keySerial):1).toString();
  ClassMirror MSGCLASS=reflectClass(UnsetStatusMessage);

  String statusKey;

  Map<Symbol,dynamic> toMap()
  {
    return {
      UnsetStatusMessage_MSGID:MSGID,
      UnsetStatusMessage_MSGKEY:MSGKEY,
      UnsetStatusMessage_MSGCLASS:MSGCLASS,
      UnsetStatusMessage_MSGCALLBACK:MSGCALLBACK,
      UnsetStatusMessage_statusKey:statusKey,
    };
  }
  dynamic fromMap(Map<Symbol,dynamic> map)
  {
    return new UnsetStatusMessage()
      ..statusKey=map[UnsetStatusMessage_statusKey]
    ;
  }
}

class StatusChangedMessage extends Message
{
  static int _keySerial=0;
  static Symbol SimpleName=reflectType(StatusChangedMessage).simpleName;
  final IDkey MSGID=SimpleName;
  final String MSGKEY=SimpleName.toString()+':'
      +((_keySerial<0xFFFFFFFF)?(++_keySerial):1).toString();
  ClassMirror MSGCLASS=reflectClass(StatusChangedMessage);

  String statusKey;
  dynamic oldStatusValue;
  dynamic newStatusValue;

  Map<Symbol,dynamic> toMap()
  {
    return {
      StatusChangedMessage_MSGID:MSGID,
      StatusChangedMessage_MSGKEY:MSGKEY,
      StatusChangedMessage_MSGCLASS:MSGCLASS,
      StatusChangedMessage_MSGCALLBACK:MSGCALLBACK,
      StatusChangedMessage_statusKey:statusKey,
      StatusChangedMessage_oldStatusValue:oldStatusValue,
      StatusChangedMessage_newStatusValue:newStatusValue,
    };
  }
  dynamic fromMap(Map<Symbol,dynamic> map)
  {
    return new StatusChangedMessage()
      ..statusKey=map[StatusChangedMessage_statusKey]
      ..oldStatusValue=map[StatusChangedMessage_oldStatusValue]
      ..newStatusValue=map[StatusChangedMessage_newStatusValue]
    ;
  }
}