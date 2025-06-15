part of 'feed_cubit.dart';

@freezed
class FeedState with _$FeedState {
  const factory FeedState.initial() = _Initial;
  const factory FeedState.loading() = _Loading;
  const factory FeedState.loaded({required List<PostModel> items}) = _Loaded;
  const factory FeedState.error({required String message}) = _Error;
}
