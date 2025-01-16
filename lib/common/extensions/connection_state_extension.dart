import 'package:flutter/material.dart';

extension ConnectionStateExtension on ConnectionState {
  bool get isIdle => this == ConnectionState.none;
  bool get isDone => this == ConnectionState.done;
  bool get isActive => this == ConnectionState.active;
  bool get isWaiting => this == ConnectionState.waiting;
}
