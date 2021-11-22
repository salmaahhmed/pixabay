import 'package:flutter/material.dart';
import 'package:pixabay_task/ui/pages/login_page.dart';

import 'di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<ThemeBloc, ThemeState>(
    //   bloc: getIt.get<ThemeBloc>()..add(GetTheme()),
    //   builder: (context, state) {
    //     if (state is GetThemeSuccess) {
    //       return MaterialApp(
    //           theme: ThemeData.light(),
    //           darkTheme: ThemeData.dark(),
    //           themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
    //           home: Scaffold(
    //             body: LoginPage(),
    //           ));
    //     } else {
    return MaterialApp(home: LoginPage());
    //   }
    // },
    // );
  }
}
