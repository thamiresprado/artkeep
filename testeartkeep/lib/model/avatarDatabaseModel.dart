import 'package:sqflite/sqflite.dart';

class AvatarDatabaseModel {
  int id;
  String title;
  String imageUrl;

  AvatarDatabaseModel({required this.id, required this.title, required this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
    };
  }

  factory AvatarDatabaseModel.fromMap(Map<String, dynamic> map) {
    return AvatarDatabaseModel(
      id: map['id'],
      title: map['title'],
      imageUrl: map['imageUrl'],
    );
  }
}
