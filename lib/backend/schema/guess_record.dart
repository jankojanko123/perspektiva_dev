import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GuessRecord extends FirestoreRecord {
  GuessRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "guess_picture" field.
  String? _guessPicture;
  String get guessPicture => _guessPicture ?? '';
  bool hasGuessPicture() => _guessPicture != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "perspektiva_id" field.
  String? _perspektivaId;
  String get perspektivaId => _perspektivaId ?? '';
  bool hasPerspektivaId() => _perspektivaId != null;

  void _initializeFields() {
    _guessPicture = snapshotData['guess_picture'] as String?;
    _uid = snapshotData['uid'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _perspektivaId = snapshotData['perspektiva_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('guess');

  static Stream<GuessRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GuessRecord.fromSnapshot(s));

  static Future<GuessRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GuessRecord.fromSnapshot(s));

  static GuessRecord fromSnapshot(DocumentSnapshot snapshot) => GuessRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GuessRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GuessRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GuessRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GuessRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGuessRecordData({
  String? guessPicture,
  String? uid,
  LatLng? location,
  String? perspektivaId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'guess_picture': guessPicture,
      'uid': uid,
      'location': location,
      'perspektiva_id': perspektivaId,
    }.withoutNulls,
  );

  return firestoreData;
}

class GuessRecordDocumentEquality implements Equality<GuessRecord> {
  const GuessRecordDocumentEquality();

  @override
  bool equals(GuessRecord? e1, GuessRecord? e2) {
    return e1?.guessPicture == e2?.guessPicture &&
        e1?.uid == e2?.uid &&
        e1?.location == e2?.location &&
        e1?.perspektivaId == e2?.perspektivaId;
  }

  @override
  int hash(GuessRecord? e) => const ListEquality()
      .hash([e?.guessPicture, e?.uid, e?.location, e?.perspektivaId]);

  @override
  bool isValidKey(Object? o) => o is GuessRecord;
}
