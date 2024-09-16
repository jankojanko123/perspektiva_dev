import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PerspektivaUserGuessRecord extends FirestoreRecord {
  PerspektivaUserGuessRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "perspektiva_uuid" field.
  String? _perspektivaUuid;
  String get perspektivaUuid => _perspektivaUuid ?? '';
  bool hasPerspektivaUuid() => _perspektivaUuid != null;

  // "user_uid" field.
  String? _userUid;
  String get userUid => _userUid ?? '';
  bool hasUserUid() => _userUid != null;

  // "is_correct" field.
  bool? _isCorrect;
  bool get isCorrect => _isCorrect ?? false;
  bool hasIsCorrect() => _isCorrect != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "guess_id" field.
  String? _guessId;
  String get guessId => _guessId ?? '';
  bool hasGuessId() => _guessId != null;

  void _initializeFields() {
    _perspektivaUuid = snapshotData['perspektiva_uuid'] as String?;
    _userUid = snapshotData['user_uid'] as String?;
    _isCorrect = snapshotData['is_correct'] as bool?;
    _created = snapshotData['created'] as DateTime?;
    _guessId = snapshotData['guess_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('perspektiva_user_guess');

  static Stream<PerspektivaUserGuessRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => PerspektivaUserGuessRecord.fromSnapshot(s));

  static Future<PerspektivaUserGuessRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PerspektivaUserGuessRecord.fromSnapshot(s));

  static PerspektivaUserGuessRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PerspektivaUserGuessRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PerspektivaUserGuessRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PerspektivaUserGuessRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PerspektivaUserGuessRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PerspektivaUserGuessRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPerspektivaUserGuessRecordData({
  String? perspektivaUuid,
  String? userUid,
  bool? isCorrect,
  DateTime? created,
  String? guessId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'perspektiva_uuid': perspektivaUuid,
      'user_uid': userUid,
      'is_correct': isCorrect,
      'created': created,
      'guess_id': guessId,
    }.withoutNulls,
  );

  return firestoreData;
}

class PerspektivaUserGuessRecordDocumentEquality
    implements Equality<PerspektivaUserGuessRecord> {
  const PerspektivaUserGuessRecordDocumentEquality();

  @override
  bool equals(PerspektivaUserGuessRecord? e1, PerspektivaUserGuessRecord? e2) {
    return e1?.perspektivaUuid == e2?.perspektivaUuid &&
        e1?.userUid == e2?.userUid &&
        e1?.isCorrect == e2?.isCorrect &&
        e1?.created == e2?.created &&
        e1?.guessId == e2?.guessId;
  }

  @override
  int hash(PerspektivaUserGuessRecord? e) => const ListEquality().hash(
      [e?.perspektivaUuid, e?.userUid, e?.isCorrect, e?.created, e?.guessId]);

  @override
  bool isValidKey(Object? o) => o is PerspektivaUserGuessRecord;
}
