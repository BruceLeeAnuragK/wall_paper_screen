import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/api_provider.dart';

class CarWallPapers extends StatefulWidget {
  const CarWallPapers({super.key});

  @override
  State<CarWallPapers> createState() => _CarWallPapersState();
}

class _CarWallPapersState extends State<CarWallPapers> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApiController>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/", (route) => false);
            },
          ),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text(
            "Car Wallpaper",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Consumer<ApiController>(builder: (context, provider, child) {
          List Cardata = provider.Cardata;
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
                Expanded(
                  child: GridView.builder(
                    itemCount: provider.Cardata.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            "wallPaper_detail_screen",
                            arguments: Cardata[index]);
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
                                Cardata[index]['largeImageURL'],
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
