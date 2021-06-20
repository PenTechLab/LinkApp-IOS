import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:linkapp/presentation/screens/emarket/payment_screen.dart';
import 'package:linkapp/presentation/widgets/theme/primary_button.dart';
import 'package:linkapp/presentation/widgets/theme/style.dart';

class ProductPromotion extends StatefulWidget {


  @override
  _ProductPromotionState createState() => _ProductPromotionState();
}

class _ProductPromotionState extends State<ProductPromotion> {

  var selectedPackage, selectedMethod;
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  List<String> _paymentMethod = <String>[
    'Credit Card',
    'Debit Card',
  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Container(
          alignment: Alignment.center,
          child: Text("Promotion Details",
              style: TextStyle(
                color: Colors.white,
              )),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.coins,
              size: 20.0,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ],
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.always, key: _formKeyValue,
        child: new ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          children: <Widget>[
            SizedBox(height: 20.0),
            new TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(
                  FontAwesomeIcons.userCircle,
                  color: kPrimaryColor,
                ),
                hintText: 'Enter Business or Company Name',
                labelText: 'Company Name',
              ),
            ),

            new TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(
                  FontAwesomeIcons.envelope,
                  color: kPrimaryColor,
                ),
                hintText: 'Enter a valid Email Address',
                labelText: 'Official Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),

            SizedBox(height: 40.0),
            StreamBuilder <QuerySnapshot>(

              stream: FirebaseFirestore.instance.collection("packages").snapshots(),
                // ignore: missing_return
                builder: (context, snapshot)
              {
                if (!snapshot.hasData)
                const Text("Loading...");

                else{
                  List<DropdownMenuItem> packagesItems=[];
                  for(int i = 0; i < snapshot.data.docs.length; i++) {
                      DocumentSnapshot snap = snapshot.data.docs[i];
                      packagesItems.add(
                        DropdownMenuItem(
                          child: Text(
                          snap.id,
                          style: TextStyle(color: kPrimaryColor),
                        ),
                          value: "${snap.id}",

                        ),
                      );
                    }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.coins,
                          size: 25.0, color: kPrimaryColor),
                      SizedBox(width: 50.0),
                      DropdownButton(
                          items: packagesItems,
                        onChanged: (packagesType){
                            final snackBar = SnackBar(
                                content: Text(
                                  'Selected Package OF $packagesType',
                                  style: TextStyle(color: kPrimaryColor),
                                ),
                            );
                            // ignore: missing_return

                            Scaffold.of(context).showSnackBar(snackBar);
                            setState(() {
                              selectedPackage = packagesType;

                            });
                        },
                        value: selectedPackage,
                        isExpanded: false,
                          hint: new Text(
                            "Select Package Type",
                            style: TextStyle(color: kPrimaryColor),
                          )

                      ),
                    ],

                  );
                }
              } ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.moneyBill,
                  size: 25.0,
                  color: kPrimaryColor,
                ),
                SizedBox(width: 50.0),
                DropdownButton(
                  items: _paymentMethod
                      .map((value) => DropdownMenuItem(
                    child: Text(
                      value,
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    value: value,
                  ))
                      .toList(),
                  onChanged: (selectedPaymentMethod) {
                    print('$selectedPaymentMethod');
                    setState(() {
                      selectedMethod = selectedPaymentMethod;
                    });
                  },
                  value: selectedMethod,
                  isExpanded: false,
                  hint: Text(
                    'Select Payment Method',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 150.0,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.lightGreen,
                  minWidth: 150,
                  height: 40,
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => PaymentScreen()));
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
