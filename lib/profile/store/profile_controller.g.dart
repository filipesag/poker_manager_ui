// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileController on _ProfileControllerBase, Store {
  late final _$userAtom =
      Atom(name: '_ProfileControllerBase.user', context: context);

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ProfileControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getUserAsyncAction =
      AsyncAction('_ProfileControllerBase.getUser', context: context);

  @override
  Future<dynamic> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  @override
  String toString() {
    return '''
user: ${user},
isLoading: ${isLoading}
    ''';
  }
}
