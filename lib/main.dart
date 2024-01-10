import 'package:flutter/material.dart';
import 'package:live_wallpaper_app_03/provider/splash_screen_provider.dart';
import 'package:live_wallpaper_app_03/screen/splash_screen.dart';

// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashScreenProvider(),
      child: MaterialApp(
        title: 'Live Wallpaper App',
        home: SplashScreen(),
        // other configurations
      ),
    );
  }
}

