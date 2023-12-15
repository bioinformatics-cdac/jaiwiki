import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class SpeakersRecord extends FirestoreRecord {
  SpeakersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "briefBio" field.
  String? _briefBio;
  String get briefBio => _briefBio ?? '';
  bool hasBriefBio() => _briefBio != null;

  // "designation" field.
  String? _designation;
  String get designation => _designation ?? '';
  bool hasDesignation() => _designation != null;

  // "emailId" field.
  String? _emailId;
  String get emailId => _emailId ?? '';
  bool hasEmailId() => _emailId != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "event" field.
  String? _event;
  String get event => _event ?? '';
  bool hasEvent() => _event != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "organization" field.
  String? _organization;
  String get organization => _organization ?? '';
  bool hasOrganization() => _organization != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "webUrl" field.
  List<String>? _webUrl;
  List<String> get webUrl => _webUrl ?? const [];
  bool hasWebUrl() => _webUrl != null;

  // "no" field.
  int? _no;
  int get no => _no ?? 0;
  bool hasNo() => _no != null;

  // "linkedIn" field.
  String? _linkedIn;
  String get linkedIn => _linkedIn ?? '';
  bool hasLinkedIn() => _linkedIn != null;

  // "researchGateUrl" field.
  List<String>? _researchGateUrl;
  List<String> get researchGateUrl => _researchGateUrl ?? const [];
  bool hasResearchGateUrl() => _researchGateUrl != null;

  // "attendence" field.
  bool? _attendence;
  bool get attendence => _attendence ?? false;
  bool hasAttendence() => _attendence != null;

  // "abstract" field.
  String? _abstract;
  String get abstract => _abstract ?? '';
  bool hasAbstract() => _abstract != null;

  void _initializeFields() {
    _briefBio = snapshotData['briefBio'] as String?;
    _designation = snapshotData['designation'] as String?;
    _emailId = snapshotData['emailId'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _event = snapshotData['event'] as String?;
    _name = snapshotData['name'] as String?;
    _organization = snapshotData['organization'] as String?;
    _password = snapshotData['password'] as String?;
    _webUrl = getDataList(snapshotData['webUrl']);
    _no = castToType<int>(snapshotData['no']);
    _linkedIn = snapshotData['linkedIn'] as String?;
    _researchGateUrl = getDataList(snapshotData['researchGateUrl']);
    _attendence = snapshotData['attendence'] as bool?;
    _abstract = snapshotData['abstract'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('speakers');

  static Stream<SpeakersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpeakersRecord.fromSnapshot(s));

  static Future<SpeakersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SpeakersRecord.fromSnapshot(s));

  static SpeakersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SpeakersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpeakersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpeakersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpeakersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpeakersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpeakersRecordData({
  String? briefBio,
  String? designation,
  String? emailId,
  String? imageUrl,
  String? event,
  String? name,
  String? organization,
  String? password,
  int? no,
  String? linkedIn,
  bool? attendence,
  String? abstract,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'briefBio': briefBio,
      'designation': designation,
      'emailId': emailId,
      'imageUrl': imageUrl,
      'event': event,
      'name': name,
      'organization': organization,
      'password': password,
      'no': no,
      'linkedIn': linkedIn,
      'attendence': attendence,
      'abstract': abstract,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpeakersRecordDocumentEquality implements Equality<SpeakersRecord> {
  const SpeakersRecordDocumentEquality();

  @override
  bool equals(SpeakersRecord? e1, SpeakersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.briefBio == e2?.briefBio &&
        e1?.designation == e2?.designation &&
        e1?.emailId == e2?.emailId &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.event == e2?.event &&
        e1?.name == e2?.name &&
        e1?.organization == e2?.organization &&
        e1?.password == e2?.password &&
        listEquality.equals(e1?.webUrl, e2?.webUrl) &&
        e1?.no == e2?.no &&
        e1?.linkedIn == e2?.linkedIn &&
        listEquality.equals(e1?.researchGateUrl, e2?.researchGateUrl) &&
        e1?.attendence == e2?.attendence &&
        e1?.abstract == e2?.abstract;
  }

  @override
  int hash(SpeakersRecord? e) => const ListEquality().hash([
        e?.briefBio,
        e?.designation,
        e?.emailId,
        e?.imageUrl,
        e?.event,
        e?.name,
        e?.organization,
        e?.password,
        e?.webUrl,
        e?.no,
        e?.linkedIn,
        e?.researchGateUrl,
        e?.attendence,
        e?.abstract
      ]);

  @override
  bool isValidKey(Object? o) => o is SpeakersRecord;
}
