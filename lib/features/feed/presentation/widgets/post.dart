import 'package:flutter/material.dart';
import 'package:flutter_social/features/feed/models/post.dart';
import 'package:go_router/go_router.dart';

class Post extends StatelessWidget {
  final PostModel post;
  const Post({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      child: ListTile(
        onTap: () {
          final currentLocation = GoRouter.of(
            context,
          ).routeInformationProvider.value.uri.toString();
          context.push('$currentLocation/detail', extra: post);
        },
        leading: Hero(
          tag: 'avatar-${post.id}',
          child: CircleAvatar(radius: 30, child: FlutterLogo()),
        ),
        title: Text(
          post.authorId,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          post.content,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
