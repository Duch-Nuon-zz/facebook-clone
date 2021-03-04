import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:social_media/nuon_icons.dart';
import 'package:social_media/views/pages/post_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      initialIndex: currentIndex,
      child: Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.01,
          title: Text(
            'Facebook',
            style: TextStyle(
              color: Colors.blue[900],
              fontWeight: FontWeight.bold,
              fontSize: 30,
              letterSpacing: 1.0,
            ),
          ),
          actions: [
            CircleAvatar(
              backgroundColor: Colors.grey[100],
              child: IconButton(
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.purple,
                ),
                onPressed: () {},
                iconSize: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(
                backgroundColor: Colors.grey[100],
                child: IconButton(
                  icon: Icon(
                    Nuon.facebook_messenger,
                    color: Colors.purple,
                  ),
                  iconSize: 26,
                  onPressed: () {},
                ),
              ),
            ),
          ],
          bottom: TabBar(
            indicatorWeight: 3,
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.blue,
            tabs: [
              Tab(icon: Icon(Icons.home_outlined, size: 30)),
              Tab(icon: Icon(Icons.group_outlined, size: 30)),
              Tab(icon: Icon(Icons.ondemand_video_outlined, size: 30)),
              Tab(icon: Icon(Icons.account_circle_outlined, size: 30)),
              Tab(icon: Icon(Icons.notifications_none_outlined, size: 30)),
              Tab(icon: Icon(Icons.menu_outlined, size: 30)),
            ],
          ),
        ),
        body: PostPage(),
      ),
    );
  }
}
