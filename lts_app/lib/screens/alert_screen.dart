import 'package:flutter/material.dart';
import 'package:lts_app/data/data.dart';
import 'package:lts_app/models/post_model.dart';
import 'package:lts_app/widgets/circle_button.dart';
import 'package:lts_app/widgets/create_post_container.dart';
import 'package:lts_app/widgets/post_container.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  AlertScreenState createState() => AlertScreenState();
}

class AlertScreenState extends State<AlertScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              // brightness: Brightness.light,
              backgroundColor: Colors.black,
              title: const Text(
                'LTS',
                style: TextStyle(
                  color: Color.fromRGBO(106, 0, 191, 1),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2,
                ),
              ),
              centerTitle: false,
              floating: true,
              actions: [
                CircleButton(
                  icon: Icons.search,
                  iconSize: 30.0,
                  onPressed: () {
                    // [TODO] handler event click
                  },
                ),
              ],
            ),
            const SliverToBoxAdapter(
              child: CreatePostContainer(currentUser: currentUser),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final Post post = posts[index];
                  return PostContainer(post: post);
                },
                childCount: posts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
