import 'dart:convert';

import 'package:crypto/crypto.dart';

class AppConfigs {

  /* INSTÂNCIA PRIVADA PARA USAR O PADRÃO SINGLETON */
  AppConfigs._();

  static const baseUrl = "https://gateway.marvel.com:443";
  static const apiUrl  = "$baseUrl/v1/public";

  static const marvelPublicKey  = "d7ccc33629b216a02af01f9a48ad85b9";
  static const marvelPrivateKey = "11504170115215020d9a796acb2b325f9d03d023";

  static String getHashMd5() {
    return md5.convert(
      utf8.encode(
        "${DateTime.now()}$marvelPrivateKey$marvelPublicKey"
      )
    ).toString();
  }

}