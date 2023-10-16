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
  }
  final bookId = requestJson['bookId'] as String;
  final name = requestJson['name'] as String?;
  final author = requestJson['author'] as String?;
  final year = requestJson['year'] as String?;

  final index = books.indexWhere((element) => element.id.toString() == bookId);

  books[index].name = name ?? books[index].name;
  books[index].author = author ?? books[index].author;
  books[index].year = year ?? books[index].year;

  return Response.json(
    body: {
      'message': 'Book updated successfully',
    },
  );
}
