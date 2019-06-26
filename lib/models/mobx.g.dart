// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$MobXData on _MobXData, Store {
  final _$apiDataItemAtom = Atom(name: '_MobXData.apiDataItem');

  @override
  ApiDataSerializer get apiDataItem {
    _$apiDataItemAtom.reportObserved();
    return super.apiDataItem;
  }

  @override
  set apiDataItem(ApiDataSerializer value) {
    _$apiDataItemAtom.context
        .checkIfStateModificationsAreAllowed(_$apiDataItemAtom);
    super.apiDataItem = value;
    _$apiDataItemAtom.reportChanged();
  }

  final _$onPressedAsyncAction = AsyncAction('onPressed');

  @override
  Future<dynamic> onPressed(String title, BuildContext context) {
    return _$onPressedAsyncAction.run(() => super.onPressed(title, context));
  }
}
