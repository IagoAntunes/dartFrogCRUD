import 'package:dart_frog/dart_frog.dart';

import '../database/list_books.dart';

Future<Response> onRequest(RequestContext context) async {
  final requestJson = await context.request.json() as Map<String, dynamic>;
  if (requestJson['nameBook'] == null) {
    return Response.json(
      body: {
        'message': "Mandatory 'nameBook' field",
      },
    );
  } else {
    final nameBook = requestJson['nameBook'] as String;

    final listFilter = books
        .where(
          (element) => element.name.contains(nameBook),
        )
        .toList();
    return Response.json(
      body: {
        'message': 'Consultation carried out successfully',
        'books': listFilter.map((e) => e.toMap()).toList(),
      },
    );
  }
}
