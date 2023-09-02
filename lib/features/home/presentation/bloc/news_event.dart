part of 'news_bloc.dart';

@freezed
class NewsEvent with _$NewsEvent {
  const NewsEvent._();
  const factory NewsEvent.load() = _Load;
}
