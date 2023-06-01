// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimerStore on _TimerStoreBase, Store {
  late final _$timerTableAtom =
      Atom(name: '_TimerStoreBase.timerTable', context: context);

  @override
  String get timerTable {
    _$timerTableAtom.reportRead();
    return super.timerTable;
  }

  @override
  set timerTable(String value) {
    _$timerTableAtom.reportWrite(value, super.timerTable, () {
      super.timerTable = value;
    });
  }

  @override
  String toString() {
    return '''
timerTable: ${timerTable}
    ''';
  }
}
