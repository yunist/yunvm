library yvm;

import 'dart:async';
import 'dart:isolate';
import 'dart:mirrors';

part 'yvm_base.dart';
part 'yvm_helper.dart';
part 'yvm_message.dart';
part 'yvm_idkey.dart';

Future<Map<Symbol,dynamic>> create_yvm(String vmAlias,Type type,SendPort reportPort
                             ,[Symbol constructorName=const Symbol('')
                             ,List positionalArguments=const []
                             ,Map<Symbol,dynamic> namedArguments=const {}])
{
  var completer=new Completer<Map<Symbol,dynamic>>();
  var initResult=new InitResultMessage();
  var initmsg=new InitMessage()
                    ..vmAlias=vmAlias
                    ..type=type
                    ..reportPort=reportPort
                    ..constructorName=constructorName
                    ..positionalArguments=positionalArguments
                    ..namedArguments=namedArguments
                    ..completer=completer
                    ..initResult=initResult.toMap()
                    ;


  Future<Isolate> fur=Isolate.spawn(yvm_main, initmsg.toMap())
                    ..catchError((onError){
                      initResult..sourceMSGKEY=initmsg.MSGKEY
                                ..vmAlias=initmsg.vmAlias
                                ..vmPort=null
                                ..vmError=onError;
                      completer.completeError(initResult);
                    });
  return completer.future;
}

void yvm_main(Map<Symbol,dynamic> initmsg)
{
  String vmAlias=initmsg[InitMessage_vmAlias];
  Type type=initmsg[InitMessage_type];
  SendPort reportPort=initmsg[InitMessage_reportPort];
  Symbol constructorName=initmsg[InitMessage_constructorName];
  List positionalArguments=initmsg[InitMessage_positionalArguments];
  Map<Symbol,dynamic> namedArguments=initmsg[InitMessage_namedArguments];
  Completer<Map<Symbol,dynamic>> completer=initmsg[InitMessage_completer];
  Map<Symbol,dynamic> initResult=initmsg[InitMessage_initResult];

  initResult[InitResultMessage_sourceMSGKEY]=initmsg[InitMessage_MSGKEY];
  initResult[InitResultMessage_vmAlias]=vmAlias;
  initResult[InitResultMessage_vmPort]=null;

  ClassMirror ctype=reflectClass(type);
  var yvm=ctype.newInstance(constructorName, positionalArguments, namedArguments);

  if (yvm is yvmbase)
  {
    yvm.VMAlias=vmAlias;
    ReceivePort myPort=new ReceivePort();
    myPort.listen((msg)=>yvm.OnMessage(msg));
    initResult[InitResultMessage_vmPort]=myPort;
  }

  completer.complete(initResult);
}

