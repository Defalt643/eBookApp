import 'package:book_app/main.dart';
import 'package:flutter/material.dart';
import 'package:book_app/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 150,
                  child: Center(
                    child: Text(
                      'Elixir',
                      style: kHeading,
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextInput(
                              icon: FontAwesomeIcons.solidEnvelope,
                              hint: 'Email',
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                            ),
                            PasswordInput(
                              icon: FontAwesomeIcons.lock,
                              hint: 'Password',
                              inputAction: TextInputAction.done,
                            ),
                            Text(
                              'Forget Password?',
                              style: kBodyText,
                            ),
                          ]),
                      Column(
                        children: [
                          SizedBox(
                            height: 90,
                          ),
                          RoundedButton(
                            text: 'Login',
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return WelcomeScreen();
                                  },
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.white, width: 1))),
                            child: Text(
                              "CreateNewAccount",
                              style: kBodyText,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RoundedButton1 extends StatelessWidget {
  const RoundedButton1({Key key, @required this.buttonText}) : super(key: key);

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(16)),
      child: FlatButton(
          onPressed: (() {}),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              buttonText,
              style: kBodyText,
            ),
          )),
    );
  }
}
