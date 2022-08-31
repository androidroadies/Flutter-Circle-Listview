import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

String bearerToken =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYWU0MTYyYmViNmE2MzM1ZjdmZGZmNDY5NjQyMjQzOGUwMDlkMjc3MzkzNjAwNGU0YTQ0ZjRmMmNiY2U4Y2MyNjJlNGJhY2FmODVhYjhjNzAiLCJpYXQiOjE2NjAyOTQ3MDUuNzU5OTQ1LCJuYmYiOjE2NjAyOTQ3MDUuNzU5OTQ5LCJleHAiOjE2OTE4MzA3MDUuNzUwOTU3LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.lMg6JOzP4q-TiNxFmKU2lJcHlubETRk0l4OG8y7KWNuo-lcDimrtBGLkc__r2xiUDIlxI2xSKs-T-FzNaQj1j6AhhQCQf0GYdEkt55AWbXVxmfF8wgWMC8In-uStZTcCkC8rRZ_HHh4ktbQMFx-CnGxHzXkZ9USmQ4FaPskB1mOPBU2SFo2fbzWfnawYUA2qFMIywECFkpymHKD-6wywVQMIcpKM4xTBYVBnCJLRwLm5A2BypBlIE_7tgnAlVW8JkiXt5cKytW1kujJKRJqhdEkAW23i_iPmNMLLsOjLoirh9WKL7i4l6KDPQs2AB2J7yBR1QrXpA00xCs5SlTw9ZmGCGvKCTEgWV1cbzS29VKQ10tIDwa2t19QgYQoji8vmRoyk3jYzLnKniImQGu9E_gUHjxFDWRAiMdhadTa7fxKXPsTW-ObsM12eH8tJOG1AUYrQ6yJfBaRthlJUN2abxGKBS1jfrH77740xVoqzwxdNiGXnicx2OJ21u2DNsPGKVfU3VOXAys8lVPGu61ke52tyLLV88PDujGnq3L7N_VDs8xJRri01adFrbDj2RTR5H7kJPbauciVguFih62WO1I_RRIZkUY8q4WK8D1_OQKaIqkynVlgzV3DdtbcWlB-qBLsWmRu576NjnmEgfqzzmMo8xZUfzVg-eiUsmx9JSDM";

Future<String> postWithBody(
    String url, Map<String, String> map, BuildContext context) async {
  // showLogs(TAG, "postWithBodyrequest===>>   ${url}\n$map");

  var response = await http.Client().post(Uri.parse(url), body: map, headers: {
    // 'Content-Type': 'application/json',
    // 'Accept': 'application/json',
    'Authorization': 'Bearer $bearerToken',
  });
  checkAndThrowError(response, context, url, map);
  return response.body;
}

checkAndThrowError(
    Response response, BuildContext context, String url, dynamic map) {
  print(
      "checkAndThrowError    URL==>> $url   MAP====>>>$map  \nRESPONSE===>>>  ${response.statusCode}  ${response.body}");
  final body = jsonDecode(response.body);
}
