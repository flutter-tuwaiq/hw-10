import 'dart:convert';

import 'package:shelf/shelf.dart';

class CustomResponse {
  /*----------------------------------------------------------
  |||||||||||||| frist Two Responses for login||||||||||||||||
  ------------------------------------------------------------*/

  /* If login went successfuly Show this Custome Response ----
        <---<-----<------<----------<-------<-----<-----<---<
       |
       |
       V                                                      */

  successloginResponse({
    required String msg,
    List? data,
  }) {
    return Response.ok(
      json.encode({'msg': msg, 'statusCode': 200, 'data': data}),
      headers: {'content-type': 'application/json'},
    );
  }

  /* If login went wrong Show this Custome Response ----
        <---<-----<------<----------<-------<-----<-----<---<
       |
       |
       V                                                     */
  errorloginResponse({required String msg}) {
    return Response.unauthorized(
      json.encode({'msg': msg, 'statusCode': 401}),
      headers: {'content-type': 'application/json'},
    );
  }

  /*----------------------------------------------------------
  |||||||||||||| These Two Responses for signUp ||||||||||||||
  ------------------------------------------------------------*/

  /* If SignUp went successfuly Show this Custome Response ----
        <---<-----<------<----------<-------<-----<-----<---<
       |
       |
       V                                                      */
  successSignupResponse({required String msg, List? data}) {
    return Response.ok(
      json.encode({'msg': msg, 'statusCode': 201, 'data': data}),
      headers: {'content-type': 'application/json'},
    );
  }

  /* If SignUp went Wrong Show this Custome Response ----
        <---<-----<------<----------<-------<-----<-----<---<
       |
       |
       V                                                    */
  errorSignupResponse({required String msg}) {
    return Response.badRequest(
      body: json.encode({'msg': msg, 'statusCode': 400}),
      headers: {'content-type': 'application/json'},
    );
  }
}
