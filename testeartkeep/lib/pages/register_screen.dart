import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:intl/intl.dart';
// import 'package:date_time_picker/date_time_picker.dart';
// // import 'package:flutter_datetime_picker/flutter_datetime_picker.dart'
//     // show DatePicker, DatePickerTheme, LocaleType;

import '../bloc/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // String selectedCountry = '';
  bool light0 = true;
  bool light1 = true;
  bool _obscureText = true;
  final TextEditingController _passwordController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  String _selectedCountry = 'BR'; // País padrão

  // DateTime _selectedDate = DateTime.now();
  // TextEditingController _dateController = TextEditingController();

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

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
          Positioned(
            top: 70,
            left: MediaQuery.of(context).size.width / 2 -
                50, // Ajuste o valor conforme necessário
            child: Image.asset(
              'lib/images/login-image.png',
              width: 100,
              height: 100,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 180),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 12, 16, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                iconSize: 32,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
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
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // color: Colors.white,
                                      child: TextFormField(
                                        // onSaved: (String? inValue) {
                                        // },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 24,
                                          ),
                                          filled: true,
                                          // Set to true to fill the background
                                          fillColor: Colors.white10,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            borderSide: const BorderSide(
                                              width: 1.0,
                                              // color: Colors.white,
                                            ),
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
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      // onSaved: (String? inValue) {
                                      // },
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 24,
                                        ),
                                        filled: true,
                                        // Set to true to fill the background
                                        fillColor: Colors.white10,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
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
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      //controller: _dateController,
                                      style: TextStyle(color: Colors.white10),
                                      decoration: InputDecoration(
                                        // suffixIcon: IconButton(
                                        //   icon: Icon(Icons.calendar_today),
                                        //   onPressed: () {
                                        //     _selectDate(context);
                                        //   },
                                        // ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 24,
                                        ),
                                        filled: true,
                                        // Set to true to fill the background
                                        fillColor: Colors.white10,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          borderSide: const BorderSide(
                                            width: 1.0,
                                            //color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      // readOnly: true,
                                      // onTap: () {
                                      //   _selectDate(context);
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
                                          left: 8, top: 10, bottom: 16),
                                      child: const Text(
                                        "COUNTRY",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 0, top: 6, bottom: 16),
                                      //height: 50,
                                      width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0, vertical: 12.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white10,
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        border: Border.all(
                                          width: 1.0,
                                          color: Colors.white10,
                                        ),
                                      ),
                                      child: CountryListPick(
                                        theme: CountryTheme(
                                          isShowFlag: false,
                                          isShowTitle: true,
                                          isShowCode: false,
                                          isDownIcon: false,
                                          showEnglishName: true,
                                          // textStyleSelected: const TextStyle(color: Colors.red),
                                        ),
                                        initialSelection: _selectedCountry,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedCountry = value as String; // Atualiza o país selecionado
                                            _countryController.text = value as String; // Atualiza o texto do controlador
                                          });
                                        },
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
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  top: 6, bottom: 16),
                                              child: const Text(
                                                "I would like to receive news by email",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 16, top: 0, bottom: 16),
                                            decoration: BoxDecoration(
                                              //color: Colors.black26,
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: Switch(
                                              thumbIcon: thumbIcon,
                                              value: light1,
                                              activeColor: Colors.white,
                                              inactiveTrackColor: Colors.grey,
                                              inactiveThumbColor: Colors.black,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  light1 = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
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
                                        "EMAIL",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      onSaved: (String? inValue) {
                                        username = inValue!;
                                      },
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 24,
                                        ),
                                        filled: true,
                                        // Set to true to fill the background
                                        fillColor: Colors.white10,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          borderSide: const BorderSide(
                                            width: 1.0,
                                            color: Colors.black,
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
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      obscureText: _obscureText,
                                      controller: _passwordController,
                                      onSaved: (String? inValue) {
                                        password = inValue!;
                                      },
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 24,
                                        ),
                                        filled: true,
                                        // Set to true to fill the background
                                        fillColor: Colors.white10,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          borderSide: const BorderSide(
                                            width: 1.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obscureText
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.white38,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
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
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 24),
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                BlocProvider.of<AuthBloc>(context).add(
                                    RegisterUser(
                                        username: username,
                                        password: password));
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
                            child: const Text("SIGN IN"),
                          ),
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Future<void> _selectDate(BuildContext context) async {
  //   DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: _selectedDate ?? DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //   );
  //
  //   if (picked != null && picked != _selectedDate) {
  //     setState(() {
  //       _selectedDate = picked;
  //       _dateController.text = DateFormat('dd/MM/yyyy').format(_selectedDate);
  //     });
  //   }
  // }
}
