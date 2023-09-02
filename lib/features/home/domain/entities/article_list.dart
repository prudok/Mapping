import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mapping/features/home/domain/entities/article.dart';

part 'article_list.freezed.dart';
part 'article_list.g.dart';

@freezed
class ArticleList with _$ArticleList {
  const factory ArticleList({
    required String status,
    required int totalResults,
    required List<Article> articles,
  }) = _ArticleList;

  factory ArticleList.fromJson(Map<String, Object?> json) => _$ArticleListFromJson(json);

  const ArticleList._();
}
