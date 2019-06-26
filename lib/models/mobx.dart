import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:chopperexample/data/fetchApiData.dart';
import 'package:chopperexample/serializer/getApiData.dart';
part 'mobx.g.dart';

class MobXData = _MobXData with _$MobXData;

abstract class _MobXData implements Store {
  @observable
  ApiDataSerializer apiDataItem = ApiDataSerializer();

  @action
  Future onPressed(String title, BuildContext context) async {
    print('in function');

    final response = await Provider.of<FetchApiData>(context).fetchData(title);

    ApiDataSerializer apiDataSerializer =
        ApiDataSerializer.fromJson(response.body);
    apiDataItem = apiDataSerializer;
  }
}
