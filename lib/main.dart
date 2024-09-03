import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(

        //ddta lihat di file google-services.json
        apiKey: 'AIzaSyBSQaP2WKP6zVt8ZDwMk803kMDIqEGc55c', //current_key
        appId:
            '1:597832381066:android:b75a12985a36ecb18ab373', //mobilesdk_app_id
        messagingSenderId: '597832381066', //project_number
        projectId: 'latihan-lagii'), //project_id
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cardTheme: const CardTheme(surfaceTintColor: Colors.white),
        dialogTheme: const DialogTheme(
            surfaceTintColor: Colors.white, backgroundColor: Colors.white),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 183, 255)),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}