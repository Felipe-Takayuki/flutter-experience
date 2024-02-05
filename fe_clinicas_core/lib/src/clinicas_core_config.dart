import 'package:asyncstate/asyncstate.dart';
import 'package:fe_clinicas_core/src/theme/clinicas_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class ClinicasCoreConfig extends StatelessWidget {
  const ClinicasCoreConfig(
      {super.key,
      this.binding,
      this.pages,
      this.pagesBuilders,
      this.modules,
      required this.title});

  final ApplicationBindings? binding;
  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageBuilder>? pagesBuilders;
  final List<FlutterGetItModule>? modules;
  final String title;
  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
        debugMode: kDebugMode,
        bindings: binding,
        modules: modules,
        pages: [...pages ?? [], ...pagesBuilders ?? []],
        builder: (context, routes, flutterGetItNavObserver) {
          return AsyncStateBuilder(builder: (navigatorObserver) {
            return MaterialApp(
              theme: ClinicasTheme.lightTheme,
              darkTheme: ClinicasTheme.darkTheme,
              navigatorObservers: [flutterGetItNavObserver],
              routes: routes,
              title: title,
            );
          });
        });
  }
}
