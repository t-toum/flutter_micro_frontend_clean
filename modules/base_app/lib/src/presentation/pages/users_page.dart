import 'package:base_app/src/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List user"),
      ),
      body: Center(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.status == DataStatus.loading) {
              return const CircularProgressIndicator();
            }
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  leading: Image.network(
                    user.photo,
                    width: 40,
                    height: 40,
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
