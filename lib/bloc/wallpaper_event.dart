part of 'wallpaper_bloc.dart';

@immutable
abstract class WallpaperEvent {}

class SearchWallpaperEvent extends WallpaperEvent{
  String mQuery;
  String? colorCode;

  SearchWallpaperEvent(this.mQuery,{this.colorCode});
}

class TrendingWallpaperEvent extends WallpaperEvent{
  TrendingWallpaperEvent();
}
class AbstractWallpaperEvent extends WallpaperEvent{
  AbstractWallpaperEvent();
}