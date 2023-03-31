import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/login/home_secreen.dart';

import '../../../core/component/base_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  final dio = Dio();
  @override
  void initState() {
    super.initState();
  }

  void changeEmail(text) {
    setState(() {
      email = text;
    });
  }

  void getHttp() async {
    await dio.get('https://jsonplaceholder.typicode.com/posts/1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: baseScreen(
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: [
              TextField(
                onChanged: (value) => {changeEmail(value)},
              ),
              Text(email),
              FloatingActionButton(
                  // heroTag: ,
                  onPressed: () {
                getHttp();
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (builder) => const HomeScreen()));
                Get.to(const HomeScreen());
              })
            ],
          ),
        ));
  }
}
