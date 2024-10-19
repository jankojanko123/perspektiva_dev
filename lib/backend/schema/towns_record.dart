import 'dart:async';

import 'package:collection/collection.dart';
import 'package:geo_sort/geo_sort.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TownsRecord extends FirestoreRecord implements HasLocation {
  TownsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "town_zip" field.
  int? _townZip;
  int get townZip => _townZip ?? 0;
  bool hasTownZip() => _townZip != null;

  // "town_name" field.
  String? _townName;
  String get townName => _townName ?? '';
  bool hasTownName() => _townName != null;

  // "town_country" field.
  String? _townCountry;
  String get townCountry => _townCountry ?? '';
  bool hasTownCountry() => _townCountry != null;

  // "town_picture" field.
  String? _townPicture;
  String get townPicture => _townPicture ?? '';
  bool hasTownPicture() => _townPicture != null;

  // "town_location" field.
  LatLng? _townLocation;
  LatLng get townLocation => _townLocation ?? LatLng(0, 0);
  bool hasTownLocation() => _townLocation != null;

  void _initializeFields() {
    _townZip = castToType<int>(snapshotData['town_zip']);
    _townName = snapshotData['town_name'] as String?;
    _townCountry = snapshotData['town_country'] as String?;
    _townPicture = snapshotData['town_picture'] as String?;
    _townLocation = snapshotData['town_location'] as LatLng?;
  }

  static CollectionReference get collection => FirebaseFirestore.instance.collection('towns');

  static Stream<TownsRecord> getDocument(DocumentReference ref) => ref.snapshots().map((s) => TownsRecord.fromSnapshot(s));

  static Future<TownsRecord> getDocumentOnce(DocumentReference ref) => ref.get().then((s) => TownsRecord.fromSnapshot(s));

  static TownsRecord fromSnapshot(DocumentSnapshot snapshot) => TownsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TownsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TownsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() => 'TownsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) => other is TownsRecord && reference.path.hashCode == other.reference.path.hashCode;

  @override
  // TODO: implement latitude
  double? get latitude => _townLocation!.latitude;

  @override
  // TODO: implement longitude
  double? get longitude => _townLocation!.longitude;
}

Map<String, dynamic> createTownsRecordData({int? townZip, String? townName, String? townCountry, String? townPicture, LatLng? townLocation = null}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'town_zip': townZip,
      'town_name': townName,
      'town_country': townCountry,
      'town_picture': townPicture,
      'town_location': townLocation,
    }.withoutNulls,
  );

  return firestoreData;
}

class TownsRecordDocumentEquality implements Equality<TownsRecord> {
  const TownsRecordDocumentEquality();

  @override
  bool equals(TownsRecord? e1, TownsRecord? e2) {
    return e1?.townZip == e2?.townZip &&
        e1?.townName == e2?.townName &&
        e1?.townCountry == e2?.townCountry &&
        e1?.townPicture == e2?.townPicture &&
        e1?.townLocation == e2?.townLocation;
  }

  @override
  int hash(TownsRecord? e) => const ListEquality().hash([e?.townZip, e?.townName, e?.townCountry, e?.townPicture, e?.townLocation]);

  @override
  bool isValidKey(Object? o) => o is TownsRecord;
}
