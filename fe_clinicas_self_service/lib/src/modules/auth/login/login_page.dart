import 'package:fe_clinicas_core/fe_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final sizedOf = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: sizedOf.height),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background_login.png'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(40),
              constraints: BoxConstraints(maxWidth: sizedOf.width * .8),
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16)
                ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Text("Login", style: ClinicasTheme.titleStyle,),
                    const SizedBox(height: 32),
                    TextFormField(
                      controller: emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Email Obrigatório'),
                        Validatorless.email('Email Inválido')
                      ]),
                      decoration: const InputDecoration(label: Text('Email')),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: passwordEC,
                      obscureText: false,
                      validator: Validatorless.required('Senha Obrigatória'),
                      decoration: const InputDecoration(label: Text('Password')),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: sizedOf.width * .8,
                      height: 48,
                      child: ElevatedButton(onPressed: (){
                        final valid = formKey.currentState?.validate() ?? false;
                        if (valid) {}
                      }, child: const Text('Entrar')))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
