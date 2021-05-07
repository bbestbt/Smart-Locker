import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:locker/constants.dart';
import 'package:locker/routes.dart';
import 'package:locker/screens/app/app_screen.dart';
import 'package:locker/screens/sign_up/account_service.dart';
import 'package:locker/theme.dart';
import 'package:http/http.dart' as http;
// void setupLocator() {
//   GetIt.I.registerLazySingleton(() => AccountService());
// }

//ok
// GetIt getIt = GetIt.instance;
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await setupLocator();

//ok
  //  getIt.registerSingleton<AccountService>(AccountService(),
  //     signalsReady: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      initialRoute: AppScreen.routeName,
      routes: routes,
    );
  }
}
