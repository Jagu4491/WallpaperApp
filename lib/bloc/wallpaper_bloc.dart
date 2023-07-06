import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../api/wallpaper_repo.dart';
import '../model/wallpaper_model.dart';

part 'wallpaper_event.dart';
part 'wallpaper_state.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  WallpaperBloc() : super(WallpaperInitialState()) {
    on<SearchWallpaperEvent>((event, emit) async{
      emit(WallpaperLoadingState());
      WallpaperModel wallpapers = await WallpaperRepo().getWallpapers(event.mQuery,colorcode:event.colorCode);
      emit(WallpaperLoadedState(wallpapers));
    });

    on<TrendingWallpaperEvent>((event, emit) async{
      emit(WallpaperLoadingState());
      WallpaperModel wallpapers = await WallpaperRepo().getTrandingWallpapers();
      emit(WallpaperLoadedState(wallpapers));
    });
    on<AbstractWallpaperEvent>((event, emit) async{
      emit(WallpaperLoadingState());
      WallpaperModel wallpapers = await WallpaperRepo().getAbstrackWallpapers();
      emit(WallpaperLoadedState(wallpapers));
    });
  }
  }


