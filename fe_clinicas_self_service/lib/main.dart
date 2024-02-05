import 'package:fe_clinicas_core/fe_clinicas_core.dart';
import 'package:fe_clinicas_self_service/src/binding/clinicas_application_binding.dart';
import 'package:fe_clinicas_self_service/src/modules/auth/auth_module.dart';
import 'package:fe_clinicas_self_service/src/pages/splash_page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

void main() {
  runApp(const ClinicasSelfServiceApp());
}

class ClinicasSelfServiceApp extends StatelessWidget {
  const ClinicasSelfServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ClinicasCoreConfig(
      title: "Clinicas Auto Atendimento",
      binding: ClinicasApplicationBinding(),
      pagesBuilders: [
        FlutterGetItPageBuilder(page: (_) => const SplashPage(), 
        path: '/')
      ],  
      modules: [AuthModule()],
    );
  }
}

