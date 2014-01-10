part of yvm;

class IDkey=Symbol with IDbase,keyBase,symbolBase;

abstract class IDinterface
{
  num get uid;
}

abstract class keyInterface
{
  String get uid;
}

abstract class symbolInterface
{
  Symbol get uid;
}


abstract class IDbase implements IDinterface
{
  num _id;
  bool _hasid;
  num get uid=>_hasid?_id:_(this);
  static num _(IDbase id)
  {
    id._id=identityHashCode(id);
    id._hasid=true;
  }
}

abstract class keyBase implements keyInterface
{
  String _key;
  bool _haskey;
  String get uid=>_haskey?_key:_(this);
  static String _(keyBase key)
  {
    key._key=key.toString();
    key._haskey=true;
  }
}

abstract class symbolBase implements symbolInterface
{
  Symbol _key;
  bool _haskey;
  Symbol get uid=>_haskey?_key:_(this);
  static Symbol _(symbolBase key)
  {
    key._key=new Symbol(key.toString());
    key._haskey=true;
  }
}