import 'package:kenryo_tankyu/models/notification_content.dart';

final NotificationContent testValue = NotificationContent(
  id: 'test',
  headerImagePath: 'test',
  title: 'テスト',
  contents: 'これはテストです',
  sendAt: DateTime.now(),
  savedAt: DateTime.now(),
  isRead: true, 
  type: NotificationType.system,
); 