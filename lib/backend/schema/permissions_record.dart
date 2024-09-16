import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PermissionsRecord extends FirestoreRecord {
  PermissionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "permission_id" field.
  int? _permissionId;
  int get permissionId => _permissionId ?? 0;
  bool hasPermissionId() => _permissionId != null;

  // "permission_name" field.
  String? _permissionName;
  String get permissionName => _permissionName ?? '';
  bool hasPermissionName() => _permissionName != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  void _initializeFields() {
    _permissionId = castToType<int>(snapshotData['permission_id']);
    _permissionName = snapshotData['permission_name'] as String?;
    _createdDate = snapshotData['created_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('permissions');

  static Stream<PermissionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PermissionsRecord.fromSnapshot(s));

  static Future<PermissionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PermissionsRecord.fromSnapshot(s));

  static PermissionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PermissionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PermissionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PermissionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PermissionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PermissionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPermissionsRecordData({
  int? permissionId,
  String? permissionName,
  DateTime? createdDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'permission_id': permissionId,
      'permission_name': permissionName,
      'created_date': createdDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class PermissionsRecordDocumentEquality implements Equality<PermissionsRecord> {
  const PermissionsRecordDocumentEquality();

  @override
  bool equals(PermissionsRecord? e1, PermissionsRecord? e2) {
    return e1?.permissionId == e2?.permissionId &&
        e1?.permissionName == e2?.permissionName &&
        e1?.createdDate == e2?.createdDate;
  }

  @override
  int hash(PermissionsRecord? e) => const ListEquality()
      .hash([e?.permissionId, e?.permissionName, e?.createdDate]);

  @override
  bool isValidKey(Object? o) => o is PermissionsRecord;
}
