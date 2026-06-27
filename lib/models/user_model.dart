class UserModel {
  const UserModel({
    required this.name,
    required this.role,
    required this.avatarColor,
    required this.initials,
  });

  final String name;
  final String role;
  final int avatarColor;
  final String initials;
}
