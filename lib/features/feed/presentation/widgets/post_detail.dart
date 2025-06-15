import 'package:flutter/material.dart';
import 'package:flutter_social/features/feed/models/post.dart';

class PostDetail extends StatelessWidget {
  final PostModel post;
  const PostDetail({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: BackButton()),
        Row(
          children: [
            Hero(
              tag: 'avatar-${post.id}',
              child: CircleAvatar(radius: 30, child: FlutterLogo()),
            ),
            SizedBox(width: 10),
            Text(post.authorId, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        Text(post.content, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
