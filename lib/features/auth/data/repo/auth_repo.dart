import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:learning_studio/core/logging/logger.dart';
import 'package:learning_studio/core/network/api_exception.dart';
import 'package:learning_studio/core/network/respnse_model.dart';
import 'package:learning_studio/core/network/result.dart';
import 'package:learning_studio/features/auth/data/models/sign_up_model.dart';
import 'package:learning_studio/shared/models/user_model.dart';

import '../auth_api.dart';

part 'auth_repo_impl.dart';

abstract class AuthRepo {
  Future<Result> login(String phoneNo);
  Future<Result<String?>> signup(SignUpModel data);
  Future<Result> verify(String phoneNo, String otp);
 }
