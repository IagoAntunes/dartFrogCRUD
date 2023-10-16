import 'package:dart_frog/dart_frog.dart';

import '../database/list_books.dart';

Response onRequest(RequestContext context) {
  return Response.json(
    body: {
      'message': 'Consultation carried out successfully',
      'books': books.map((e) => e.toMap()).toList(),
    },
  );
}
