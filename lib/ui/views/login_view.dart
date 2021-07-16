import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'package:flutter_base_project/core/viewmodels/login_viewmodel.dart';
import 'package:flutter_base_project/ui/widgets/login_text_entry.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  static const routeName = 'login';

  final TextEditingController username = TextEditingController(text: '');
  final TextEditingController password = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    if (!kReleaseMode) {
      username.text = '';
      password.text = '';
    }

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, dynamic vm, child) => Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: LoginTextEntry(
                  controller: username,
                  backgroundColor: Colors.white,
                  borderColor: Colors.blue,
                  suffixIcon: Icons.person,
                  suffixColor: Colors.blue,
                  labelText: 'Username',
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: LoginTextEntry(
                  controller: password,
                  obscureText: true,
                  suffixIcon: Icons.lock,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
