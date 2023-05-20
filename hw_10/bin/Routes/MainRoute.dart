

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'AuthRoute.dart';

class MainRoute{
  Handler get handler{
    final router = Router()
    ..mount("/auth", AuthRoute().handler)
    ..all("/<name|.*>", (Request _){
    return Response.notFound("page not found");
  });

  return router;
    
  }
}