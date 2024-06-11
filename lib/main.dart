import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/api/controller/loginApi.dart';
import 'package:lautech_mobile/api/controller/registerApi.dart';
import 'package:lautech_mobile/api/utils/dataMethod.dart';
import 'package:lautech_mobile/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:snapshot_guard/snapshot_guard.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure the binding is initialized
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    WidgetsFlutterBinding.ensureInitialized();
    await loadUserData();
    await SnapshotGuard.switchGuardStatus(true);
    runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => RegisterApi()),
      ChangeNotifierProvider(create: (_) => LoginApi()),
    ], child: const MyApp()));
  });
}

int currentIndex = 1;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lautech Manual',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: HexColor("#905F32")),
        useMaterial3: true,
      ),
      home: const MediaQuery(
        data: MediaQueryData(),
        child: SplashScreen(),
      ),
      debugShowCheckedModeBanner: false,
      // color: Colors.orange.shade900,
    );
  }
}
