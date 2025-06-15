import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_social/features/feed/data/posts.dart';
import 'package:flutter_social/features/feed/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_state.dart';
part 'feed_cubit.freezed.dart';

class FeedCubit extends Cubit<FeedState> {
  FeedCubit() : super(FeedState.initial());

  Future<void> loadPosts() async {
    emit(FeedState.loading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      final List jsonList = jsonDecode(mockPosts);
      emit(
        FeedState.loaded(
          items: jsonList.map((e) => PostModel.fromJson(e)).toList(),
        ),
      );
    } catch (e) {
      emit(FeedState.error(message: e.toString()));
    }
  }
}
