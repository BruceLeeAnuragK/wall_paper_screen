import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wall_paper_screen/component/animal_wallpaper.dart';
import 'package:wall_paper_screen/component/car_wall_paper.dart';
import 'package:wall_paper_screen/component/flower_wallpaper.dart';
import 'package:wall_paper_screen/component/house_wallpaper.dart';

import 'Provider/api_provider.dart';
import 'View/splash_screen.dart';
import 'View/wall_paper_detail_screen.dart';
import 'View/wall_paper_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ApiController(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ApiController>(builder: (context, provider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(),
        themeMode: provider.isDark ? ThemeMode.dark : ThemeMode.light,
        initialRoute: "splash_screen",
        routes: {
          "splash_screen": (context) => IntroScreen(),
          "/": (context) => WallPapers(),
          "wallPaper_detail_screen": (context) => WallPaperDetailPage(),
          "Animal_wall_paper": (context) => AnimalWallPapers(),
          "Car_wall_paper": (context) => CarWallPapers(),
          "Flower_wall_paper": (context) => FlowerWallPapers(),
          "House_wall_paper": (context) => HouseWallpaper(),
        },
      );
    });
  }
}
