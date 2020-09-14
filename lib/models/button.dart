import 'package:flutter/material.dart';

Future sleep1() {
  return new Future.delayed(const Duration(seconds: 2), () => "2");
}