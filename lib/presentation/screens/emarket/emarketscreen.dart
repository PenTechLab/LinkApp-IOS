import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:linkapp/presentation/screens/emarket/products_promotion.dart';
import 'package:linkapp/presentation/widgets/theme/primary_button.dart';
import 'package:linkapp/presentation/widgets/theme/style.dart';
import 'package:transparent_image/transparent_image.dart';



class EmarketScreen extends StatefulWidget {
  @override
  _EmarketScreenState createState() => _EmarketScreenState();
}

class _EmarketScreenState extends State<EmarketScreen> {

  final List<String> images = [
    'https://linkappinfo.com/admin/ads/ad.jpg',
    'https://linkappinfo.com/admin/ads/ad0.png',
    'https://linkappinfo.com/admin/ads/ad1.jpeg',
    'https://linkappinfo.com/admin/ads/ad2.jpeg',
    'https://linkappinfo.com/admin/ads/ad3.jpeg',
    'https://linkappinfo.com/admin/ads/ad4.png',
    'https://linkappinfo.com/admin/ads/ad5.png',
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: Text("E-Market"),
        actions: [
          IconButton(
            icon: Icon(Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(

            icon: Icon(Icons.image,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.videocam,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            // SizedBox(height: kDefaultPadding * 1.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Promoted",
                  style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
                ),
                PrimaryButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  text: "Promote Your Product",
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPromotion(),
                    ),
                  ),
                ),


              ],
            ),

            Container(
              height: 166.0,
              margin: EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              child: Carousel(
                dotSpacing: 15.0,
                dotSize: 6.0,
                animationDuration: const Duration(milliseconds:300),
                dotIncreasedColor: Colors.lightGreenAccent,
                dotBgColor: Colors.transparent,
                indicatorBgPadding: 10.0,
                dotPosition: DotPosition.bottomCenter,

                images: images
                    .map((item) => Container(
                  child: Image.network(
                    item,
                    fit: BoxFit.fill,
                  ),
                ))
                    .toList(),
              ),
            ),
            //TODO:LOAD MARKET IMAGES
            // StreamBuilder(
            //   stream: FirebaseFirestore.instance.collection('imageURLs').snapshots(),
            //   builder: (context, snapshot) {
            //     return !snapshot.hasData
            //         ? Center(
            //       child: CircularProgressIndicator(),
            //     )
            //         : Container(
            //       padding: EdgeInsets.all(4),
            //       child: GridView.builder(
            //           itemCount: snapshot.data.documents.length,
            //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //               crossAxisCount: 2),
            //           itemBuilder: (context, index) {
            //             return Container(
            //               margin: EdgeInsets.all(3),
            //               child: FadeInImage.memoryNetwork(
            //                   fit: BoxFit.cover,
            //                   placeholder: kTransparentImage,
            //                   image: snapshot.data.documents[index].get('url')),
            //             );
            //           }),
            //     );
            //   },
            // ),



          ],
        ),
      ),
    );
  }
}
