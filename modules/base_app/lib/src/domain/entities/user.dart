import 'package:shared/shared.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String company;
  final String username;
  final String email;
  final String address;
  final String zip;
  final String state;
  final String country;
  final String phone;
  final String photo;
  const User({
    required this.id,
    required this.name,
    required this.company,
    required this.username,
    required this.email,
    required this.address,
    required this.zip,
    required this.state,
    required this.country,
    required this.phone,
    required this.photo,
  });
  @override
  List<Object?> get props => [
        id,
        name,
        company,
        username,
        email,
        address,
        zip,
        state,
        country,
        phone,
        photo,
      ];
}
