import 'package:mapping/features/chat/domain/entities/dialog.dart';
import 'package:mapping/features/chat/domain/repository/chat_repository.dart';

class ChatRepositoryImpl extends ChatRepository {
  @override
  Future<Dialog> getDialog(String email) {
    throw UnimplementedError();
  }
}
