import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/bloc/wallpaper_bloc.dart';
import 'package:wallpaper_app/screens/wallhomeScreen.dart';

main() {
  runApp(BlocProvider<WallpaperBloc>(
    create: (context) => WallpaperBloc(),
      child: myapp()));
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myapp',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: WallHomeScreen(),
    );
  }
}


