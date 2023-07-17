import 'package:mapping/features/chat/domain/entities/dialog.dart';

abstract class ChatDatasource {
  Future<Dialog> loadDialog(String email);
}
