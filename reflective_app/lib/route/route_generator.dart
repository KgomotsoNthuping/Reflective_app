import 'package:flutter/material.dart';
import 'package:reflective_app/pages/login_page.dart';
import 'package:reflective_app/pages/main_page.dart';
import 'package:reflective_app/pages/reflection_pages/not_understood_page.dart';
import 'package:reflective_app/pages/reflection_pages/understood_page.dart';

// Define a class for route generation
class RouteGenerator {
  // Static method to generate routes based on route settings
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Handle routing based on route names
    switch (settings.name) {
      case '/':
        // Navigate to LoginPage when route name is '/'
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/main':
        // Navigate to MainPage when route name is '/main'
        return MaterialPageRoute(builder: (_) => const MainPage());
      case '/understood':
        // Navigate to UnderstoodPage when route name is '/understood'
        return MaterialPageRoute(builder: (_) => UnderstoodPage());
      case '/not-understood':
        // Navigate to NotUnderstoodPage when route name is '/not-understood'
        return MaterialPageRoute(builder: (_) => NotUnderstoodPage());
      default:
        // If route not found, navigate to login page
        // throw FormatException ("route not found");
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}
