import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social/core/auth/cubit/auth_cubit.dart';
import 'package:flutter_social/core/navigation/router.dart';
import 'package:flutter_social/features/feed/presentation/widgets/cubit/feed_cubit.dart';
import 'package:flutter_social/features/profile/presentation/widgets/cubit/profile_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit()..checkAuthentication(),
        ),
        BlocProvider<FeedCubit>(create: (_) => FeedCubit()..loadPosts()),
        BlocProvider<ProfileCubit>(create: (_) => ProfileCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
