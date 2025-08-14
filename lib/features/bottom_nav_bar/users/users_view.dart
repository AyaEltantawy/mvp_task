import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'users_cubit.dart';
import 'users_state.dart';

class UsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UsersCubit(),

      child: Scaffold(
        appBar: AppBar(title: Text('Registered Users')),
        body: StreamBuilder<QuerySnapshot>(
          stream: context.read<UsersCubit>().usersCollection.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No users found'));
            }

            final users = snapshot.data!.docs;

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                var user = users[index];
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text(user['name'] ?? 'No Name'),
                  subtitle: Text(user['email'] ?? 'No Email'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
