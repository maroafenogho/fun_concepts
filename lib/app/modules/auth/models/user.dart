class User {
  String? name;
  String? email;
  String? password;
  String? token;
  User({this.name, this.email, this.password, this.token});
  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      name: map["name"],
      email: map["email"],
    );
  }
  factory User.fromLoginJson(Map<String, dynamic> map) {
    return User(
      name: map['data'][0]["name"],
      email: map['data'][0]["email"],
      token: map["accessToken"],
    );
  }
}
