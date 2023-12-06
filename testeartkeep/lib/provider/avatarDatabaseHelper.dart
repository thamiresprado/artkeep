import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AvatarDatabaseHelper {
  late Database _database;

  Future<void> open() async {
    // Obtenha o caminho do banco de dados
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'avatar_database.db');

    // Abra o banco de dados
    _database = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    // Crie a tabela para armazenar as informações da arte
    await db.execute('''
      CREATE TABLE avatar (
        id INTEGER PRIMARY KEY,
        title TEXT,
        imageUrl TEXT
      )
    ''');
  // Inserir algumas imagens iniciais (opcional)
  await db.rawInsert('INSERT INTO avatar (image_url) VALUES ("lib/images/avatar1.png")');
  await db.rawInsert('INSERT INTO avatar (image_url) VALUES ("lib/images/avatar2.png")');


  }

  //Future<int> insertAvatar(AvatarDatabaseModel avatar) async {
   // return await _database.insert('avatar', avatar.toMap());

  Future<void> insertAvatarImage(String imageUrl) async {
      final Database db = await _database; // Certifique-se de ter um método para inicializar o banco de dados (database)

      await db.insert(
        'avatar', // Substitua 'art_table' pelo nome real da sua tabela
        {'imageUrl': imageUrl}, // Substitua 'imageUrl' pelo nome real da coluna que armazena as URLs de imagens
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      //await initializeDatabase();

      // final AvatarDatabaseHelper artDatabaseHelper = AvatarDatabaseHelper();
      // await artDatabaseHelper.insertAvatarImage('lib/images/avatar1.png');
    }

  // Future<List<AvatarDatabaseModel>> getAllAvatar() async {
  //   final List<Map<String, dynamic>> maps = await _database.query('avatar');
  //
  //   return List.generate(maps.length, (i) {
  //     return AvatarDatabaseModel(
  //       id: maps[i]['id'],
  //       title: maps[i]['title'],
  //       imageUrl: maps[i]['imageUrl'],
  //     );
  //   });
  // }
  Future<List<String>> getAllAvatarImages() async {
    final Database db = await _database; // Certifique-se de ter um método para inicializar o banco de dados (database)

    final List<Map<String, dynamic>> maps = await db.query('art_table');
    // 'art_table' é o nome da tabela onde você armazena as informações sobre as obras de arte.
    // Substitua isso pelo nome real da sua tabela.

    // Mapeie as informações para uma lista de URLs de imagens
    return List.generate(maps.length, (i) {
      return maps[i]['imageUrl'] as String; // Substitua 'imageUrl' pelo nome real da coluna que armazena as URLs de imagens.
    });
  }
}

class AvatarDatabaseModel {
  final int? id;
  final String title;
  final String imageUrl;

  AvatarDatabaseModel({this.id, required this.title, required this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
    };
  }
}
