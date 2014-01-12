
import "../lib/yvm.dart" as y;
import "dart:mirrors";

class testmsg extends y.Message
{
  static final Symbol ID=reflectType(testmsg).simpleName;

  String s;
}

class testvm extends y.yvmbase
{
  testvm()
  {
    RegisterFunction(testmsg.ID,test);
  }

  String test(y.Message msg)
  {
    if (msg is testmsg)
    {
      print(msg.MSGKEY+'/'+msg.s);
    }
    return msg.POSTER;
  }
}

class testwpr extends y.yvmWrapper
{
  testwpr([String n=null]):super(testvm,n)
  {

  }

  onMessage(y.Message msg)
  {

  }
}

main()
{
  var vms=[new testwpr('vm1'),new testwpr(),new testwpr('vm3'),new testwpr(),new testwpr('vm5'),new testwpr()];
  var i=0;
  vms.forEach((v){
    v.CreateVM()..then((ready){
      v.SendMessage(new testmsg()..s=(i++).toString())
      .then((onValue){
        print(onValue);
        v.SendMessage(new testmsg()..s=(i++).toString())
             .then((onValue){
                 print(onValue);
                 v.SendMessage(new testmsg()..s=(i++).toString())
                 .then((onValue){
                    print(onValue);
                 });
             });
      });
    });
  });
  var vm=new testwpr();
  var f1=vm.CreateVM()
      ..then((ready){
        vm.SendMessage(new testmsg()..s='1')
        .then((onValue)=>print(onValue));
        vm.SendMessage(new testmsg()..s='2')
        .then((onValue)=>print(onValue));
        vm.SendMessage(new testmsg()..s='3')
        .then((onValue)=>print(onValue));
        vm.SendMessage(new testmsg()..s='4')
        .then((onValue)=>print(onValue));

        vm..PostMessage(new testmsg()..s='a')
          ..PostMessage(new testmsg()..s='b')
          ..PostMessage(new testmsg()..s='c')
          ..PostMessage(new testmsg()..s='d')
        ;
      });
}

