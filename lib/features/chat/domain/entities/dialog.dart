import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mapping/features/chat/domain/entities/message.dart';

part 'dialog.freezed.dart';
part 'dialog.g.dart';

@freezed
class Dialog with _$Dialog {
  const factory Dialog({
    required List<Message> messages,
  }) = _Dialog;

  factory Dialog.fromJson(Map<String, Object?> json) => _$DialogFromJson(json);
}
