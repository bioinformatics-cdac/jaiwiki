import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class OrganizersRecord extends FirestoreRecord {
  OrganizersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "empId" field.
  String? _empId;
  String get empId => _empId ?? '';
  bool hasEmpId() => _empId != null;

  // "mobileNo" field.
  String? _mobileNo;
  String get mobileNo => _mobileNo ?? '';
  bool hasMobileNo() => _mobileNo != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "roles" field.
  List<String>? _roles;
  List<String> get roles => _roles ?? const [];
  bool hasRoles() => _roles != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _empId = snapshotData['empId'] as String?;
    _mobileNo = snapshotData['mobileNo'] as String?;
    _name = snapshotData['name'] as String?;
    _password = snapshotData['password'] as String?;
    _roles = getDataList(snapshotData['roles']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('organizers');

  static Stream<OrganizersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrganizersRecord.fromSnapshot(s));

  static Future<OrganizersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrganizersRecord.fromSnapshot(s));

  static OrganizersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrganizersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrganizersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrganizersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrganizersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrganizersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrganizersRecordData({
  String? email,
  String? empId,
  String? mobileNo,
  String? name,
  String? password,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'empId': empId,
      'mobileNo': mobileNo,
      'name': name,
      'password': password,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrganizersRecordDocumentEquality implements Equality<OrganizersRecord> {
  const OrganizersRecordDocumentEquality();

  @override
  bool equals(OrganizersRecord? e1, OrganizersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.empId == e2?.empId &&
        e1?.mobileNo == e2?.mobileNo &&
        e1?.name == e2?.name &&
        e1?.password == e2?.password &&
        listEquality.equals(e1?.roles, e2?.roles);
  }

  @override
  int hash(OrganizersRecord? e) => const ListEquality()
      .hash([e?.email, e?.empId, e?.mobileNo, e?.name, e?.password, e?.roles]);

  @override
  bool isValidKey(Object? o) => o is OrganizersRecord;
}
