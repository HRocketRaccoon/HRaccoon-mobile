import 'package:flutter/material.dart';
import 'package:hraccoon/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: child,
    );
  }
}
