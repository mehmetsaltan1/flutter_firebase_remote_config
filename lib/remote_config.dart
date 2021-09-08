import 'package:flutter/material.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FireBaseRemoteConfig extends StatefulWidget {
  FireBaseRemoteConfig({Key? key}) : super(key: key);

  @override
  _FireBaseRemoteConfigState createState() => _FireBaseRemoteConfigState();
}

class _FireBaseRemoteConfigState extends State<FireBaseRemoteConfig> {
 String kullaniciadi="";
 String sifre="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((a) async {
      final remoteconfig = await RemoteConfig.instance;
     final defaults=<String,dynamic>{
       'kullaniciadi':'varsayilankullaniciadi',
       'sifre':'varsayilansifre'
     };
     setState(() {
       kullaniciadi=defaults['kullaniciadi'];
       sifre=defaults['sifre'];
     });
     await remoteconfig.fetch();
     await remoteconfig.fetchAndActivate();
     setState(() {
       kullaniciadi=remoteconfig.getString('kullaniciadi');
       sifre=remoteconfig.getString('sifre');
     });
     });
  }
  @override
  Widget build(BuildContext context) {

    return Column(
       children: [
         Text('Kullanıcı Adı: ${kullaniciadi}'),
         Text('Şİfre: ${sifre}'),
       ],
    );
  }
}