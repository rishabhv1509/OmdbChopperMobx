// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetchApiData.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$FetchApiData extends FetchApiData {
  _$FetchApiData([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = FetchApiData;

  Future<Response> fetchData(String title) {
    final $url = '?apikey=cef96cba&t={$title}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
