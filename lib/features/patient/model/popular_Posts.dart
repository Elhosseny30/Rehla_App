class PopularPostsModel {
  final String text;
  final int numberOfLoves;
  final int numberOfCommnets;
  final bool uploadedByDoctor;

  PopularPostsModel({
    required this.text,
    required this.numberOfLoves,
    required this.numberOfCommnets,
    required this.uploadedByDoctor,
  });
}
