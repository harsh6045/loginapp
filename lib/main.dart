import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/firebase_options.dart';
import 'package:loginpage/screens/home_screen.dart';
import 'package:loginpage/screens/phone_auth/sign_in_with_phone.dart';
import 'package:loginpage/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  await NotificationService.initialize();


  // FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection("users").doc("Z3kfNrbsVBlgqPnP94S2").get();
  // log(snapshot.data().toString());

  // Map<String, dynamic> newUserData = {
  //   "name": "SlantCode",
  //   "email": "slantcode@gmail.com"
  // };
  // await _firestore.collection("users").doc("your-id-here").update({
  //   "email": "slantcode2@gmail.com"
  // });
  // log("User updated!");

  // await _firestore.collection("users").doc("Z3kfNrbsVBlgqPnP94S2").delete();
  // log("User deleted!");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser != null) ? HomeScreen() : SignInWithPhone(),
    );
  }
}