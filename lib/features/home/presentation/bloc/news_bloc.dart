import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mapping/features/home/data/news_repository.dart';
import 'package:mapping/features/home/domain/entities/article_list.dart';

part 'news_event.dart';
part 'news_state.dart';
part 'news_bloc.freezed.dart';

@injectable
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(const _Initial()) {
    on<NewsEvent>((event, emit) => event.when(load: () => _load(emit)));
  }
  final _newsRepository = NewsRepository();

  Future<void> _load(Emitter<NewsState> emit) async {
    try {
      final articles = await _newsRepository.dataSource.getArticles(
        'skysports',
        'popularity',
        '0430482f597d479e86d0ab8e82553107',
      );
      emit(NewsState.loaded(articles: articles));
    } catch (error) {
      emit(NewsState.failed(errorMessage: error.toString()));
      rethrow;
    }
  }
}
