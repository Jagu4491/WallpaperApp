import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/bloc/wallpaper_bloc.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/screens/wallpage2.dart';
import 'dart:io' show Platform;

import '../constants.dart';
import '../model/color_model.dart';

class WallHomeScreen extends StatefulWidget {
  @override
  State<WallHomeScreen> createState() => WallHomeScreenState();
}

class WallHomeScreenState extends State<WallHomeScreen> {
//int? index;

  late WallpaperModel wallpaperModel;
  var searchController = TextEditingController();
  bool isMobile = false;
  List<ColorModel> arrColor = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WallpaperBloc>(context).add(TrendingWallpaperEvent());
    arrColor.add(ColorModel(
        name: 'greenAccent', mColor: Color(0xff69F0AE), haxCode: '69F0AE'));
    arrColor.add(
        ColorModel(name: 'deepOrange', mColor: Color(0xffFF5722), haxCode: 'FF5722'));
    arrColor.add(ColorModel(
        name: 'yellowAccent', mColor: Color(0xffFFFF00), haxCode: 'FFFF00'));
    arrColor.add(ColorModel(
        name: 'lightGreenAccent', mColor: Color(0xffB2FF59), haxCode: 'B2FF59'));
    arrColor.add(ColorModel(
        name: 'blue', mColor: Color(0xff2196F3), haxCode: '2196F3'));
    arrColor.add(ColorModel(
        name: 'purple', mColor: Color(0xff9C27B0), haxCode: '9C27B0'));
    arrColor.add(ColorModel(
        name: 'pink', mColor: Color(0xffFF4081), haxCode: 'FF4081'));
    arrColor.add(ColorModel(
        name: 'Black', mColor: Color(0xff191817), haxCode: '191817'));
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      isMobile = false;
    } else if (Platform.isAndroid || Platform.isIOS) {
      isMobile = true;
    } else {
      isMobile = false;
    }
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12, left: 12),
                  child: TextField(
                    controller: searchController,
                    onChanged: (query) {
                      if (query == '') {
                        BlocProvider.of<WallpaperBloc>(context)
                            .add(TrendingWallpaperEvent());
                      }
                    },
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () {
                            BlocProvider.of<WallpaperBloc>(context).add(
                                SearchWallpaperEvent(
                                    searchController.text.toString()));
                          },
                          child: Icon(Icons.search)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Search...',
                    ),
                  ),
                ),
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Best Of The Month',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ),
          ),
          Expanded(
              flex: 6,
              child: BlocBuilder<WallpaperBloc, WallpaperState>(
                builder: (context, state) {
                  if (state is WallpaperLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is WallpaperLoadedState) {
                    wallpaperModel = state.wallpapers;
                    return Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 190,
                              child: ListView.builder(
                                itemCount: wallpaperModel.photos!.length,
                                scrollDirection: Axis.horizontal,

                                itemBuilder: (context, index) => Container(
                                  height: 300,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage(isMobile ? wallpaperModel
                                              .photos![index].src!.portrait! : wallpaperModel.photos![index].src!.landscape!),
                                          fit: BoxFit.fill)),
                                  margin: EdgeInsets.only(
                                      right: 8, left: 8, top: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              )),
          Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'The color Tone',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 70,
                                  child: ListView.builder(
                                    itemCount: arrColor.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: InkWell(
                                        onTap: () {
                                          BlocProvider.of<WallpaperBloc>(
                                                  context)
                                              .add(SearchWallpaperEvent(
                                                  searchController.text
                                                              .toString() ==
                                                          ""
                                                      ? 'rose'
                                                      : searchController.text
                                                          .toString(),
                                                  colorCode:
                                                      arrColor[index].haxCode));
                                        },
                                        child: Container(
                                          height: 70,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color:arrColor[index].mColor
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 8),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Categories',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 5,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          mainAxisExtent: 100,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => wallpage2(
                                          Constants.arrvalue[index]['name'],
                                          Constants.arrvalue[index]['imgs'])));
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                  Constants.arrvalue[index]['name'].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: NetworkImage(Constants.arrvalue[index]
                                            ['img']
                                        .toString()),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          );
                        },
                        itemCount: Constants.arrvalue.length,
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}
