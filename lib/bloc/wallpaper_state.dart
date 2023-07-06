part of 'wallpaper_bloc.dart';

@immutable
abstract class WallpaperState {}

class WallpaperInitialState extends WallpaperState {}

class WallpaperLoadingState extends WallpaperState {}

class WallpaperLoadedState extends WallpaperState {
  WallpaperModel wallpapers;
  WallpaperLoadedState(this.wallpapers);
}

class WallpaperErrorState extends WallpaperState {
  String errorMsg;
  WallpaperErrorState(this.errorMsg);

}

