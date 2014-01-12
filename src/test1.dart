
import "../lib/yvm.dart" as y;
import "dart:mirrors";

class testmsg extends y.Message
{
  static final Symbol ID=reflectType(testmsg).simpleName;

  String s;
}

class testmsg2 extends y.Message
{
  static final Symbol ID=reflectType(testmsg2).simpleName;

  String s;
}


class testvm extends y.yvmbase
{
  testvm()
  {
    RegisterFunction(testmsg.ID,test);
    RegisterFunction(testmsg2.ID,test2);
  }

  String test(y.Message msg)
  {
    if (msg is testmsg)
    {
      print(VMAlias+"->"+msg.MSGKEY+'/'+((msg.s!=null)?msg.s:'NULL'));
    }
    //PostMessage(new testmsg2()..s=msg.SENDER);
    PostMessage(new testmsg()..s=new DateTime.now().millisecondsSinceEpoch.toString());
    return msg.POSTER;
  }

  String test2(y.Message msg)
  {
    if (msg is testmsg2)
    {
      print(VMAlias+"->"+msg.MSGKEY+'//'+msg.s);
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

  /*
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
  */

  /*
  vms[0].CreateVM()
    .then((ok)=>vms[1].CreateVM()
      .then((ok)=>vms[2].CreateVM()
        .then((ok)=>vms[3].CreateVM()
          .then((ok)=>vms[4].CreateVM()
            .then((ok)=>vms[5].CreateVM()
              .then((ok){
                vms[0].RegisterPort(vms[2])
                .then((ok){
                  vms[0].AddListener(testmsg2.ID, vms[2])
                    .then((ok){
                      vms[0].SendMessage(new testmsg()..s='1')
                        .then((onValue)=>print("call back=>"+onValue));
                      });
                });
              }))))));
  */

  /**
   * If the invoked callback returns a [Future] `f2` then `f` and `f2` are chained.
   * That is, `f` is completed with  the completion value of `f2`.
   */

  vms[0].CreateVM()
    .then((ok)=>vms[1].CreateVM())
    .then((ok)=>vms[2].CreateVM())
    .then((ok)=>vms[3].CreateVM())
    .then((ok)=>vms[4].CreateVM())
    .then((ok)=>vms[5].CreateVM())
    .then((ok)=>vms[0].RegisterPort(vms[2]))
    //.then((ok)=>vms[0].RegisterPort(vms[2]))
    //.then((ok)=>ok?vms[0].AddListener(testmsg2.ID,vms[2]):print('fault'))
    .then((ok)=>ok?vms[0].AddListener(testmsg.ID,vms[2]):print('fault'))
    .then((ok)=>vms[2].RegisterPort(vms[0]))
    .then((ok)=>ok?vms[2].AddListener(testmsg.ID,vms[0]):print('fault'))
    .then((ok)=>vms[0].SendMessage(new testmsg()..s=new DateTime.now().millisecondsSinceEpoch.toString()))
    .then((s)=>print("call back=>"+s));


  /*
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
  */
}

