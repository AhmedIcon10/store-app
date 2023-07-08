
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/modules/home_screen.dart';
import 'package:store_app/shared/components.dart';
import 'package:store_app/shared/consts.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String id = kRegisterScreen;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  late String email;
  late String password;
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kHaiti,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          chatLogo,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: kWhite,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomFormField(
                      onChange: (data) {
                        email = data;
                      },
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (c) {
                        if (c.toString().isEmpty) {
                          return 'Email must not be empty';
                        } else {
                          return null;
                        }
                      },
                      label: 'Email', isPassword: false,),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomFormField(
                      onChange: (data) {
                        password = data;
                      },
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (c) {
                        if (c.toString().isEmpty) {
                          return 'Password must not be empty';
                        } else {
                          return null;
                        }
                      },
                      label: 'Password', isPassword: true,),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultButton(
                      buttonText: 'Register',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await userRegister();
                            showSnackBar(context, 'Account Created');
                            Navigator.pushNamed(context, HomeScreen.id, arguments: email);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackBar(context,
                                  'The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              showSnackBar(context,
                                  'The account already exists for that email.');
                            } else {
                              showSnackBar(context, 'Account Created');
                            }
                          } catch (e) {
                            showSnackBar(context, e.toString());
                            print(e.toString());
                          }

                          isLoading = false;
                          setState(() {});
                        }
                      },
                      background: kGovernorBay,
                      height: 60,
                      textSize: 28),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> userRegister() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}
