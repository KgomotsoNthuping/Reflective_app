import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reflective_app/route/route_generator.dart'; // Import your custom route generator
import 'package:reflective_app/user/user_data.dart';

void main() {
  runApp(const MyApp());
}

// Define the main application widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use ChangeNotifierProvider to provide the UserData instance to the app
    return ChangeNotifierProvider(
      create: (context) => UserData(), // Create an instance of UserData as the provider
      child: const MaterialApp(
        title: 'Reflective App', // App title
        initialRoute: '/', // Set the initial route to the login page
        onGenerateRoute: RouteGenerator.generateRoute, // Custom route generator
      ),
    );
  }
}