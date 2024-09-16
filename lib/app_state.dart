import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _userDiet = '';
  String get userDiet => _userDiet;
  set userDiet(String value) {
    _userDiet = value;
  }

  List<String> _userAllergens = [];
  List<String> get userAllergens => _userAllergens;
  set userAllergens(List<String> value) {
    _userAllergens = value;
  }

  void addToUserAllergens(String value) {
    userAllergens.add(value);
  }

  void removeFromUserAllergens(String value) {
    userAllergens.remove(value);
  }

  void removeAtIndexFromUserAllergens(int index) {
    userAllergens.removeAt(index);
  }

  void updateUserAllergensAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    userAllergens[index] = updateFn(_userAllergens[index]);
  }

  void insertAtIndexInUserAllergens(int index, String value) {
    userAllergens.insert(index, value);
  }

  List<String> _userIngredientDislikes = [];
  List<String> get userIngredientDislikes => _userIngredientDislikes;
  set userIngredientDislikes(List<String> value) {
    _userIngredientDislikes = value;
  }

  void addToUserIngredientDislikes(String value) {
    userIngredientDislikes.add(value);
  }

  void removeFromUserIngredientDislikes(String value) {
    userIngredientDislikes.remove(value);
  }

  void removeAtIndexFromUserIngredientDislikes(int index) {
    userIngredientDislikes.removeAt(index);
  }

  void updateUserIngredientDislikesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    userIngredientDislikes[index] = updateFn(_userIngredientDislikes[index]);
  }

  void insertAtIndexInUserIngredientDislikes(int index, String value) {
    userIngredientDislikes.insert(index, value);
  }

  LatLng? _perspektivaGuessLatLng;
  LatLng? get perspektivaGuessLatLng => _perspektivaGuessLatLng;
  set perspektivaGuessLatLng(LatLng? value) {
    _perspektivaGuessLatLng = value;
  }

  List<LatLng> _LatLngList = [];
  List<LatLng> get LatLngList => _LatLngList;
  set LatLngList(List<LatLng> value) {
    _LatLngList = value;
  }

  void addToLatLngList(LatLng value) {
    LatLngList.add(value);
  }

  void removeFromLatLngList(LatLng value) {
    LatLngList.remove(value);
  }

  void removeAtIndexFromLatLngList(int index) {
    LatLngList.removeAt(index);
  }

  void updateLatLngListAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    LatLngList[index] = updateFn(_LatLngList[index]);
  }

  void insertAtIndexInLatLngList(int index, LatLng value) {
    LatLngList.insert(index, value);
  }
}
