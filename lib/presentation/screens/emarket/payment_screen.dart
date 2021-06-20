import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkapp/presentation/screens/emarket/emarketscreen.dart';
import 'package:linkapp/presentation/widgets/theme/primary_button.dart';
import 'package:linkapp/presentation/widgets/theme/style.dart';

class PaymentScreen extends StatefulWidget {


  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
          child: Text("Payment Details",
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
                hintText: 'Account Name',
                labelText: 'Enter Account Name',
              ),
                keyboardType: TextInputType.text
            ),
            new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(
                    FontAwesomeIcons.moneyBillWave,
                    color: kPrimaryColor,
                  ),
                  hintText: 'Enter Account No.',
                  labelText: 'Account No.',
                ),
                keyboardType: TextInputType.number
            ),

            new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(
                    FontAwesomeIcons.calendar,
                    color: kPrimaryColor,
                  ),
                  hintText: 'Enter Card Expiry Date',
                  labelText: 'Expiry Date',
                ),
                keyboardType: TextInputType.number,
            ),
            new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(
                    FontAwesomeIcons.addressBook,
                    color: kPrimaryColor,
                  ),
                  hintText: 'Enter CV No.',
                  labelText: 'Card CV No.',
                ),
                keyboardType: TextInputType.text,
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
                        .push(MaterialPageRoute(builder: (context) => EmarketScreen()));
                  },
                  child: Text(
                    "Submit",
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
