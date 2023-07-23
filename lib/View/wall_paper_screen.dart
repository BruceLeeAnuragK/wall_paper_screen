import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/api_provider.dart';

class WallPapers extends StatefulWidget {
  const WallPapers({super.key});

  @override
  State<WallPapers> createState() => _WallPapersState();
}

class _WallPapersState extends State<WallPapers> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApiController>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: CupertinoSwitch(
                thumbColor: Colors.deepPurple.shade400,
                trackColor: Colors.white,
                activeColor: Colors.deepPurple.shade900,
                value: provider.isDark,
                onChanged: (val) => provider.changePlatform(val: val),
              ),
            ),
          ],
          leading: Container(),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text(
            "Wallpaper App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Consumer<ApiController>(builder: (context, provider, child) {
          List data = provider.data;
          return Center(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          splashColor: Colors.white,
                          color: Colors.deepPurple,
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed("Animal_wall_paper");
                          },
                          child: Text(
                            "Animal",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          splashColor: Colors.white,
                          color: Colors.deepPurple,
                          onPressed: () {
                            Navigator.of(context).pushNamed("Car_wall_paper");
                          },
                          child: Text(
                            "Cars",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          splashColor: Colors.white,
                          color: Colors.deepPurple,
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed("Flower_wall_paper");
                          },
                          child: Text(
                            "Flowers",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          splashColor: Colors.white,
                          color: Colors.deepPurple,
                          onPressed: () {
                            Navigator.of(context).pushNamed("House_wall_paper");
                          },
                          child: Text(
                            "House",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIconColor: Colors.deepPurple,
                      suffixIcon: Icon(
                        Icons.search,
                        size: 30,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            width: 10,
                            color: Colors.deepPurple,
                          )),
                    ),
                    onSubmitted: (val) {
                      print("SEARCH : $val");
                      provider.search(val: val);
                    },
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        CarouselSlider(
                          items: provider.imageList.map((i) {
                            return Container(
                              height: 250,
                              width: double.infinity,
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(i),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          }).toList(),
                          options: CarouselOptions(
                            autoPlay: true,
                            height: 250,
                            aspectRatio: 1.0,
                            enableInfiniteScroll: true,
                            onPageChanged: (index, reason) =>
                                provider.changeCurrentPageIndex(index),
                          ),
                        ),
                        DotsIndicator(
                          dotsCount: provider.imageList.length,
                          position: provider.currentIndex,
                          decorator: DotsDecorator(
                            color: Colors.deepPurple,
                            activeColor: Colors.deepPurple.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  "All Wall Papers",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  flex: 2,
                  child: GridView.builder(
                    itemCount: provider.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            "wallPaper_detail_screen",
                            arguments: data[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                data[index]['largeImageURL'],
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      );
    });
  }
}
