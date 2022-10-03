import 'package:flutter/material.dart';
import 'package:test/shw-bloc.dart';
import 'package:test/shw-getx.dart';
import 'package:test/shw-provider.dart';
import 'package:test/shw-setstate.dart';

final routes = <String, WidgetBuilder>{
  StateType1.routeName: (context) => const StateType1(),
  GetxState.routeName: (context) => GetxState(),
  ShwProvider.routeName: (context) => ShwProvider(),
  ShwBloc.routeName: (context) => ShwBloc(),
};
