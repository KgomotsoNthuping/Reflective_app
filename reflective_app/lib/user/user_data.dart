import 'package:flutter/material.dart';

// Define a class UserData that extends ChangeNotifier for state management
class UserData extends ChangeNotifier {
  // Declare fields to store user data
  String email = ''; // Field to store email
  String understanding = ''; // Field for the "Understanding" text field
  String improvementPlan = ''; // Field for the "Improvement Plan" text field
  String notUnderstanding = ''; // Field for the "Not Understanding" text field

  // Method to update the email field and notify listeners of changes
  void setEmail(String newEmail) {
    email = newEmail;
    notifyListeners(); // Notify listeners of data changes
  }

  // Method to update the understanding field and notify listeners
  void setUnderstanding(String text) {
    understanding = text;
    notifyListeners(); // Notify listeners of data changes
  }

  // Method to update the improvementPlan field and notify listeners
  void setImprovementPlan(String text) {
    improvementPlan = text;
    notifyListeners(); // Notify listeners of data changes
  }

  // Method to update the notUnderstanding field and notify listeners
  void setNotUnderstanding(String text) {
    notUnderstanding = text;
    notifyListeners(); // Notify listeners of data changes
  }
}