import 'package:flutter/material.dart';
import 'package:hraccoon/viewmodel/dummy_vm.dart';
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DummyViewModel()),
      ],
      child: child,
    );
  }
}
