import 'package:mapping/features/chat/domain/entities/dialog.dart';

abstract class ChatRepository {
  Future<Dialog> getDialog(String email);
}
