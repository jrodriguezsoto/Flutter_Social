import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_social/features/profile/data/user.dart';
import 'package:flutter_social/features/profile/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.unauthenticated());

  Future<void> checkAuthentication() async {
    await Future.delayed(const Duration(seconds: 1));

    emit(AuthState.authenticated(user: User.fromJson(jsonDecode(mockUser))));
  }
}
