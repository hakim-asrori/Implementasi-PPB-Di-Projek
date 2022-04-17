import 'dart:io';

import 'package:get/get.dart';

class Remote extends GetConnect {
  String url = 'http://api.rtq-freelance.my.id/api-v1/';
  
  Future<Response> getAll(String prefix, String token) => get(url+prefix, headers: {HttpHeaders.authorizationHeader: token});

  Future<Response> auth(String prefix, Map data) => post(url+prefix, data);

  Future<Response> create(String prefix, Map data) => post(url+prefix, data);

  Future<Response> update(String prefix, Map data) => put(url+prefix, data);

  Future<Response> remove(String prefix, Map data) => delete(url+prefix);
}