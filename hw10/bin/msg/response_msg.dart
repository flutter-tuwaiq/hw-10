import 'dart:convert';

import 'package:shelf/shelf.dart';

class Responsemsg{
  errorResponse({required String msg,}){
return Response.badRequest(body: json.encode({'msg': msg , 'statusCode':400}),headers: {'content-type':'application/json'},);

  }
  successResponse({required String msg,List? data}){
return Response.ok(json.encode({'msg': msg , 'statusCode':201, 'data':data}),headers: {'content-type':'application/json'},);

  }

   successRes({required String msg,List? data}){
return Response.ok(json.encode({'msg': msg , 'statusCode':200, 'data':data}),headers: {'content-type':'application/json'},);

  }
    errorRes({required String msg,}){
return Response.badRequest(body: json.encode({'msg': msg , 'statusCode':401}),headers: {'content-type':'application/json'},);

  }
}