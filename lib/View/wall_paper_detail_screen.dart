import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';

class WallPaperDetailPage extends StatefulWidget {
  const WallPaperDetailPage({super.key});

  @override
  State<WallPaperDetailPage> createState() => _WallPaperDetailPageState();
}

class _WallPaperDetailPageState extends State<WallPaperDetailPage> {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 20,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Add Wall Paper",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                  height: 380,
                  width: 180,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(
                        data['largeImageURL'],
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 405,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    "assets/images/screen2.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  AsyncWallpaper.setWallpaper(
                    url: data["largeImageURL"],
                    goToHome: true,
                    errorToastDetails: ToastDetails.error(),
                    toastDetails: ToastDetails.success(),
                    wallpaperLocation: AsyncWallpaper.LOCK_SCREEN,
                  );
                },
                child: const Icon(Icons.phonelink_lock),
              ),
              FloatingActionButton(
                onPressed: () {
                  AsyncWallpaper.setWallpaper(
                    url: data["largeImageURL"],
                    goToHome: true,
                    errorToastDetails: ToastDetails.error(),
                    toastDetails: ToastDetails.success(),
                    wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
                  );
                },
                child: const Icon(Icons.wallpaper),
              ),
              FloatingActionButton(
                onPressed: () {
                  AsyncWallpaper.setWallpaper(
                    url: data["largeImageURL"],
                    goToHome: true,
                    errorToastDetails: ToastDetails.error(),
                    toastDetails: ToastDetails.success(),
                    wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
                  );
                },
                child: const Icon(Icons.add_to_home_screen),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
