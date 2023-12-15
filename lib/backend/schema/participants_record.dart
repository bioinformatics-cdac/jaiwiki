import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ParticipantsRecord extends FirestoreRecord {
  ParticipantsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "designation" field.
  String? _designation;
  String get designation => _designation ?? '';
  bool hasDesignation() => _designation != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  bool hasMobile() => _mobile != null;

  // "poster" field.
  bool? _poster;
  bool get poster => _poster ?? false;
  bool hasPoster() => _poster != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  // "Abstract" field.
  String? _abstract;
  String get abstract => _abstract ?? '';
  bool hasAbstract() => _abstract != null;

  // "presenting_author" field.
  String? _presentingAuthor;
  String get presentingAuthor => _presentingAuthor ?? '';
  bool hasPresentingAuthor() => _presentingAuthor != null;

  // "abstract_title" field.
  String? _abstractTitle;
  String get abstractTitle => _abstractTitle ?? '';
  bool hasAbstractTitle() => _abstractTitle != null;

  // "attendence" field.
  bool? _attendence;
  bool get attendence => _attendence ?? false;
  bool hasAttendence() => _attendence != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _address = snapshotData['address'] as String?;
    _gender = snapshotData['gender'] as String?;
    _password = snapshotData['password'] as String?;
    _designation = snapshotData['designation'] as String?;
    _state = snapshotData['state'] as String?;
    _email = snapshotData['email'] as String?;
    _mobile = snapshotData['mobile'] as String?;
    _poster = snapshotData['poster'] as bool?;
    _author = snapshotData['author'] as String?;
    _abstract = snapshotData['Abstract'] as String?;
    _presentingAuthor = snapshotData['presenting_author'] as String?;
    _abstractTitle = snapshotData['abstract_title'] as String?;
    _attendence = snapshotData['attendence'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('participants');

  static Stream<ParticipantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParticipantsRecord.fromSnapshot(s));

  static Future<ParticipantsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParticipantsRecord.fromSnapshot(s));

  static ParticipantsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ParticipantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParticipantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParticipantsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParticipantsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParticipantsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParticipantsRecordData({
  String? name,
  String? address,
  String? gender,
  String? password,
  String? designation,
  String? state,
  String? email,
  String? mobile,
  bool? poster,
  String? author,
  String? abstract,
  String? presentingAuthor,
  String? abstractTitle,
  bool? attendence,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'address': address,
      'gender': gender,
      'password': password,
      'designation': designation,
      'state': state,
      'email': email,
      'mobile': mobile,
      'poster': poster,
      'author': author,
      'Abstract': abstract,
      'presenting_author': presentingAuthor,
      'abstract_title': abstractTitle,
      'attendence': attendence,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParticipantsRecordDocumentEquality
    implements Equality<ParticipantsRecord> {
  const ParticipantsRecordDocumentEquality();

  @override
  bool equals(ParticipantsRecord? e1, ParticipantsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.address == e2?.address &&
        e1?.gender == e2?.gender &&
        e1?.password == e2?.password &&
        e1?.designation == e2?.designation &&
        e1?.state == e2?.state &&
        e1?.email == e2?.email &&
        e1?.mobile == e2?.mobile &&
        e1?.poster == e2?.poster &&
        e1?.author == e2?.author &&
        e1?.abstract == e2?.abstract &&
        e1?.presentingAuthor == e2?.presentingAuthor &&
        e1?.abstractTitle == e2?.abstractTitle &&
        e1?.attendence == e2?.attendence;
  }

  @override
  int hash(ParticipantsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.address,
        e?.gender,
        e?.password,
        e?.designation,
        e?.state,
        e?.email,
        e?.mobile,
        e?.poster,
        e?.author,
        e?.abstract,
        e?.presentingAuthor,
        e?.abstractTitle,
        e?.attendence
      ]);

  @override
  bool isValidKey(Object? o) => o is ParticipantsRecord;
}
