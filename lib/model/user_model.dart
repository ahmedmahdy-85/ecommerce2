class UserModel {
  String userId;
  String email;
  String pic;
  String name;

  UserModel({this.name, this.email, this.pic, this.userId});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    pic = map['pic'];
    name = map['name'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'pic': pic,
      'name': name,
    };
  }
}
