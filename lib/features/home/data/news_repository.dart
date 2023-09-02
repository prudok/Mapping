import 'package:dio/dio.dart';
import 'package:mapping/features/home/data/datasource.dart';

class NewsRepository {
  factory NewsRepository() => instance;
  NewsRepository._();
  DataSource dataSource = DataSource(Dio());
  static final NewsRepository instance = NewsRepository._();
}
