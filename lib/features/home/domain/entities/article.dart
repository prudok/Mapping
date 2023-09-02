import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required String? author,
    required String? title,
    required String? description,
    required String? content,
  }) = _Article;

  factory Article.fromJson(Map<String, Object?> json) => _$ArticleFromJson(json);

  const Article._();
}