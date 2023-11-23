import 'package:flutter/widgets.dart' show Widget, BuildContext;
import 'package:mudanzaya/firebase_auth_implements/firebase_login.dart';
import 'package:mudanzaya/firebase_auth_implements/firebase_registrarse.dart';
import 'package:mudanzaya/ui/page/index.dart';
import 'package:mudanzaya/ui/page/perfil.dart';
import '../page/home.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes =>{
    Routes.inicio:(_) => const Index(selectcurrentwidget: Home(),dashindex: 0,), 
    Routes.success:(_) => const Index(selectcurrentwidget: Perfil(),dashindex: 2,),
    Routes.login:(_) =>  const Login(),
    Routes.registrar:(_) => const SignUp(),
    Routes.home:(_) => const Home(),
};