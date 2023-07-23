import 'package:flutter/cupertino.dart';

import '../Helper/api_helper.dart';

class ApiController extends ChangeNotifier {
  bool isDark = false;
  void changePlatform({required bool val}) {
    isDark = val;
    notifyListeners();
  }

  List<String> imageList = [
    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg?w=2000",
    "https://img.freepik.com/premium-photo/illustration-neon-tropical-theme-with-palm-tree-exotic-floral-ai_564714-1270.jpg",
    "https://c4.wallpaperflare.com/wallpaper/108/140/869/digital-digital-art-artwork-fantasy-art-drawing-hd-wallpaper-thumb.jpg",
    "https://marketplace.canva.com/EAE-xnqWvJk/1/0/1600w/canva-retro-smoke-and-round-light-desktop-wallpapers-JLofAI27pCg.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5fxfhww25ysyMkq_IELQsXvEtbPHIM_fHUQ&usqp=CAU",
    "https://img.freepik.com/premium-photo/colorful-valley-night-generated-by-artificial-intelligence_764048-73.jpg?w=360",
    "https://cdn.wallpapersafari.com/16/69/rcj6Cz.jpg",
    "https://img.freepik.com/premium-photo/abstract-colorful-organic-wallpaper-background-dimension-look-generative-ai_1423-7904.jpg",
  ];
  List data = [];
  List Animaldata = [];
  List Cardata = [];
  List Flowerdata = [];
  List Housedata = [];
  int currentIndex = 0;
  changeCurrentPageIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  ApiController() {
    search();
    animal();
    flower();
    car();
    house();
  }
  search({String val = "nature"}) async {
    data = await APIhelper.apihelper.getWallpaperResponse(query: val) ?? [];
    notifyListeners();
    return 0;
  }

  animal() async {
    Animaldata = await APIhelper.apihelper.getAnimalWallpaperResponse() ?? [];
    notifyListeners();
    return 0;
  }

  car() async {
    Cardata = await APIhelper.apihelper.getCarWallpaperResponse() ?? [];
    notifyListeners();
    return 0;
  }

  flower() async {
    Flowerdata = await APIhelper.apihelper.getFlowerWallpaperResponse() ?? [];
    notifyListeners();
    return 0;
  }

  house() async {
    Housedata = await APIhelper.apihelper.getHouseWallpaperResponse() ?? [];
    notifyListeners();
    return 0;
  }
}
