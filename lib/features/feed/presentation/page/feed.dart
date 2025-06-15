import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social/features/feed/presentation/widgets/cubit/feed_cubit.dart';
import 'package:flutter_social/features/feed/presentation/widgets/post.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Feed", style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 20),
        BlocBuilder<FeedCubit, FeedState>(
          builder: (context, state) => state.maybeWhen(
            loaded: (items) => Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Post(post: items[index]),
                  );
                },
              ),
            ),
            orElse: () => Center(child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }
}
