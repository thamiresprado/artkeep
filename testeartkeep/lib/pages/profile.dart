import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testeartkeep/pages/select_avatar.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/like_bloc.dart';
import '../model/art_model.dart';
import '../model/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LikeBloc>(context).add(RetrieveLikes());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
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
                        Navigator.popUntil(
                            context, ModalRoute.withName('/welcome'));
                        BlocProvider.of<AuthBloc>(context).add(Logout());
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SelectAvatarPage()),
                                  );},
                                child: Image.asset(
                                  'lib/images/avatar3.png',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BlocBuilder<AuthBloc, AuthState>(
                                    builder: (context, state) {
                                      if (state is Authenticated) {
                                        return _buildUserProfile(state.userModel);
                                      } else {
                                        // Mantenha o código existente para outros estados
                                        return CircularProgressIndicator();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      // Container(
                      //   margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Container(
                      //         width: MediaQuery.of(context).size.width * 0.4,
                      //         margin: const EdgeInsets.only(right: 16.0),
                      //         child: const Text(
                      //           'About me',
                      //           style: TextStyle(
                      //             fontFamily: 'AlfaSlabOne',
                      //             fontSize: 40.0,
                      //             height: 0.8,
                      //           ),
                      //           textAlign: TextAlign.right,
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             _buildInfoRow('NAME', 'John Brown'),
                      //             _buildInfoRow('BIRTHDAY', '24/05/1996'),
                      //             _buildInfoRow('E-MAIL', 'johnbrown@gmail.com'),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      BlocBuilder<LikeBloc, LikeState>(
                        builder: (context, state) {
                          if (state is ObtainedArts) {
                            return _buildLikedArtworksList(state.arts);
                          } else if (state is ErrorLikes) {
                            return Text(state.message);
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLikedArtworksList(List<ArtModel> likedArts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            //'Obras Curtidas',
            'Liked arts',
            style: TextStyle(
              fontFamily: 'AlfaSlabOne',
              fontSize: 40.0,
              fontWeight: FontWeight.w100,
              height: 1.0,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: likedArts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(likedArts[index].title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(likedArts[index].artistDisplayName),
                ],
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Delete art'),
                      content: const Text(
                        'Do you want to delete this art from your favorites?',
                      ),
                      actions: <Widget>[
                        // TextButton(
                        //   onPressed: () {
                        //     // Fechar o AlertDialog, Mudar para abrir os detalhes da obra
                        //     Navigator.of(context).pop();
                        //   },
                        //   child: Text('Ver detalhes'),
                        // ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('No'),
                        ),
                        TextButton(
                          onPressed: () async {
                            BlocProvider.of<LikeBloc>(context).add(DeleteLike(artTitle: likedArts[index].title));
                            setState(() {
                              likedArts.removeAt(index);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ],
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

  Widget _buildUserProfile(UserModel userData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          userData.firstname + ' ' + userData.lastname,
          style: TextStyle(
            fontFamily: 'AlfaSlabOne',
            fontSize: 26.0,
            fontWeight: FontWeight.w900,
            height: 1.0,
          ),
        ),
        SizedBox(height: 2),
        Text(
          '@${userData.username}',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w100,
          ),
        ),
      ],
    );
  }

}

