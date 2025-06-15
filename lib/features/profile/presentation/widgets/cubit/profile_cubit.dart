import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_social/features/profile/data/profile.dart';
import 'package:flutter_social/features/profile/models/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial());

  Future<void> loadProfile(String userId) async {
    emit(ProfileState.loading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      final ProfileModel profile = ProfileModel.fromJson(
        jsonDecode(mockProfile),
      );
      emit(ProfileState.loaded(profile: profile));
    } catch (e) {
      emit(ProfileState.error(message: e.toString()));
    }
  }
}
