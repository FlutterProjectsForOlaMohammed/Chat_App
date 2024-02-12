class MessageData {
  String messageBody, id;
  MessageData({
    required this.messageBody,
    required this.id,
  });

  factory MessageData.fromJson(data) {
    return MessageData(
      messageBody: data['MessageBody'],
      id: data['ID'],
    );
  }
}
