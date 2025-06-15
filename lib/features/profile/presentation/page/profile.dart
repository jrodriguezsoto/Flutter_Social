import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social/core/auth/cubit/auth_cubit.dart';
import 'package:flutter_social/features/feed/presentation/widgets/post.dart';
import 'package:flutter_social/features/profile/presentation/widgets/cubit/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    final userID = context.read<AuthCubit>().state.maybeWhen(
      orElse: () => "",
      authenticated: (user) => user.id,
    );
    context.read<ProfileCubit>().loadProfile(userID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (profile) => Column(
            children: [
              CircleAvatar(radius: 50, child: FlutterLogo()),
              const SizedBox(height: 10),
              Text(
                profile.userId,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Text(
                    profile.friendsIds.length.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text("Friends"),
                ],
              ),
              Divider(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Post(post: profile.posts[index]);
                  },
                  itemCount: profile.friendsIds.length,
                ),
              ),
            ],
          ),
          orElse: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
