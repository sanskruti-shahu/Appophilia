import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  ScrollController _scrollController;
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      keepScrollOffset: true,
      initialScrollOffset: 0,
    );
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
    setState(() {});
  }
  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(

          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Text('Hello,'),
                Text(" "),
                TabBar(tabs: [
                  Tab(
                    child: Text('Latest News'),
                  ),
                  Tab(
                    child: Text('Activities'),
                  ),
                  Tab(
                    child: Text('Activities'),
                  ),
                ],
                  controller: _tabController,
                )
              ],
            ),
          ),
        )
    );
  }
}
