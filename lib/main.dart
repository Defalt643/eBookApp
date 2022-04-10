import 'package:book_app/data/userData.dart';
import 'package:book_app/widgets/profileWelcom.dart';
import 'package:book_app/widgets/widgets.dart';
import 'package:book_app/screens/home_screen.dart';
import 'package:book_app/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book App',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, fontFamily: 'Raleway'
          // textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
          // textTheme: Theme.of(context).textTheme.apply(
          //       displayColor: kBlackColor,
          //     ),
          ),
      home: LoginPage(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  HomeScreen _slectedhomeScreen;
  final user = UserPreferences.myUser;
  void _handleHomeTapped(HomeScreen home) {
    setState(() {
      _slectedhomeScreen = home;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Studio Ghibli.jfif"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline3,
                children: [
                  TextSpan(
                    text: "Welcome back!!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-1.5, -1.5),
                              color: Colors.white),
                          Shadow(
                              // bottomRight
                              offset: Offset(1.5, -1.5),
                              color: Colors.white),
                          Shadow(
                              // topRight
                              offset: Offset(1.5, 1.5),
                              color: Colors.white),
                          Shadow(
                              // topLeft
                              offset: Offset(-1.5, 1.5),
                              color: Colors.white),
                        ]),
                  ),
                ],
              ),
            ),
            WelcomeProfileWidget(
              imagePath: user.imagePath,
              onClicked: () async {},
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: RoundedButton(
                text: "start reading",
                fontSize: 20,
                press: () {
                  Navigator(
                    pages: [
                      MaterialPage(
                          child: HomeScreen(
                        onTap: _handleHomeTapped,
                      ))
                    ],
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
