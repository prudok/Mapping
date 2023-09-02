import 'package:dio/dio.dart';
import 'package:mapping/features/home/domain/entities/article_list.dart';
import 'package:retrofit/retrofit.dart';

part 'datasource.g.dart';

@RestApi(baseUrl: 'https://newsapi.org/v2/')
abstract class DataSource {
  factory DataSource(Dio dio, {String baseUrl}) = _DataSource;

  @GET('/everything')
  Future<ArticleList> getArticles(
    @Query('q') String company,
    @Query('sortBy') String sortBy,
    @Query('apikey') String apiKey,
  );
}
