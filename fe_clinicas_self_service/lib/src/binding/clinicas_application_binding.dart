import 'package:fe_clinicas_core/fe_clinicas_core.dart';
import 'package:fe_clinicas_self_service/src/core/env.dart';
import 'package:flutter_getit/flutter_getit.dart';

class ClinicasApplicationBinding extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
    Bind.lazySingleton((i) => RestClient(Env.backendBaseUrl))
  ];
}