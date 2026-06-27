class CreatorModel {
  const CreatorModel({
    required this.name,
    required this.handle,
    required this.artworks,
    required this.rating,
    required this.avatarColor,
  });

  final String name;
  final String handle;
  final int artworks;
  final double rating;
  final int avatarColor;
}
