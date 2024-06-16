import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hraccoon/config/route_name.dart';
import 'package:hraccoon/provider/provider.dart';
import 'package:hraccoon/view/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(
    AppProviders(
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteManager.generateRoute,
      title: 'HRaccoon',
      home: SplashPage(),
    );
  }
}