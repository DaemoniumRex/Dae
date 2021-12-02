import 'package:flutter/material.dart';
import 'package:getglam/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getglam/ui/app.dart';
import 'package:get/get.dart';

import 'package:getglam/controller/controllerauth.dart';

import 'package:getglam/ui/pages/login/loginpage.dart';


void main() {
  

  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));

    // Create the Finders.
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    // Use the findsOneWidget matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });



 testWidgets('seeker1', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    final addField = find.byKey(ValueKey("emailInput"));
    

    
    
  });
testWidgets('seeker1', (WidgetTester tester) async {
  final addField2 = find.byKey(ValueKey("passwInput"));
   });


testWidgets('seeker2', (WidgetTester tester) async {
  final addField3 = find.byKey(ValueKey("siButt"));
   });

   testWidgets('seeker3', (WidgetTester tester) async {
  final addField3 = find.byKey(ValueKey("regButt"));
   });




}

class MyWidget extends StatelessWidget {
  const MyWidget({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}