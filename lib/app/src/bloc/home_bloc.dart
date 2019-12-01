import 'package:marvelapp/app/src/resources/models/response_object.dart';
import 'package:rxdart/rxdart.dart';

import '../resources/repository/home_repository.dart';

class HomeBloc {
  final _repository = Repository();
  final _charactersFetcher = PublishSubject<ResponseFull>();

  Observable<ResponseFull> get allCharacters => _charactersFetcher.stream;

  getUsers() async {
    ResponseFull responseFull = await _repository.getUsers();
    _charactersFetcher.sink.add(responseFull);
  }

  dispose() {
    _charactersFetcher.close();
  }
}

final bloc = HomeBloc();
