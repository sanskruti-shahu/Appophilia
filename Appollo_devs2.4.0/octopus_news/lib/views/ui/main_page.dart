import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:octopus_news/views/ui/listofimage.dart';
import 'package:sliver_tools/sliver_tools.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

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
          body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, value) {
          return [
            SliverAppBar(
              floating: false,
              pinned: false,
              expandedHeight: 50,
            ),
            SliverAppBar(
              leading: Container(),
              expandedHeight: 250.0,
              floating: false,
              pinned: true,
            ),
            SliverPinnedHeader(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TabBar(
                    indicator: BubbleTabIndicator(
                      indicatorHeight: 45,
                      indicatorRadius: 10,
                      insets: EdgeInsets.only(left: 30, right: 30),
                      indicatorColor: Colors.black12,
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    ),
                    overlayColor:
                    MaterialStateProperty.all(Colors.transparent),
                    enableFeedback: true,
                    controller: _tabController,
                    tabs: [
                      Tab(
                        child:Text("Latest news")
                        ),
                      Tab(
                        child: Text("Activities")
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              ),

            )
          ];
        },
        body: Container(
          child: TabBarView(
          controller: _tabController,
            children: [
              ListView.builder(
                itemCount: LatestnewsImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding:
                    EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    height: 240,
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(LatestnewsImages[index]),
                            fit: BoxFit.fill
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                    ),
                  );
                },
              ),
              ListView.builder(
                itemCount: LatestnewsImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding:
                    EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    height: 240,
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(LatestnewsImages[index]),
                            fit: BoxFit.fill),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                    ),
                  );
                },
              ),
              ListView.builder(
                itemCount: LatestnewsImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding:
                    EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    height: 240,
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(LatestnewsImages[index]),
                            fit: BoxFit.fill),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
    )
    ),
    );
  }
}

