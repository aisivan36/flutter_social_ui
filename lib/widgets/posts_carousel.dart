import 'package:flutter/material.dart';

import '../models/post_model.dart';

class PostsCarousel extends StatelessWidget {
  final PageController? pageController;
  final String? title;
  final List<Post>? posts;

  const PostsCarousel({Key? key, this.pageController, this.title, this.posts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _buildPost(BuildContext context, int index) {
      Post post = posts![index];

      return AnimatedBuilder(
        animation: pageController!,
        builder: (BuildContext context, Widget? widget) {
          double value = 1;
          if (pageController!.position.haveDimensions) {
            value = pageController!.page! - index;
            value = (1 - (value.abs() * 0.15)).clamp(0.0, 1.0);
          }
          return Center(
            child: SizedBox(
              height: Curves.slowMiddle.transform(value) * 400.0,
              child: widget,
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: const [
                  BoxShadow(offset: Offset(0, 2), blurRadius: 7.0),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  height: 400.0,
                  width: 300.0,
                  image: AssetImage(post.imageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                padding: const EdgeInsets.all(12.0),
                height: 110.0,
                decoration: const BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10.0,
                    left: 3.0,
                    right: 7.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.title!,
                        style: const TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        post.location!,
                        style: const TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              const SizedBox(width: 5.0),
                              Text(
                                post.likes.toString(),
                                style: const TextStyle(fontSize: 17.0),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.comment,
                                color: Theme.of(context).primaryColor,
                              ),
                              const SizedBox(width: 5.0),
                              Text(
                                post.comments.toString(),
                                style: const TextStyle(fontSize: 17.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: Text(
            title!,
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Container(
          height: 400.0,
          child: PageView.builder(
              controller: pageController,
              itemCount: posts!.length,
              itemBuilder: (BuildContext context, index) {
                return _buildPost(context, index);
              }),
        )
      ],
    );
  }
}
