import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_list_pick/country_list_pick.dart';

import '../bloc/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String selectedCountry = ''; // Certifique-se de que selectedCountry esteja declarado.


  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    String username = "";
    String password = "";

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/met.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                top: 48,
                                left: 24,
                              ),
                              child: Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 8, top: 6, bottom: 16),
                                    child: const Text(
                                      "FIRST NAME",
                                      style: TextStyle(
                                        color:
                                        Colors.grey,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    // onSaved: (String? inValue) {
                                    // },
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets
                                          .symmetric(
                                        vertical: 24,
                                      ),
                                      // filled: true, // Set to true to fill the background
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            4.0),
                                        borderSide: const BorderSide(
                                          width: 1.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                top: 48,
                                right: 24,
                              ),
                              child: Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 8, top: 6, bottom: 16),
                                    child: const Text(
                                      "LAST NAME",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    // onSaved: (String? inValue) {
                                    // },
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets
                                          .symmetric(
                                        vertical: 24,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            4.0),
                                        borderSide: const BorderSide(
                                          width: 1.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 24,
                                right: 24,
                              ),
                              child: Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 8, top: 6, bottom: 16),
                                    child: const Text(
                                      "DATE OF BIRTH",
                                      style: TextStyle(
                                        color:
                                        Colors
                                            .grey,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    // onSaved: (String? inValue) {
                                    // },
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets
                                          .symmetric(
                                        vertical: 24,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            4.0),
                                        borderSide: const BorderSide(
                                          width: 1.0,
                                          color: Colors.black, // Cor da borda
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),

                      //Countries
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 24,
                                right: 24,
                              ),
                              child: Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Container(
                                    child: const Text(
                                      "COUNTRY",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),

                                  // Positioned(
                                  //   top: 8.0,
                                  //   right: 0.0,
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 0, top: 0.005, bottom: 16),
                                    height: 80,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.0),
                                      // Defina a opacidade desejada (0.0 - 1.0)
                                      borderRadius: BorderRadius.circular(4.0),
                                      border: Border.all(
                                        width: 1.0,
                                        color: Colors.grey, // Cor da borda
                                      ),

                                    ),

                                    child: CountryListPick(
                                      theme: CountryTheme(
                                        isShowFlag: false,
                                        isShowTitle: true,
                                        isShowCode: false,
                                        isDownIcon: false,
                                        showEnglishName: true,
                                      ),
                                      initialSelection: 'BR',
                                    ),
                                    // onChanged: (CountryCode code) {
                                    //   setState(() {
                                    //     selectedCountry = code.code!;
                                    //   });
                                    // },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 24,
                                right: 24,
                              ),
                              child: Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 8, top: 6, bottom: 16),
                                    child: const Text(
                                      "EMAIL",
                                      style: TextStyle(
                                        color:
                                        Colors
                                            .grey,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    onSaved: (String? inValue) {
                                      username = inValue!;
                                    },
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets
                                          .symmetric(
                                        vertical: 24,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            4.0),
                                        borderSide: const BorderSide(
                                          width: 1.0,
                                          color: Colors.black, // Cor da borda
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 24,
                                right: 24,
                              ),
                              child: Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 8, top: 6, bottom: 16),
                                    child: const Text(
                                      "PASSWORD",
                                      style: TextStyle(
                                        color:
                                        Colors
                                            .grey, // Cor do texto
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    onSaved: (String? inValue) {
                                      password = inValue!;
                                    },
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets
                                          .symmetric(
                                        vertical: 24,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            4.0),
                                        borderSide: const BorderSide(
                                          width: 1.0,
                                          color: Colors.black, // Cor da borda
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              BlocProvider.of<AuthBloc>(context)
                                  .add(RegisterUser(
                                  username: username, password: password));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black87.withOpacity(0.7),
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              side: const BorderSide(
                                  width: 1, color: Colors.white30),
                            ),
                          ),
                          child: const Text
                            ("REGISTER"),
                        ),
                      ),

                    ],

                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
