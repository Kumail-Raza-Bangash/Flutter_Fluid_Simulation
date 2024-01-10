import 'package:flutter/material.dart';
import 'package:live_wallpaper_app_03/screen/screen_a.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:live_wallpaper_app_03/provider/splash_screen_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashScreenProvider(),
      builder: (context, _) {
        return Consumer<SplashScreenProvider>(
          builder: (context, provider, _) {
            bool isVideoInitialized = provider.videoController.value.isInitialized;

            // Start a timer to navigate after 7 seconds
            if (!isVideoInitialized) {
              Future.delayed(Duration(seconds: 7), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenA()),
                );
              });
            }

            return Scaffold(
              body: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  if (isVideoInitialized)
                    FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: provider.videoController.value.size.width,
                        height: provider.videoController.value.size.height,
                        child: VideoPlayer(provider.videoController),
                      ),
                    ),
                  if (!isVideoInitialized)
                    Center(child: CircularProgressIndicator()),

                  // Add other widgets like Text overlays, etc.
                  if (!isVideoInitialized)
                    Center(
                      child: Text(
                        'Your Text Overlay',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
