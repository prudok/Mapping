part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = _Initial;
  const factory NewsState.loading() = _Loading;
  const factory NewsState.loaded({required ArticleList articles}) = _Loaded;
  const factory NewsState.failed({required String errorMessage}) = _Failed;
}
