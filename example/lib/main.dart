import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:better_navbar_responsive/better_navbar_responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _navBarHeight = 0;
  final _betterNavbarResponsivePlugin = BetterNavbarResponsive();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    int navBarHeight  = 0;

    try {
      navBarHeight = await _betterNavbarResponsivePlugin.getNavBarHeight();
      
    } on PlatformException {
      navBarHeight = 0;
    }

    if (!mounted) return;

    setState(() {
      _navBarHeight = navBarHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SizedBox(
          height: screenHeight - _navBarHeight, //bet you wont overflow now 🐩
          child: Center(
            child: Text('navBarHeight is : $_navBarHeight\n'),
          ),
        ),
      ),
    );
  }
}
