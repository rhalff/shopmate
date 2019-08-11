import 'package:flutter/material.dart';

typedef MapFunction<I, R> = R Function(I item, int index);

List<R> mapWithIndex<I, R>(List<I> items, MapFunction<I, R> func) {
  final list = <R>[];
  for (var index = 0; index < items.length; index++) {
    final item = items[index];

    list.add(func(item, index));
  }

  return list.toList();
}

void goHome(BuildContext context) =>
    Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
