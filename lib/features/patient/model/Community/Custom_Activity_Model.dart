class ActivityModel {
  final String id;
  final String actorName;
  final String? actorAvatarUrl;
  final String actionType;
  final String? content;
  final DateTime createdAt;

  final String? targetImageUrl;
  final String? referenceId;
  final bool isRead;

  ActivityModel({
    required this.id,
    required this.actorName,
    required this.actorAvatarUrl,
    required this.actionType,
    required this.content,
    required this.createdAt,
    required this.targetImageUrl,
    required this.referenceId,
    required this.isRead,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['id'] ?? '',
      actorName: json['actorName'] ?? 'Unknown User',
      actorAvatarUrl: json['actorAvatarUrl'],
      actionType: json['actionType'] ?? "Unknown",
      content: json['content'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      targetImageUrl: json['targetImageUrl'],
      referenceId: json['referenceId'],
      isRead: json['isRead'] ?? false,
    );
  }
}
