class UserModel {
  late String uid;
  late String name;
  late String email;
  late String? profileImageUrl;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.profileImageUrl,
  });

  // Method to convert UserModel to Map
  static Map<String, dynamic> toMap(UserModel userModel) {
    var data = <String, dynamic>{};
    data['uid'] = userModel.uid;
    data['name'] = userModel.name;
    data['email'] = userModel.email;
    data['profileImageUrl'] = userModel.profileImageUrl;
    return data;
  }

  // Method to get UserModel from Map
  UserModel.fromMap(Map<String, dynamic> mapData) {
    uid = mapData['uid'];
    name = mapData['name'];
    email = mapData['email'];
    profileImageUrl = mapData['profileImageUrl'];
  }
}
