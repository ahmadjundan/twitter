import 'package:fpdart/fpdart.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/core/type_defs.dart';

// signup, -> Account
// user related data -> model.Account

final authAPIProvider = Provider((ref) {
  final account = ref.watch(appwriteAccountProvider);
  return AuthAPI(account: account);
});

abstract class IAuthAPI {
  FutureEither<model.Account> signUp ({
    required String email,
    required String password,
  });
}



