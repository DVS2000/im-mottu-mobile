import 'dart:io';

class CharacterException extends SocketException {
  final int code;
  CharacterException(this.code, super.message);
}