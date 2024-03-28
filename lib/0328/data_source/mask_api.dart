import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_dart_together/0328/dto/mapper/mask_mapper.dart';
import '../dto/mask_dto.dart';
import '../model/mask.dart';

class MaskApi {

  final http.Client _client;

  MaskApi({http.Client? client}) : _client = client ?? http.Client();

  Future<Mask> getMask() async {
    final http.Response response = await _client.get(Uri.parse('http://104.198.248.76:3000/mask'));
    Map<String, dynamic> decodedJson = response.statusCode == 200 ?
    jsonDecode(utf8.decode(response.bodyBytes)) :
    throw Exception('Request failed with status: ${response.statusCode}.');
    return MaskDto.fromJson(decodedJson).toMask();
  }
}