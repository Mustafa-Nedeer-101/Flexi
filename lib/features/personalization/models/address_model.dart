import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  AddressModel(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.street,
      required this.postalCode,
      required this.city,
      required this.state,
      required this.country,
      this.dateTime,
      this.isSelectedAddress = true});

  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String postalCode;
  final String city;
  final String state;
  final String country;
  final DateTime? dateTime;
  bool isSelectedAddress;

  static AddressModel empty() {
    return AddressModel(
        id: '',
        name: '',
        phoneNumber: '',
        street: '',
        postalCode: '',
        city: '',
        state: '',
        country: '');
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'PhoneNumber': phoneNumber,
      'Street': street,
      'PostalCode': postalCode,
      'City': city,
      'State': state,
      'Country': country,
      'DateTime': DateTime.now(),
      'IsSelectedAddress': isSelectedAddress,
    };
  }

  factory AddressModel.instanceFromMap(Map<String, dynamic> data) {
    return AddressModel(
      id: data['Id'] as String,
      name: data['Name'] as String,
      phoneNumber: data['PhoneNumber'] as String,
      street: data['Street'] as String,
      postalCode: data['PostalCode'] as String,
      city: data['City'] as String,
      state: data['State'] as String,
      country: data['Country'] as String,
      dateTime: (data['DateTime'] as Timestamp).toDate(),
      isSelectedAddress: data['IsSelectedAddress'] as bool,
    );
  }

  // Document Snapshot
  factory AddressModel.instanceFromDocumentSnapshot(
      DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data() as Map<String, dynamic>;

    return AddressModel(
      id: data['Id'],
      name: data['Name'] ?? '',
      phoneNumber: data['PhoneNumber'] ?? '',
      street: data['Street'] ?? '',
      postalCode: data['PostalCode'] ?? '',
      city: data['City'] ?? '',
      state: data['State'] ?? '',
      country: data['Country'] ?? '',
      dateTime: (data['DateTime'] as Timestamp).toDate(),
      isSelectedAddress: data['IsSelectedAddress'] as bool,
    );
  }

  @override
  String toString() {
    return '$street, $city, $state, $postalCode, $country';
  }
}
