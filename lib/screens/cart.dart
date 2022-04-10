import 'package:book_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:book_app/data/data.dart';

class CartView extends StatefulWidget {
  get detail => Data().details;
  CartView(this.vol);
  final vol;
  @override
  _CartViewState createState() => _CartViewState(vol);
}

class _CartViewState extends State<CartView> {
  get detail => Data().details;
  _CartViewState(this.vol);
  final vol;
  final item = Data().details;
  var cart = {};
  var quantity = {};
  @override
  Widget build(BuildContext context) {
    int subtotal = item[vol]["price"];
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return HomeScreen();
              //     },
              //   ),
              // );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Shopping cart",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
              ),
              SizedBox(
                height: 18.0,
              ),
              cartItem(vol),
              SizedBox(
                height: 18.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item[vol]["price"].toString() + " THB",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  )
                ],
              ),
              SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Delivery charge",
                    style: TextStyle(fontSize: 14.0),
                  ),
                  Text(
                    "35.00" + " THB",
                    style: TextStyle(fontSize: 14.0),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Sub Total",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    (subtotal + 35).toString() + " THB",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Spacer(),
              MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('Thank you'),
                            content: Text(
                                'Thank you for your puchase.\nReceipt No.123456789\nPurchase Data: 9 April 2022\nTime:19:16 PM.'),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('OK'))
                            ],
                          ));
                },
                color: Colors.cyan,
                height: 50.0,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  "PROCESS TO CHECKOUT",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
            ],
          ),
        ));
  }

  Container cartItem(int id) {
    print(id);
    final item = detail[id];
    var total = item["price"];
    var quantity = 1;
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20.0)),
            child: Center(
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: new ExactAssetImage(item["image"])),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 100.0,
                  child: Text(
                    item["name"],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 111, 111, 111),
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: new Icon(
                            Icons.exposure_minus_1_rounded,
                            size: 15.0,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            print('minus');
                            quantity--;
                            print(quantity);
                          }),
                      // child: Icon(
                      //   Icons.exposure_minus_1_rounded,
                      //   color: Colors.white,
                      //   size: 15.0,
                      // ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        quantity.toString(),
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 48, 109, 158),
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: new Icon(
                            Icons.plus_one_rounded,
                            size: 15.0,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            print('plus');
                            quantity++;
                            print(quantity);
                          }),
                      // child: Icon(
                      //   Icons.plus_one_rounded,
                      //   color: Colors.white,
                      //   size: 15.0,
                      // ),
                    ),
                    Spacer(),
                    Text(
                      total.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
