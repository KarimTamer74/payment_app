// features/checkout/data/models/create_cutomer_requset.dart
class CreateCutomerRequset {
  final String? email;
  final String? name;
  final String? phone;
  final Address? address;

  CreateCutomerRequset({this.email, this.name, this.phone, this.address});

  Map<String, dynamic> toJson() {
    return {'email': email, 'name': name, 'phone': phone, 'address': address};
  }
}

class Address {
  final String line1;
  final String line2;
  final String city;
  final String state;
  final String country;
  final String postalCode;

  Address({
    required this.line1,
    required this.line2,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'line1': line1,
      'line2': line2,
      'city': city,
      'state': state,
      'country': country,
      'postal_code': postalCode,
    };
  }
}
