import 'package:flutter/material.dart';
import 'package:linkapp/domain/entities/user_entity.dart';
import 'package:linkapp/presentation/pages/chat_page.dart';
import 'package:linkapp/presentation/screens/channels/channels_screen.dart';
import 'package:linkapp/presentation/screens/emarket/emarketscreen.dart';
import 'package:linkapp/presentation/screens/groups/dart/my_groups.dart';
import 'package:linkapp/presentation/screens/home_screen.dart';
import 'package:linkapp/presentation/widgets/custom_tab_bar.dart';






class Chat extends StatefulWidget {
  final UserEntity userInfo;
  const Chat({Key key, this.userInfo}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ChatState();
  }
}

class ChatState extends State<Chat> {
  final int _currentPageIndex = 1;
  PageController _pageViewController = PageController(initialPage: 1);
  List<Widget> get _pages => [
    ChatPage(userInfo: widget.userInfo,),
    GroupScreen(),
    ChannelScreen(),
    EmarketScreen(),

  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;


  Widget _bottomNavigationBar(int selectedIndex) => Container(

    child: BottomNavigationBar(

      type: BottomNavigationBarType.fixed,
      onTap: (int index) => setState(() => _selectedIndex = index),
      currentIndex: selectedIndex,
      backgroundColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "Groups"),
        BottomNavigationBarItem(icon: Icon(Icons.campaign_sharp), label: "Channels"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_sharp), label: "E-Market"),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: _pages[_selectedIndex],
        bucket: bucket,
      ),
    );

  }
}
