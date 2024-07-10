import 'package:flutter/material.dart';

extension SizedDevice on BuildContext {
  Size get sizedDevice => MediaQuery.of(this).size;
}