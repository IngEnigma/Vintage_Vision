import 'chat_message_model.dart';

class PartyRoom {
  final String id;
  final String hostUserId;
  final String movieId;
  final List<String> participants; // IDs de usuarios
  final List<ChatMessage> chatHistory;
  final int videoTimestamp; // En segundos

  PartyRoom({
    required this.id,
    required this.hostUserId,
    required this.movieId,
    required this.participants,
    required this.chatHistory,
    this.videoTimestamp = 0,
  });
}
