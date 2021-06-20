import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linkapp/presentation/widgets/theme/style.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color

      appBar: buildAppBar(context),
      // body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(

      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back_arrow.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[

        IconButton(
          icon: Icon(Icons.delete_forever,
            color: Colors.red,
          ),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}
