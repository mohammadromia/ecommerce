// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce/blocs/user/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/network/localnetwork.dart';
import '../../core/util/snackbar.dart';

class ChangePasswordScreen extends StatelessWidget {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 50,),
              TextField(
                controller: currentPasswordController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Current Password"),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: newPasswordController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "New Password"),
              ),
              const SizedBox(
                height: 24,
              ),
              BlocConsumer<UserBloc, UserState>(listener: (context, state) {
                if (state is ChangePasswordSuccessState) {
                  showSnackBarItem(
                      context, "Password Updated Successfully", true);
                  Navigator.pop(context);
                }
                if (state is ChangePasswordWithFailureState) {
                  showSnackBarItem(context, state.error, false);
                }
              }, builder: (context, state) {
                return MaterialButton(
                  onPressed: () async {
                  String?  currentPassword = await CacheNetwork.getCacheData(key: 'password');

                    if (currentPasswordController.text == currentPassword) {
                      if (newPasswordController.text.length >= 6) {
                        context.read<UserBloc>().add(ChangePasswordEvent(
                            userCurrentPassword: currentPassword!,
                            newPassword: newPasswordController.text));
                      } else {
                        showSnackBarItem(context,
                            "Password must be at least 6 characters", false);
                      }
                    } else {
                      showSnackBarItem(
                          context,
                          "please, verify current password, try again later",
                          false);
                    }
                  },
                  height: 45,
                  minWidth: double.infinity,
                  textColor: Colors.white,
                  child: Text(state is ChangePasswordLoadingState
                      ? "Loading..."
                      : "Update"),
                );
              })
            ],
          ),
        ),
      ),
    );
  }


}
