class UserProfileModel {
  String? email, name, userId, userImage;
  bool isOnline;

  UserProfileModel({
    required this.email,
    required this.userId,
    required this.name,
    required this.userImage,
    required this.isOnline,
  });

  factory UserProfileModel.fromMap(Map m1) {
    return UserProfileModel(
      email: m1['email'],
      userId: m1['userId'],
      name: m1['name'],
      userImage: m1['userImage'],
      isOnline: m1['isOnline'],
    );
  }
}
