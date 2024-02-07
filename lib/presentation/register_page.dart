import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samble_registrasi/bloc/register/register_bloc.dart';
import 'package:samble_registrasi/data/models/request/register_request_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController? namaController;
  TextEditingController? usernameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? repasswordController;
  TextEditingController? phoneController;

  @override
  void initState() {
    namaController = TextEditingController();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    repasswordController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    namaController!.dispose();
    usernameController!.dispose();
    emailController!.dispose();
    passwordController!.dispose();
    repasswordController!.dispose();
    phoneController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text("Register User"),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            TextField(
              obscureText: true,
              controller: repasswordController,
              decoration:
                  const InputDecoration(labelText: "Konfirmasi Password"),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: "No Hp"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  final requestModel = RegisterRequestModel(
                    nama: namaController!.text,
                    username: usernameController!.text,
                    email: emailController!.text,
                    password: passwordController!.text,
                    repassword: repasswordController!.text,
                    phone: phoneController!.text,
                  );
                  context.read<RegisterBloc>().add(
                        DoRegisterEvent(
                          model: requestModel,
                        ),
                      );
                },
                child: const Text("Register"))
          ],
        ),
      ),
    );
  }
}
