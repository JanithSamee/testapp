import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:testapp/controller/user.controller.dart';
import 'package:testapp/pages/DataPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _form = GlobalKey();
  String username = '';

  @override
  Widget build(BuildContext context) {
    UserController controller = Get.put(UserController());
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Login".tr),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) => setState(() {
                    username = value;
                  }),
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Username".tr),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Password".tr),
                ),
              ),
              Text("Entered Username : $username"),
              ElevatedButton(
                  onPressed: () {
                    controller.addUser(username);
                    Get.to(() => const DataPage());
                  },
                  child: const Text("Sign In"))
            ],
          ),
        ),
      ),
    );
  }
}
