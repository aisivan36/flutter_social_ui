import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';
import 'package:flutter_social_ui/widgets/following_widget.dart';
import 'package:flutter_social_ui/widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late PageController pageController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          'UI SCREEN',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 5.0,
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: const TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontSize: 19.0),
          indicatorWeight: 3.5,
          tabs: const [
            Tab(
              text: 'Trending',
            ),
            Tab(
              text: 'latest',
            ),
          ],
        ),
      ),
      drawer: const CUstomDrawer(),
      body: ListView(
        children: [
          const FollowingUsers(),
          PostsCarousel(
            pageController: pageController,
            title: 'Posts',
            posts: posts,
          ),
        ],
      ),
    );
  }
}
