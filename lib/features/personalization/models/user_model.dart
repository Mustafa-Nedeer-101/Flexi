import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flexi/utils/formatters/foramtter.dart';

class UserModel {
  UserModel(
      {required this.id,
      required this.username,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.profilePicture});
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  // Helper Functions

  // Get Full Name of a User
  String get fullName => '$firstName $lastName';

  // format phone number of a User
  String get formattedPhoneNumber =>
      UFormatterUtils.formatPhoneNumber(phoneNumber);

  // split the full name of a user
  static List<String> nameParts(String fullName) => fullName.split(" ");

  // generate a username for the given full name
  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");

    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "flex_$camelCaseUsername";

    return usernameWithPrefix;
  }

  // return an empty model
  static UserModel empty() => UserModel(
      id: '',
      username: '',
      email: '',
      firstName: '',
      lastName: '',
      phoneNumber: '',
      profilePicture: '');

  // return the Json version of the model
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  // a constructor when data retrieved from a document
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          username: data['Username'] ?? '',
          email: data['Email'] ?? '',
          firstName: data['FirstName'] ?? '',
          lastName: data['LastName'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',
          profilePicture: data['ProfilePicture'] ?? '');
    } else {
      return empty();
    }
  }
}
