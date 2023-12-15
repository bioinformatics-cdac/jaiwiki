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

  List<String> _roles = [];
  List<String> get roles => _roles;
  set roles(List<String> value) {
    _roles = value;
  }

  void addToRoles(String value) {
    _roles.add(value);
  }

  void removeFromRoles(String value) {
    _roles.remove(value);
  }

  void removeAtIndexFromRoles(int index) {
    _roles.removeAt(index);
  }

  void updateRolesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _roles[index] = updateFn(_roles[index]);
  }

  void insertAtIndexInRoles(int index, String value) {
    _roles.insert(index, value);
  }

  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
