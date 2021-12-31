import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatoca/dashboard.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}

//

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      imageBackground: const AssetImage('assets/splash.jpg'),
      useLoader: false,
      navigateAfterSeconds: const HomePage(),
    );
  }
}

//

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: _initializeFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const LoginScreen();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("Email not contain any User");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Padding(
        padding: const EdgeInsets.all(21.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "HATOCA",
                style: TextStyle(
                  color: Color.fromRGBO(172, 43, 43, 1),
                  fontSize: 46.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 42.0,
              ),
              TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.mail, color: Colors.black45),
                  )),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock, color: Colors.black45),
                  )),
              const SizedBox(height: 8.0),
              const Text(
                "Forgot Password",
                style: TextStyle(
                  color: Color.fromRGBO(172, 43, 43, 1),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Container(
                width: double.infinity,
                child: RawMaterialButton(
                  fillColor: const Color.fromRGBO(172, 43, 43, 1),
                  elevation: 0.0,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  onPressed: () async {
                    User? user = await loginUsingEmailPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                        context: context);
                    print(user);
                    if (user != null) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ]));
  }
}
