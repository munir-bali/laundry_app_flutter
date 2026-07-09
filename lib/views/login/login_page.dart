import 'package:flutter/material.dart';
import 'package:laundry_app_flutter/constants/app_colors.dart';
import 'package:laundry_app_flutter/views/home/home_page.dart';
import 'package:laundry_app_flutter/widgets/custom_button.dart';
import 'package:laundry_app_flutter/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() =>
      _LoginPageState();
}

class _LoginPageState
    extends State<LoginPage> {
  final TextEditingController
      emailController =
      TextEditingController();

  final TextEditingController
      passwordController =
      TextEditingController();

  bool isObscure = true;

  void login() {
    String email =
        emailController.text.trim();

    String password =
        passwordController.text.trim();

    if (email ==
            'admin@gmail.com' &&
        password == '123456') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const HomePage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            'Email atau Password salah',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 35,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),

                // Image
                SizedBox(
                  width: 260,
                  child: Image.asset(
                    'lib/assets/images/delivery.png',
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(
                  height: 35,
                ),

                // LOGIN REGISTER
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceAround,
                  children: const [
                    Text(
                      'LOGIN',
                      style:
                          TextStyle(
                        color: Color(
                          0xFF1C75A6,
                        ),
                        fontSize: 22,
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),
                    Text(
                      'REGISTER',
                      style:
                          TextStyle(
                        color: Colors
                            .black,
                        fontSize: 20,
                        fontStyle:
                            FontStyle
                                .italic,
                        fontWeight:
                            FontWeight
                                .w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 50,
                ),

                // Email
                const Align(
                  alignment:
                      Alignment
                          .centerLeft,
                  child: Text(
                    'EMAIL',
                    style:
                        TextStyle(
                      fontSize:
                          16,
                      fontWeight:
                          FontWeight
                              .bold,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                CustomTextField(
                  label:
                      'Masukkan email',
                  icon:
                      Icons.email,
                  controller:
                      emailController,
                ),

                const SizedBox(
                  height: 25,
                ),

                // Password
                const Align(
                  alignment:
                      Alignment
                          .centerLeft,
                  child: Text(
                    'PASSWORD',
                    style:
                        TextStyle(
                      fontSize:
                          16,
                      fontWeight:
                          FontWeight
                              .bold,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                CustomTextField(
                  label:
                      'Masukkan password',
                  icon:
                      Icons.lock,
                  controller:
                      passwordController,
                  obscureText:
                      isObscure,
                  suffixIcon:
                      IconButton(
                    icon: Icon(
                      isObscure
                          ? Icons
                              .visibility_off
                          : Icons
                              .visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscure =
                            !isObscure;
                      });
                    },
                  ),
                ),

                const SizedBox(
                  height: 50,
                ),

                // Button Login
                CustomButton(
                  text: 'LOGIN',
                  onPressed:
                      login,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
