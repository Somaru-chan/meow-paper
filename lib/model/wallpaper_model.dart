class WallPaperModel{
  String? photographer;
  String? photographer_url;
  int? photographer_id;
  SrcModel? src;

  WallPaperModel({this.src, this.photographer_url, 
   this.photographer_id, this.photographer});

  factory WallPaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallPaperModel(
      src: SrcModel.fromMap(jsonData["src"]),
      photographer_url: jsonData["photographer_url"],
      photographer_id: jsonData["photographer_id"],
      photographer: jsonData["photographer"],
    );
  }
}

class SrcModel{

  String original;
  String small; 
  String? portrait; 

  SrcModel({this.portrait="", this.original="", this.small=""});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
      original: jsonData["original"],
      portrait: jsonData["portrait"],
      small: jsonData["small"],
    );
  }
}