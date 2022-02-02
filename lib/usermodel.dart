import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Customer extends Equatable {
  // const Job({required this.id, required this.name, required this.ratePerHour});
  const Customer(
      {required this.username, required this.phone, required this.uid});
  final String username;
  final String phone;
  final String uid;

  @override
  List<Object> get props => [uid, username, phone];

  @override
  bool get stringify => true;

  factory Customer.fromMap(Map<String, dynamic>? data, String documentId) {
    if (data == null) {
      throw StateError('missing data for jobId: $documentId');
    }
    // final name = data['name'] as String?;
    // if (name == null) {
    //   throw StateError('missing name for jobId: $documentId');
    // }
    final username = data['username'] as String;

    final phone = data['phone'] as String;
    // final city = data['city'] as String;
    print(username);
    return Customer(uid: documentId, username: username, phone: phone);
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username, // fieldname:formfieldname
      'phone': phone,
      'createdOrUpdatedOn': DateTime.now()
    };
  }
}
