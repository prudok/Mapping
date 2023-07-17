import 'package:mapping/features/chat/data/datasource/chat_datasource.dart';
import 'package:mapping/features/chat/domain/entities/dialog.dart';

class ChatDatasourceImpl extends ChatDatasource {
  @override
  Future<Dialog> loadDialog(String email) {
    throw UnimplementedError();
  }
}
