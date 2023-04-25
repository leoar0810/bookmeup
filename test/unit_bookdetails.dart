import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/pages/bookdetails/bookdetails.dart';

void main() {
  testWidgets('BookDetailsWidget displays book details',
      (WidgetTester tester) async {
    // Define test data
    final String bookName = 'The Catcher in the Rye';
    final String authorName = 'J.D. Salinger';
    final int rating = 4;
    final String description =
        'The story of Holden Caulfield, a teenage boy who gets expelled from school and embarks on a journey of self-discovery.';

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: BookDetailsWidget(
          bookName: bookName,
          authorName: authorName,
          rating: rating,
          description: description,
        ),
      ),
    );

    // Verify that the widget displays the correct book details
    expect(find.text(bookName), findsOneWidget);
    expect(find.text('Author: $authorName'), findsOneWidget);
    expect(find.text('Description:'), findsOneWidget);
    expect(find.text(description), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
