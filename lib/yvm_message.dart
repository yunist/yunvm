part of yvm;

abstract class Message
{
  static int _serialKey=0;
  static final Symbol ID=reflectType(Message).simpleName;
  Symbol MSGID;
  String MSGKEY;
  Type MSGTYPE;
  String SENDER;
  String POSTER;

  Message([this.MSGKEY])
  {
    if (MSGTYPE==null)
      MSGTYPE=this.runtimeType;
    if (MSGID==null)
      MSGID=reflectType(MSGTYPE).simpleName;
    if (MSGKEY==null)
      MSGKEY=MirrorSystem.getName(MSGID)+':'+((_serialKey<0x7FFFFFFFFFFFFFFF)?(++_serialKey):(_serialKey=1)).toString();
  }
}

class InitMessage extends Message
{
  static final Symbol ID=reflectType(InitMessage).simpleName;
  String vmAlias;
  Type vmType;
  SendPort creatorPort;
  Symbol constructorName;
  List positionalArguments;
  Map<Symbol,dynamic> namedArguments;
}

class InitResultMessage extends Message
{
  static final Symbol ID=reflectType(InitResultMessage).simpleName;
  String sourceMSGKEY;
  String vmAlias;
  SendPort vmPort;
  ErrorMessage vmError;
}

class ErrorMessage extends Message
{
  static final Symbol ID=reflectType(ErrorMessage).simpleName;
  static const String DESC='Error';
  String vmAlias;
  String errorKey;
  String description=DESC;
  Message sourceMessage;

  ErrorMessage([this.errorKey])
  {
    if (errorKey==null)
    {
      var msgid=MirrorSystem.getName(MSGID).toUpperCase();
      var id=MirrorSystem.getName(Message.ID).toUpperCase();
      errorKey=(msgid.endsWith(id)?msgid.substring(0, msgid.length-id.length):msgid);
    }
    if (description==null)
    {
      var msgid=MirrorSystem.getName(MSGID);
      description=msgid;
    }
  }
}

class Error_CreateVMFailedMessage extends ErrorMessage
{
  static final Symbol ID=reflectType(Error_CreateVMFailedMessage).simpleName;
}

class Error_VMCallFailedMessage extends ErrorMessage
{
  static final Symbol ID=reflectType(Error_VMCallFailedMessage).simpleName;
}

class Error_VMNoneHandleMessage extends ErrorMessage
{
  static final Symbol ID=reflectType(Error_VMNoneHandleMessage).simpleName;
}


class CallbackMessage extends Message
{
  static final Symbol ID=reflectType(CallbackMessage).simpleName;
  String vmAlias;
  String sourceMSGKEY;
  dynamic result;
}


class StatusChangedMessage extends Message
{
  static final Symbol ID=reflectType(StatusChangedMessage).simpleName;
  String statusKey;
  dynamic oldStatusValue;
  dynamic newStatusValue;
}

class VMClosingMessage extends Message
{
  static final Symbol ID=reflectType(VMClosingMessage).simpleName;

  static const String reasonKey_WrapperClosing='WrapperClosing';

  String vmAlias;
  String reasonKey;
}

class VMClosedMessage extends Message
{
  static final Symbol ID=reflectType(VMClosedMessage).simpleName;
  String vmAlias;
  Message sourceMessage;
}

class RegisterPortMessage extends Message
{
  static final Symbol ID=reflectType(RegisterPortMessage).simpleName;
  String aliasName;
  SendPort vmPort;
}

class UnregisterPortMessage extends Message
{
  static final Symbol ID=reflectType(UnregisterPortMessage).simpleName;
  String aliasName;
}

class AddListenerMessage extends Message
{
  static final Symbol ID=reflectType(AddListenerMessage).simpleName;
  Symbol messageID;
  String aliasName;
}

class RemoveListenerMessage extends Message
{
  static final Symbol ID=reflectType(RemoveListenerMessage).simpleName;
  Symbol messageID;
  String aliasName;
}

class SetStatusMessage extends Message
{
  static final Symbol ID=reflectType(SetStatusMessage).simpleName;
  String statusKey;
  dynamic statusValue;
}

class UnsetStatusMessage extends Message
{
  static final Symbol ID=reflectType(UnsetStatusMessage).simpleName;
  String statusKey;
}