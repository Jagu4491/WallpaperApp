import 'package:wallpaper_app/api/api_helper.dart';

import '../model/wallpaper_model.dart';

class WallpaperRepo {
  Future<WallpaperModel> getWallpapers(String mQuery,
      {String? colorcode}) async {
    var mUrl = "search?query=$mQuery?per_page=30&color=${colorcode ?? ""}";

    var data = await ApiHelper().getApi(mUrl, header: {
      "Authorization": "pP3Wk6Hc6rgBBXHIubbHFhT5XC3vEwXCIqi2cxbZY7S7EQ2xEFDlUUS9"
    });
    return WallpaperModel.fromJson(data);
  }
  Future<WallpaperModel> getTrandingWallpapers() async{
    var mUrl = "curated?per_page=30";

    var data= await ApiHelper().getApi(mUrl,header: {"Authorization":"pP3Wk6Hc6rgBBXHIubbHFhT5XC3vEwXCIqi2cxbZY7S7EQ2xEFDlUUS9"});

    return WallpaperModel.fromJson(data);
  }
  Future<WallpaperModel> getAbstrackWallpapers() async{
    var mUrl = "curated?per_page=30";

    var data= await ApiHelper().getApi(mUrl,header: {"Authorization":"pP3Wk6Hc6rgBBXHIubbHFhT5XC3vEwXCIqi2cxbZY7S7EQ2xEFDlUUS9"});

    return WallpaperModel.fromJson(data);
  }

}
