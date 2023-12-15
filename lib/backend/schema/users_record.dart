import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "no" field.
  int? _no;
  int get no => _no ?? 0;
  bool hasNo() => _no != null;

  // "receiptNumber" field.
  int? _receiptNumber;
  int get receiptNumber => _receiptNumber ?? 0;
  bool hasReceiptNumber() => _receiptNumber != null;

  // "roles" field.
  List<String>? _roles;
  List<String> get roles => _roles ?? const [];
  bool hasRoles() => _roles != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _no = castToType<int>(snapshotData['no']);
    _receiptNumber = castToType<int>(snapshotData['receiptNumber']);
    _roles = getDataList(snapshotData['roles']);
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  int? no,
  int? receiptNumber,
  String? displayName,
  String? phoneNumber,
  DateTime? createdTime,
  String? uid,
  String? photoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'no': no,
      'receiptNumber': receiptNumber,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'created_time': createdTime,
      'uid': uid,
      'photo_url': photoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.no == e2?.no &&
        e1?.receiptNumber == e2?.receiptNumber &&
        listEquality.equals(e1?.roles, e2?.roles) &&
        e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.createdTime == e2?.createdTime &&
        e1?.uid == e2?.uid &&
        e1?.photoUrl == e2?.photoUrl;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.no,
        e?.receiptNumber,
        e?.roles,
        e?.displayName,
        e?.phoneNumber,
        e?.createdTime,
        e?.uid,
        e?.photoUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
