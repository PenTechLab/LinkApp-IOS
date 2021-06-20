import 'package:flutter/material.dart';




class ChannelScreen extends StatefulWidget {
  @override
  _ChannelScreenState createState() => _ChannelScreenState();
}

class _ChannelScreenState extends State<ChannelScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: Text("Channels"),
        actions: [
          IconButton(
            icon: Icon(Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(

            icon: Icon(Icons.campaign,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: new Center(
        child: new Text("You have not joined any Channel, search available channels or click Channel icon on the right Top bar to create one."),
      ),
    );
  }
}
