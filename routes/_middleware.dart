import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return (context) async {
    final body = await context.request.body();

    if (body == '') {
      return Response.json(
        body: {
          'message': 'Invalid Request',
        },
      );
    }
    final response = await handler(context);
    return response;
  };
}
