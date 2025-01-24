import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:app_skeleton/core/di/locator.dart';
import 'package:app_skeleton/core/services/shared_pref_services.dart';
import 'package:app_skeleton/shared/enums/enums.dart';

/// Represents a user model with essential attributes.
class UserModel extends Equatable {
  final int id;
  final String name;
  final String? organization;
  final String phone;
  final String? image;
  final String? token;
  final UserType type;
  final bool isGuest;

  /// Constructs a [UserModel] instance.
  const UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.image,
    this.token,
    this.organization,
    required this.type,
    required this.isGuest,
  });

  /// Constructs a [UserModel] instance from a JSON map.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      organization: json['organization'],
      image: json['image'],
      token: json['token'],
      isGuest: json['isGuest'] ?? false,
      type: UserTypeExtension.fromString(json['type']),
    );
  }

  /// Creates a copy of this [UserModel] with optional modifications.
  UserModel copyWith(
      {int? id,
      String? name,
      String? phone,
      String? image,
      String? token,
      UserType? type,
      bool? isGuest,
      String? organization}) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      token: token ?? this.token,
      type: type ?? this.type,
      isGuest: isGuest ?? this.isGuest,
      organization: this.organization,
    );
  }

  /// Creates a guest [UserModel] instance with default values.
  const UserModel.guest()
      : this(
          id: 0,
          name: 'guest',
          phone: '',
          image: null,
          token: null,
          type: UserType.personnel,
          isGuest: true,
          organization: null,
        );

  /// Converts this [UserModel] instance to a JSON map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'organization': organization,
      'phone': phone,
      'image': image,
      'token': token,
      'type': type.name,
      'isGuest': isGuest,
    };
  }

  /// Saves this [UserModel] instance to SharedPreferences under a specified [key].
  void saveToSharedPreferences([String? key]) {
    String jsonString = json.encode(toMap());
    sl<SharedPreferencesService>().saveString(key ?? 'user', jsonString);
  }

  /// Retrieves a cached [UserModel] instance from SharedPreferences based on a specified [key].
  static UserModel? cache([String? key]) {
    String? jsonString =
        sl<SharedPreferencesService>().getString(key ?? 'user');

    if (jsonString != null) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      return UserModel.fromJson(jsonMap);
    }

    return null;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        image,
        token,
        type,
        isGuest,
        organization,
      ];
}
