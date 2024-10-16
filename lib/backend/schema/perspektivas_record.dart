import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PerspektivasRecord extends FirestoreRecord {
  PerspektivasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "perspektiva_picture" field.
  String? _perspektivaPicture;
  String get perspektivaPicture => _perspektivaPicture ?? '';
  bool hasPerspektivaPicture() => _perspektivaPicture != null;

  // "difficulty" field.
  int? _difficulty;
  int get difficulty => _difficulty ?? 0;
  bool hasDifficulty() => _difficulty != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "difficulty_terrain" field.
  int? _difficultyTerrain;
  int get difficultyTerrain => _difficultyTerrain ?? 0;
  bool hasDifficultyTerrain() => _difficultyTerrain != null;

  // "town_zip" field.
  int? _townZip;
  int get townZip => _townZip ?? 0;
  bool hasTownZip() => _townZip != null;

  // "perspektiva_uuid" field.
  String? _perspektivaUuid;
  String get perspektivaUuid => _perspektivaUuid ?? '';
  bool hasPerspektivaUuid() => _perspektivaUuid != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _perspektivaPicture = snapshotData['perspektiva_picture'] as String?;
    _difficulty = castToType<int>(snapshotData['difficulty']);
    _location = snapshotData['location'] as LatLng?;
    _difficultyTerrain = castToType<int>(snapshotData['difficulty_terrain']);
    _townZip = castToType<int>(snapshotData['town_zip']);
    _perspektivaUuid = snapshotData['perspektiva_uuid'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instance.collection('perspektivas');

  static Stream<PerspektivasRecord> getDocument(DocumentReference ref) => ref.snapshots().map((s) => PerspektivasRecord.fromSnapshot(s));

  static Future<PerspektivasRecord> getDocumentOnce(DocumentReference ref) => ref.get().then((s) => PerspektivasRecord.fromSnapshot(s));

  static PerspektivasRecord fromSnapshot(DocumentSnapshot snapshot) => PerspektivasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PerspektivasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PerspektivasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() => 'PerspektivasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) => other is PerspektivasRecord && reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPerspektivasRecordData({
  String? name,
  String? description,
  DateTime? createdAt,
  DateTime? modifiedAt,
  String? perspektivaPicture,
  int? difficulty,
  LatLng? location,
  int? difficultyTerrain,
  int? townZip,
  String? perspektivaUuid,
  String? hashed_picture,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'perspektiva_picture': perspektivaPicture,
      'difficulty': difficulty,
      'location': location,
      'difficulty_terrain': difficultyTerrain,
      'town_zip': townZip,
      'perspektiva_uuid': perspektivaUuid,
      'hashed_picture': hashed_picture
    }.withoutNulls,
  );

  return firestoreData;
}

class PerspektivasRecordDocumentEquality implements Equality<PerspektivasRecord> {
  const PerspektivasRecordDocumentEquality();

  @override
  bool equals(PerspektivasRecord? e1, PerspektivasRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.createdAt == e2?.createdAt &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.perspektivaPicture == e2?.perspektivaPicture &&
        e1?.difficulty == e2?.difficulty &&
        e1?.location == e2?.location &&
        e1?.difficultyTerrain == e2?.difficultyTerrain &&
        e1?.townZip == e2?.townZip &&
        e1?.perspektivaUuid == e2?.perspektivaUuid;
  }

  @override
  int hash(PerspektivasRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.createdAt,
        e?.modifiedAt,
        e?.perspektivaPicture,
        e?.difficulty,
        e?.location,
        e?.difficultyTerrain,
        e?.townZip,
        e?.perspektivaUuid
      ]);

  @override
  bool isValidKey(Object? o) => o is PerspektivasRecord;
}
