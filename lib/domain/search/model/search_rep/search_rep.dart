import 'package:json_annotation/json_annotation.dart';
import 'package:netflix/core/costurl/strings.dart';

part 'search_rep.g.dart';

@JsonSerializable()
class SearchRep {
  @JsonKey(name: 'results')
  List<SearchResultData> results;

  SearchRep({this.results = const []});

  factory SearchRep.fromJson(Map<String, dynamic> json) {
    return _$SearchRepFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchRepToJson(this);
}

@JsonSerializable()
class SearchResultData {
  @JsonKey(name: 'id')
  num? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;
  String get posterImageUrl => '$imageAppendUrl$posterPath';
  SearchResultData({
    this.id,
    this.originalTitle,
    this.posterPath,
  });

  factory SearchResultData.fromJson(Map<String, dynamic> json) {
    return _$SearchResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);
}
