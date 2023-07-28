import 'package:flutter/material.dart';
import '../../Business_Logic/cubit/my_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Models/users.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Users> usersList = [];
  Users user = Users();
  @override
  void initState() {
    super.initState();
    //BlocProvider.of<MyCubit>(context).getAllUsers(usersList);
    //BlocProvider.of<MyCubit>(context).getUserById(3962348);
    // BlocProvider.of<MyCubit>(context).createUser(Users(
    //   name: "Atom",
    //   email: "atom3@ios.com",
    //   gender: "male",
    //   status: "active",
    // ));
    BlocProvider.of<MyCubit>(context).deleteUser(3962348);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // BlocBuilder<MyCubit, MyState>(
          //   builder: (context, state) {
          //     if (state is GotUserById) {
          //       user = state.user;
          //       return SizedBox(
          //         height: 70,
          //         child: ListTile(
          //           title: Text(user.name!),
          //           subtitle: Text(user.email!),
          //         ),
          //       );
          //     } else {
          //       return const Center(child: CircularProgressIndicator());
          //     }
          //   },
          // )
          BlocBuilder<MyCubit, MyState>(
            builder: (context, state) {
              if (state is userDeleted) {            
                      return SizedBox(
                        height: 70,
                        child: ListTile(
                          title: Text(user.email!.toString()),
                          subtitle: Text(user.email!),
                        ),
                      );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }
}
