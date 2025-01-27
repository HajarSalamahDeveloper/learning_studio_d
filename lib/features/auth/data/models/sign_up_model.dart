import 'package:equatable/equatable.dart';
import 'package:learning_studio/shared/enums/enums.dart';

class SignUpModel extends Equatable {
  final String phone;
  final String userName;
  final UserType type;
  final String? organizationName;

  const SignUpModel({required this.phone, required this.userName, required this.type, this.organizationName});

  SignUpModel copyWith({
    String? phone,
    String? userName,
    UserType? type,
    String? organizationName,
  }) {
    return SignUpModel(
      phone: phone ?? this.phone,
      userName: userName ?? this.userName,
      type: type ?? this.type,
      organizationName: organizationName ?? this.organizationName,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'user_name': userName,
      'type': type.name,
      'organization_name': organizationName,
    };
  }

  static const SignUpModel empty = SignUpModel(phone: '', userName: '', type: UserType.personnel, organizationName: null);
  @override
  List<Object?> get props => [phone, userName, type, organizationName];
}
