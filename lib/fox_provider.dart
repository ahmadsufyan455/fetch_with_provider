import 'package:flutter/material.dart';
import 'package:the_foxes/fox.dart';
import 'package:the_foxes/repository.dart';

enum State { loading, loaded, error }

class FoxProvider extends ChangeNotifier {
  final Repository repository;
  FoxProvider(this.repository) {
    getImage();
  }

  late Fox _fox;
  late State _state;
  String _message = 'Test';

  String get message => _message;
  State get state => _state;
  Fox get fox => _fox;

  Future<dynamic> getImage() async {
    _state = State.loading;
    notifyListeners();
    try {
      final result = await repository.getFoxImage();
      _fox = result;
      _state = State.loaded;
      notifyListeners();
      return _fox;
    } catch (e) {
      _message = e.toString();
      _state = State.error;
      notifyListeners();
      return _message;
    }
  }
}
