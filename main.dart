
import 'package:fire/auth_page.dart';
import 'package:fire/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
 import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  runApp(const MyApp());
 

// ...

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}
final navigatorKey=GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
     builder:((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }else if(snapshot.hasError){
        return Center(child: Text('Something went wrong!'),);
      }else if (snapshot.hasData){
        return HomePage();
       }else{
        return AuthPage();
       }
     })
  ));
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    
}
