import 'dart:async';

import 'package:chopper/chopper.dart';

part 'fetchApiData.chopper.dart';

@ChopperApi(baseUrl: '?apikey=cef96cba&t=')
abstract class FetchApiData extends ChopperService {
  @Get(path: 'title')
  Future<Response> fetchData(@Path('title') String title);

  static FetchApiData create() {
    final client = ChopperClient(
        baseUrl: 'http://www.omdbapi.com/',
        services: [_$FetchApiData()],
        converter: JsonConverter());
    return _$FetchApiData(client);
  }
}
