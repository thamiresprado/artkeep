import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testeartkeep/pages/select_avatar.dart';
import '../bloc/auth_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              padding: const EdgeInsets.fromLTRB(0, 12, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () {
//                      BlocProvider.of<AuthBloc>(context).add(Logout());

                      _showConfirmationDialog(context);
                    },
                    iconSize: 25,
                    color: Colors.white70,
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.3,
                        ),
                      ),
                      margin: const EdgeInsets.all(16.0),
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            margin: const EdgeInsets.only(right: 12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: InkWell(
                              onTap: () {
                                // Adicione aqui a navegação para a próxima página ao clicar na imagem do avatar
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SelectAvatarPage()),
                                );                              },
                              child: Image.asset(
                                'lib/images/avatar3.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'John Brown',
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.w900,
                                    height: 1.0,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  '@john1010',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    // Informações sobre a obra
                    Container(
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Título "About the piece"
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            margin: const EdgeInsets.only(right: 16.0),
                            child: const Text(
                              'About me',
                              style: TextStyle(
                                fontFamily: 'AlfaSlabOne',
                                fontSize: 40.0,
                                height: 0.8,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          // Informações sobre a peça
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildInfoRow('NAME', 'John Brown'),
                                _buildInfoRow('BIRTHDAY', '24/05/1996'),
                                _buildInfoRow('E-MAIL', 'johnbrown@gmail.com'),
                                _buildInfoRow('COUNTRY', 'Brazil'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    //Carrossel Arts
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            margin: const EdgeInsets.only(left: 20),
                            child: Image.asset(
                              'lib/images/art1.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 200,
                            margin: const EdgeInsets.only(left: 8),
                            child: Image.asset(
                              'lib/images/art2.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 200,
                            margin: const EdgeInsets.only(left: 8),
                            child: Image.asset(
                              'lib/images/art3.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 200,
                            margin: const EdgeInsets.only(left: 8, right: 16),
                            child: Image.asset(
                              'lib/images/art4.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(''),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Tem certeza que deseja sair?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('NÃO'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('SIM'),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(Logout());
              },
            ),
          ],
        );
      },
    );
  }
}
