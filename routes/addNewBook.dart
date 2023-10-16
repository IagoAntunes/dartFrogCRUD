import 'package:dart_frog/dart_frog.dart';

import '../database/list_books.dart';
import '../models/book_model.dart';

Future<Response> onRequest(RequestContext context) async {
  final requestJson = await context.request.json() as Map<String, dynamic>;
  if (requestJson['name'] == null) {
    return Response.json(
      body: {
        'message': "Mandatory 'name' field",
      },
    );
  } else if (requestJson['author'] == null) {
    return Response.json(
      body: {
        'message': "Mandatory 'author' field",
      },
    );
  } else if (requestJson['year'] == null) {
    return Response.json(
      body: {
        'message': "Mandatory 'year' field",
      },
    );
  } else {
    final newBook = BookModel(
      id: books.length,
      name: requestJson['name'] as String,
      author: requestJson['author'] as String,
      year: requestJson['year'] as String,
    );
    books.add(newBook);
    return Response.json(
      body: {
        'message': 'Book added successfully',
      },
    );
  }
}
