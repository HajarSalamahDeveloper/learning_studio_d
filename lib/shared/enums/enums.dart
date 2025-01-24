/// Enum representing user types.
enum UserType { personnel, organizations }

/// Extension on UserType for string conversion.
extension UserTypeExtension on UserType {
  static UserType fromString(String value) {
    switch (value) {
      case 'personnel':
        return UserType.personnel;
      case 'organizations':
        return UserType.organizations;
      default:
        return UserType.personnel; // Default case
    }
  }
}

/// Enum representing building types.
enum BuildingType { house, office }

/// Enum representing payment methods.
enum Payment { byHand, creditCard, online }

/// Extension on Payment for string conversion.
extension PaymentExtension on Payment {
  static Payment fromString(String value) {
    switch (value) {
      case 'byHand':
        return Payment.byHand;
      case 'creditCard':
        return Payment.creditCard;
      case 'online':
        return Payment.online;
      default:
        return Payment.byHand; // Default case
    }
  }
}

/// Enum representing order statuses.
enum OrderStatus { pending, completed, canceled }

/// Extension on OrderStatus for string conversion.
extension OrderStatusExtension on OrderStatus {
  static OrderStatus fromString(String value) {
    switch (value) {
      case 'pending':
        return OrderStatus.pending;
      case 'completed':
        return OrderStatus.completed;
      case 'canceled':
        return OrderStatus.canceled;
      default:
        return OrderStatus.pending; // Default case
    }
  }
}

/// Enum representing currency types.
enum Currency { oyer, nyer }

/// Extension on Currency for string conversion.
extension CurrencyExtension on Currency {
  static Currency fromString(String value) {
    switch (value) {
      case 'oyer':
        return Currency.oyer;
      case 'nyer':
        return Currency.nyer;
      default:
        return Currency.oyer; // Default case
    }
  }
}
