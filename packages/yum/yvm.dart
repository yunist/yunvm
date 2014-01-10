library yvm;

import 'dart:async';
import 'dart:isolate';
import 'dart:mirrors';

part 'yvm_base.dart';
part 'yvm_helper.dart';
part 'yvm_message.dart';

create_yvm(String vmAlias,Type type,SendPort creatorPort
                             ,[Symbol constructorName=const Symbol('')
                             ,List positionalArguments=const []
                             ,Map<Symbol,dynamic> namedArguments=const {}])
{
  var initmsg=new InitMessage()
                    ..vmAlias=vmAlias
                    ..vmType=type
                    ..creatorPort=creatorPort
                    ..constructorName=constructorName
                    ..positionalArguments=positionalArguments
                    ..namedArguments=namedArguments
                    ;


  var fur=Isolate.spawn(yvm_main, initmsg);

  return fur;

}

yvm_main(msg)
{
  if (msg is InitMessage)
  {
    var creator=msg.creatorPort;
    var ctype=reflectClass(msg.vmType);
    var yvmr=ctype.newInstance(msg.constructorName, msg.positionalArguments, msg.namedArguments);
    if (yvmr!=null)
    {
      var yvm=yvmr.reflectee;
      if (yvm is yvmbase)
      {
        var vmAlias=yvm.VMAlias=msg.vmAlias;
        var creatorPort=yvm.creatorPort=msg.creatorPort;
        var myPort=yvm.myPort=new ReceivePort();

        myPort.listen((onMsg)=>yvm(onMsg));
        var rmsg=new InitResultMessage()
                  ..vmAlias=vmAlias
                  ..sourceMSGKEY=msg.MSGKEY
                  ..vmPort=myPort.sendPort
                  ;
        if (creatorPort!=null)
          creatorPort.send(rmsg);
        return;
      }
    }
    if (msg.creatorPort!=null)
    {
      var emsg=new Error_CreateVMFailedMessage()
                ..sourceMessage=msg;
      var rmsg=new InitResultMessage()
                ..sourceMSGKEY=msg.MSGKEY
                ..vmError=emsg;
      msg.creatorPort.send(rmsg);
    }
  }
}