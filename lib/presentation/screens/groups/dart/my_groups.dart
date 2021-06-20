import 'package:flutter/material.dart';
import 'package:linkapp/presentation/screens/groups/dart/create-group.dart';

class GroupScreen extends StatefulWidget {
  @override
  _GroupScreenState createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: Text("Groups"),
        actions: [
          IconButton(
            icon: Icon(Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.group_add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => CreateGroup()));
            },
          ),
        ],
      ),
      body: new Center(
        child: new Text("You are currently not added in any Group, click add Group icon on the right Top bar to create one."),
      ),
    );
  }
}
