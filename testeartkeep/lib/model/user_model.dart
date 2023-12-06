class UserModel {
  late final String uid;
  final String firstname;
  final String lastname;
  final String birthdate;

  UserModel(this.uid, this.firstname, this.lastname, this.birthdate);
  //
  // factory UserModel.fromMap(
  //     Map<String, dynamic> map) {
  //   return UserModel(
  //     uid: map['uid'],
  //     firstname: map['firstname'],
  //   );
  // }

}