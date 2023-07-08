import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/modules/home_screen.dart';
import 'package:store_app/modules/register_screen.dart';
import 'package:store_app/shared/components.dart';
import 'package:store_app/shared/consts.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });
  static String id = kLoginScreen;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? email, password;
  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                          'Login',
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
                      label: 'Email',
                    isPassword: false,),
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
                    label: 'Password',
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultButton(
                      buttonText: 'Login',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await userLogin();
                            showSnackBar(context, 'Logged In!');
                            Navigator.pushNamed(context, HomeScreen.id, arguments: email);
                            isLoading = false;
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              showSnackBar(
                                  context, 'No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              showSnackBar(context,
                                  'Wrong password provided for that user.');
                            } else {
                              showSnackBar(context, 'Logged In Successfully!');
                            }


                          } catch (e) {
                            showSnackBar(context, 'There was an error');
                            print(e.toString());
                          }
                        } else {}
                      },
                      background: kGovernorBay,
                      height: 60,
                      textSize: 28),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'don\'t have an account ?',
                        style: TextStyle(fontSize: 18, color: kWhite),
                      ),
                      TextButton(
                        onPressed: () {
                          navigateTo(context, const RegisterScreen());
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 22,
                            color: kRoyalBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> userLogin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
