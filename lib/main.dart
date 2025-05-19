
import 'package:erohub/Screens/Homescreen/Homescreen.dart';
import 'package:erohub/Screens/Splashscreen/SplashScreen.dart';
import 'package:erohub/Screens/Workpoint_screens/Quiz_screens/workpoint_Quiz_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'Screens/VizScreens/vizlevelscreens/viz_level_home.dart';
import 'Screens/Workpoint_screens/level2/level2_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(Duration(seconds: 5));
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home :SplashScreen()
        );
      },
    );
  }
}
