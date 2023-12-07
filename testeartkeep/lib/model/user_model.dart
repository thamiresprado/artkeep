class UserModel {
  late final String uid;
  final String firstname;
  final String lastname;
  final String birthdate;
  final String username;

  UserModel({
    required this.uid,
    required this.firstname,
    required this.lastname,
    required this.birthdate,
    required this.username,
  });

  factory UserModel.fromMap(String uid, Map<String, dynamic> map) {
    return UserModel(
      uid: uid,
      firstname: map['firstname'],
      lastname: map['lastname'],
      birthdate: map['birthdate'],
      username: map['username'],
    );
  }
}
