import 'package:e_commerce/blocs/auth/bloc/auth_bloc.dart';
import 'package:e_commerce/core/util/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/textfiledcustom.dart';
import '../layout/layout_screen.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/auth_back.png"), fit: BoxFit.fill)),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginLoadingState) {
              showAlertDialog(
                  context: context,
                  backgroundColor: Colors.white,
                  content: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeIn,
                    child: const Row(
                      children: [
                        CupertinoActivityIndicator(),
                        SizedBox(
                          width: 12.5,
                        ),
                        Text(
                          "wait",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ));
            } else if (state is FailedToLoginState) {
              showAlertDialog(
                  context: context,
                  backgroundColor: Colors.red,
                  content: Text(
                    state.message,
                    textDirection: TextDirection.rtl,
                  ));
            } else if (state is LoginSuccessState) {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LayoutScreen()));
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                    child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(bottom: 40),
                  child: const Text(
                    'Login to continue process',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                )),
                Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35))),
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: ListView(
                            children: [
                              const Center(
                                  child: Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                              )),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFieldWidget(
                                controller: emailController,
                                hint: 'Email',
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFieldWidget(
                                controller: passwordController,
                                hint: 'Password',
                                obscureText: true,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              MaterialButton(
                                height: 40,
                                elevation: 0,
                                onPressed: () {
                                  if (formKey.currentState!.validate() ==
                                      true) {
context.read<AuthBloc>().add(LogInEvent(email: emailController.text, password: passwordController.text));

                                
                                  }
                                },
                                minWidth: double.infinity,
                                child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      state is LoginLoadingState
                                          ? "Loading..."
                                          : "Login",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.5),
                                    )),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Don\'t have an account? ',
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterScreen()));
                                    },
                                    child: const Text('Create one',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
