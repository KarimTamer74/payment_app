// features/checkout/data/models/create_cutomer_response.dart
class CreateCustomerResponse {
  final String id;
  final String email;
  final String name;
  final String phone;
  final String address;

  CreateCustomerResponse({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.address,
  });

  factory CreateCustomerResponse.fromJson(Map<String, dynamic> json) {
    return CreateCustomerResponse(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
    );
  }
}