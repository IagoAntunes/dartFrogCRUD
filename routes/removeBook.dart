import 'package:dart_frog/dart_frog.dart';

import '../database/list_books.dart';

Future<Response> onRequest(RequestContext context) async {
  final requestJson = await context.request.json() as Map<String, dynamic>;
  if (requestJson['bookId'] == null) {
    return Response.json(
      body: {
        'message': "Mandatory 'bookId' field",
      },
    );
  } else {
    final removeBookId = requestJson['bookId'] as String;
    books.removeWhere((element) => element.id.toString() == removeBookId);
    return Response.json(
      body: {
        'message': 'Book removed successfully',
      },
    );
  }
}
