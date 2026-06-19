enum SessionItemType{doctor,event}

class SessionItemModel {
  // --- داتا أساسية في الاتنين ---
  final String id;
  final SessionItemType type; 
  final String imageUrl; 
  final String title; 
  final String subtitle; 

  // --- داتا خاصة بالدكتور بس ---
  final double? rating; 
  final int? reviewsCount; 

  // --- داتا خاصة بالإيفنت بس ---
  final String? hostName; 

  SessionItemModel({
    required this.id,
    required this.type,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.rating,
    this.reviewsCount,
    this.hostName,
  });
}