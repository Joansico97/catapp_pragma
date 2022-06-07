import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'routes/router.dart';

main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const CatApp());
}

class CatApp extends StatefulWidget {
  const CatApp({Key? key}) : super(key: key);

  @override
  State<CatApp> createState() => _CatAppState();
}

class _CatAppState extends State<CatApp> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Catapp',
      debugShowCheckedModeBanner: false,
      routeInformationParser: RouterConfig.router.routeInformationParser,
      routerDelegate: RouterConfig.router.routerDelegate,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
