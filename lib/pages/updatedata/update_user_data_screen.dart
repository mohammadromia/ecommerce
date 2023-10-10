// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/user/bloc/user_bloc.dart';
import '../../core/util/snackbar.dart';

class UpdateUserDataScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  String email;
  String phone;
  String name;
  UpdateUserDataScreen({
    Key? key,
    required this.email,
    required this.phone,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    nameController.text = name;
    phoneController.text = phone;
    emailController.text = email;

    return BlocProvider(
      create: ((context) => UserBloc()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Update Data"),
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "User Name"),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Phone"),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email"),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocConsumer<UserBloc, UserState>(
                listener: (context, state) {
                  if (state is UpdateUserDataSuccessState) {
                    showSnackBarItem(
                        context, "Data Updated Successfully", true);
                    Navigator.pop(context);
                  }
                  if (state is UpdateUserDataWithFailureState) {
                    showSnackBarItem(context, state.error, false);
                  }
                },
                builder: (context, state) {
                  return MaterialButton(
                    onPressed: () {
                      if (nameController.text.isNotEmpty &&
                          phoneController.text.isNotEmpty &&
                          emailController.text.isNotEmpty) {
                        context.read<UserBloc>().add(UpDateUserDataEvent(
                            name: nameController.text,
                            phone: phoneController.text,
                            email: emailController.text));
                      } else {
                        showSnackBarItem(
                            context, 'Please, Enter all Data !!', false);
                      }
                    },
                    textColor: Colors.white,
                    child: Text(state is UpdateUserDataLoadingState
                        ? "Loading..."
                        : "Update"),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
