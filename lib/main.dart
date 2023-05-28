import 'package:casetest/feature/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_library/di/locator.dart';
import 'package:shared_library/flutter_bloc/flutter_bloc.dart';

import 'di/dependency.dart';
import 'feature/login/ui/login_page.dart';

void main() {
  Dependency().initDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
              create: (_) => LoginBloc(
                    loginUseCase: locator(),
                  )),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LoginPage(),
        ));
  }
}
