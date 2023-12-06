import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testeartkeep/pages/profile.dart';
import 'package:testeartkeep/provider/avatarDatabaseHelper.dart';
import '../bloc/auth_bloc.dart';

class SelectAvatarPage extends StatefulWidget {

  const SelectAvatarPage({Key? key}) : super(key: key);

  @override
  _SelectAvatarState createState() => _SelectAvatarState();
}
final AvatarDatabaseHelper avatarDatabaseHelper = AvatarDatabaseHelper();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await avatarDatabaseHelper.open();
  runApp(SelectAvatarPage());
}

class _SelectAvatarState extends State<SelectAvatarPage> {
  //  AvatarDatabaseHelper databaseHelper = AvatarDatabaseHelper();
  // await databaseHelper.initializeDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Imagens'),
      ),
      body: Center(
        child: ElevatedButton(
        onPressed: () {
      // Chama o método para inserir uma imagem
      _inserirImagem();
    },
    child: const Text('Inserir Imagem'),
    ),
    ),

      // FutureBuilder<List<String>>(
      //   future: avatarDatabaseHelper.getAllAvatarImages(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const CircularProgressIndicator();
      //     } else if (snapshot.hasError) {
      //       return Text('Erro: ${snapshot.error}');
      //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      //       return const Text('Nenhuma imagem encontrada.');
      //     } else {
      //       List<String> imagens = snapshot.data!;
      //       // Verifica se há pelo menos uma imagem na lista
      //       if (imagens.isNotEmpty) {
      //         // Aqui, você pode acessar a primeira imagem da lista (índice 0)
      //         String primeiraImagem = imagens[0];
      //         return Image.network(primeiraImagem);
      //       } else {
      //         return const Text('Nenhuma imagem encontrada.');
      //       }
      //     }
      //   },
      // ),

    );
  }

  void _inserirImagem() async {
    // Substitua "URL_DA_IMAGEM" pela URL real da imagem que você deseja inserir
    String urlDaImagem = "lib/images/avatar1.png";

    // Chama o método para inserir a imagem no banco de dados
    await avatarDatabaseHelper.insertAvatarImage(urlDaImagem);

// Exibe um diálogo ou realiza outras ações, se necessário
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Imagem Inserida'),
          content: const Text('A imagem foi inserida no banco de dados.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
}
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: Container(
  //     width: double.infinity,
  //    // color: const Color(0xFF606169), // Cor de fundo da página
  //     child: SingleChildScrollView(
  //       child: SafeArea(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 Container(
  //                   padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
  //                   child: const Text(
  //                     'select your avatar',
  //                     style: TextStyle(
  //                       fontFamily: 'AlfaSlabOne',
  //                       fontSize: 24,
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                 ),
  //
  //                 SingleChildScrollView(
  //                   scrollDirection: Axis.horizontal,
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Container(
  //                         width: 200,
  //                         height: 200,
  //                         padding: const EdgeInsets.fromLTRB(16, 24, 10, 0),
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                         ),
  //                         child: Image.asset(
  //                           'lib/images/avatar1.png',
  //                           fit: BoxFit.cover,
  //                           width: double.infinity,
  //                         ),
  //                       ),
  //                       Container(
  //                         width: 200,
  //                         height: 200,
  //                         padding: const EdgeInsets.fromLTRB(16, 24, 10, 0),
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                         ),
  //                         child: Image.asset(
  //                           'lib/images/avatar12.png',
  //                           fit: BoxFit.cover,
  //                           width: double.infinity,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 SingleChildScrollView(
  //                   scrollDirection: Axis.horizontal,
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Container(
  //                         width: 200,
  //                         height: 200,
  //                         padding: const EdgeInsets.fromLTRB(16, 24, 10, 0),
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                         ),
  //                         child: Image.asset(
  //                           'lib/images/avatar2.png',
  //                           fit: BoxFit.cover,
  //                           width: double.infinity,
  //                         ),
  //                       ),
  //                       Container(
  //                         width: 200,
  //                         height: 200,
  //                         padding: const EdgeInsets.fromLTRB(16, 24, 10, 0),
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                         ),
  //                         child: Image.asset(
  //                           'lib/images/avatar11.png',
  //                           fit: BoxFit.cover,
  //                           width: double.infinity,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 SingleChildScrollView(
  //                   scrollDirection: Axis.horizontal,
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Container(
  //                         width: 200,
  //                         height: 200,
  //                         padding: const EdgeInsets.fromLTRB(16, 24, 10, 0),
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                         ),
  //                         child: Image.asset(
  //                           'lib/images/avatar3.png',
  //                           fit: BoxFit.cover,
  //                           width: double.infinity,
  //                         ),
  //                       ),
  //                       Container(
  //                         width: 200,
  //                         height: 200,
  //                         padding: const EdgeInsets.fromLTRB(16, 24, 10, 0),
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                         ),
  //                         child: Image.asset(
  //                           'lib/images/avatar10.png',
  //                           fit: BoxFit.cover,
  //                           width: double.infinity,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 SingleChildScrollView(
  //                   scrollDirection: Axis.horizontal,
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Container(
  //                         width: 200,
  //                         height: 200,
  //                         padding: const EdgeInsets.fromLTRB(16, 24, 10, 0),
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                         ),
  //                         child: Image.asset(
  //                           'lib/images/avatar4.png',
  //                           fit: BoxFit.cover,
  //                           width: double.infinity,
  //                         ),
  //                       ),
  //                       Container(
  //                         width: 200,
  //                         height: 200,
  //                         padding: const EdgeInsets.fromLTRB(16, 24, 10, 0),
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                         ),
  //                         child: Image.asset(
  //                           'lib/images/avatar9.png',
  //                           fit: BoxFit.cover,
  //                           width: double.infinity,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 SingleChildScrollView(
  //                   scrollDirection: Axis.horizontal,
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Container(
  //                         width: 200,
  //                         height: 200,
  //                         padding: const EdgeInsets.fromLTRB(16, 24, 10, 0),
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                         ),
  //                         child: Image.asset(
  //                           'lib/images/avatar5.png',
  //                           fit: BoxFit.cover,
  //                           width: double.infinity,
  //                         ),
  //                       ),
  //                       Container(
  //                         width: 200,
  //                         height: 200,
  //                         padding: const EdgeInsets.fromLTRB(16, 24, 10, 0),
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                         ),
  //                         child: Image.asset(
  //                           'lib/images/avatar8.png',
  //                           fit: BoxFit.cover,
  //                           width: double.infinity,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 SingleChildScrollView(
  //                   scrollDirection: Axis.horizontal,
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Container(
  //                         width: 200,
  //                         height: 200,
  //                         padding: const EdgeInsets.fromLTRB(16, 24, 10, 0),
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                         ),
  //                         child: Image.asset(
  //                           'lib/images/avatar6.png',
  //                           fit: BoxFit.cover,
  //                           width: double.infinity,
  //                         ),
  //                       ),
  //                       Container(
  //                         width: 200,
  //                         height: 200,
  //                         padding: const EdgeInsets.fromLTRB(16, 24, 10, 0),
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                         ),
  //                         child: Image.asset(
  //                           'lib/images/avatar7.png',
  //                           fit: BoxFit.cover,
  //                           width: double.infinity,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //
  //                 //buttons
  //                 Container(
  //                   width: double.infinity,
  //                   padding: const EdgeInsets.symmetric(
  //                       horizontal: 24, vertical: 15),
  //                   child: ElevatedButton(
  //                     onPressed: () {
  //                       _showConfirmationDialog(context);
  //                     },
  //                     style: ElevatedButton.styleFrom(
  //                       primary: Colors.white70,
  //                       onPrimary: Colors.black,
  //                       padding: const EdgeInsets.symmetric(vertical: 5),
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(4.0),
  //                         side: const BorderSide(width: 1, color: Colors.black),
  //                       ),
  //                     ),
  //                     child: const Text("SAVE"),
  //                   ),
  //                 ),
  //                 Container(
  //                   width: double.infinity,
  //                   padding: const EdgeInsets.symmetric(horizontal: 24),
  //                   child: ElevatedButton(
  //                     onPressed: () {
  //                       Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) => const ProfilePage()),
  //                       );
  //                     },
  //                     style: ElevatedButton.styleFrom(
  //                       primary: Colors.black,
  //                       onPrimary: Colors.white,
  //                       padding: const EdgeInsets.symmetric(vertical: 5),
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(4.0),
  //                         side: const BorderSide(width: 1, color: Colors.black),
  //                       ),
  //                     ),
  //                     child: const Text("CANCEL"),
  //                   ),
  //                 ),
  //                 const SizedBox(height: 35),
  //
  //               ],
  //             ),
  //           ],
  //         ),
  //
  //       ),
  //     ),
  //   ));
  // }
  //
  // Future<void> _showConfirmationDialog(BuildContext context) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         content: const SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Text('Funcionalidade em breve!'),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('Voltar'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           TextButton(
  //             child: const Text('OK'),
  //             onPressed: () {
  //               // Adicione aqui a lógica para salvar ou qualquer ação desejada
  //               print('Ação de salvar confirmada!');
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }


  @override
  void initState() {
    super.initState();
    // Chamada para carregar as imagens do banco de dados local
    // Pode ser feita usando o método artDatabaseHelper.getAllArtImages() e atualizando o estado conforme necessário
  }


}
