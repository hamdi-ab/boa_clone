class ActivationModel {
  final String accountNumber;
  final String phoneNumber;

  ActivationModel({required this.accountNumber, required this.phoneNumber});

  // Factory method for creating an ActivationModel from JSON
  factory ActivationModel.fromJson(Map<String, dynamic> json) {
    return ActivationModel(
      accountNumber: json['accountNumber'],
      phoneNumber: json['phoneNumber'],
    );
  }

  // Method to convert ActivationModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'accountNumber': accountNumber,
      'phoneNumber': phoneNumber,
    };
  }
}
