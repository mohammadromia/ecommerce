import 'package:e_commerce/blocs/user/bloc/user_bloc.dart';
import 'package:e_commerce/pages/updatedata/update_user_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/image_cached.dart';
import '../changepassword/change_password_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(GetUserDataEvent()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is GetUserDataLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetUserDataSuccessState) {
            return Scaffold(
                body: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              width: double.infinity,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    child: ImageCached(urlimage: state.userModel.image!),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(state.userModel.name!),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(state.userModel.email!),
                  const SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                  value: context.read<UserBloc>(),
                                  child: ChangePasswordScreen())));
                    },
                    textColor: Colors.white,
                    child: const Text("Change Password"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                  value: context.read<UserBloc>(),
                                  child: UpdateUserDataScreen(
                                    email: state.userModel.email!,
                                    phone: state.userModel.phone ?? '',
                                    name: state.userModel.name ?? '',
                                  ))));
                    },
                    child: const Text("Update Data"),
                  )
                ],
              ),
            ));
          } else if (state is FailedToGetUserDataState) {
            return Center(child: Text(state.error));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
