import 'package:flutter/material.dart';
import 'package:flutter_micro_frontend_clean/app/app_module.dart';
import 'package:flutter_micro_frontend_clean/app/app_widget.dart';
import 'package:shared/shared.dart';

void main() {
  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
