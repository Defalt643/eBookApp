import 'package:book_app/consttants.dart';
import 'package:book_app/data/userData.dart';
import 'package:book_app/screens/cart.dart';
import 'package:book_app/screens/details_screen.dart';
import 'package:book_app/screens/profile_screen.dart';
import 'package:book_app/widgets/widgets.dart';
import 'package:book_app/data/data.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final ValueChanged<HomeScreen> onTap;
  HomeScreen({Key key, this.onTap}) : super(key: key);

  DetailsScreen _selectedDetail;
  int _handleDetailTapped(DetailsScreen detail, var vol) {
    _selectedDetail = detail;
    return vol;
  }

  final user = UserPreferences.myUser;
  get book => Data().details;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProfilePage();
              },
            ),
          );
        },
        child: Image.asset('assets/images/62160244-modified.png'),
        mini: false,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Bitmap.png"),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: size.height * .1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline4,
                        children: [
                          TextSpan(text: "What are you \nreading "),
                          TextSpan(
                              text: "today?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  // ProfileWidget(
                  //   imagePath: user.imagePath,
                  //   onClicked: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) {
                  //           return ProfilePage();
                  //         },
                  //       ),
                  //     );
                  //   },
                  // ),

                  SizedBox(height: 30),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        for (var i = 0; i < book.length; i++)
                          ReadingListCard(
                            image: book[i]["image"],
                            title: book[i]["name"],
                            auth: book[i]["auth"],
                            rating: book[i]["rating"],
                            pressDetails: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DetailsScreen(i);
                                  },
                                ),
                              );
                            },
                            pressRead: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CartView(i);
                                  },
                                ),
                              );
                            },
                          ),
                        SizedBox(width: 30),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.headline4,
                            children: [
                              TextSpan(
                                  text: "Best of the ",
                                  style: TextStyle(color: Colors.black
                                      //   foreground: Paint()
                                      //     ..style = PaintingStyle.stroke
                                      //     ..strokeWidth = 2
                                      //     ..color = Colors.black)),
                                      )),
                              TextSpan(
                                text: "day",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        bestOfTheDayCard(size, context),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.headline4,
                            children: [
                              TextSpan(text: "Continue "),
                              TextSpan(
                                text: "reading...",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(38.5),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 33,
                                color: Color(0xFFD3D3D3).withOpacity(.84),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(38.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 30, right: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "Tensura Vol.18",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Fuse",
                                                style: TextStyle(
                                                  color: kLightBlackColor,
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Text(
                                                  "Chapter 77 of 79",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: kLightBlackColor,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                            ],
                                          ),
                                        ),
                                        Image.asset(
                                          "assets/images/slime.png",
                                          width: 55,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 7,
                                  width: size.width * .65,
                                  decoration: BoxDecoration(
                                    color: kProgressIndicator,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container bestOfTheDayCard(Size size, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: 245,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: 24,
                top: 24,
                right: size.width * .35,
              ),
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Color(0xFFEAEAEA).withOpacity(.75),
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      "Kodansha Comics USA since Aug 22, 2017.",
                      style: TextStyle(
                        fontSize: 9,
                        color: kLightBlackColor,
                      ),
                    ),
                  ),
                  Text(
                    "That Time I \nGot Reincarnated \nas a Slime",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    "Fuse",
                    style: TextStyle(color: kLightBlackColor),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: BookRating(score: 4.9),
                        ),
                        Expanded(
                          child: Text(
                            "It is just another ordinary day for Satoru Mikami. The sun is shining brightly on the streets….",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10,
                              color: kLightBlackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              "assets/images/slime.png",
              width: size.width * .37,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              height: 40,
              width: size.width * .3,
              child: TwoSideRoundedButton(
                text: "Read",
                radious: 24,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailsScreen(0);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
