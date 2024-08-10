import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reflective_app/user/user_data.dart';
import 'package:reflective_app/widgets/main_widgets.dart';

// Define a stateless widget for the NotUnderstoodPage
class NotUnderstoodPage extends StatelessWidget {
  final TextEditingController improvementController = TextEditingController();

  // Constructor for the NotUnderstoodPage widget
  NotUnderstoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Extract email and notUnderstanding data using Provider
    String email = Provider.of<UserData>(context).email;
    String notUnderstanding = Provider.of<UserData>(context).notUnderstanding;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Reflective App'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display user's email
            Text(
              'Email: $email',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            // Display not understanding information
            Text(
              'Not Understanding: $notUnderstanding',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text field for entering improvement plan
                  TextField(
                    controller: improvementController,
                    decoration: InputDecoration(
                      labelText: 'Improvement Plan',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    minLines: 2,
                    maxLines: 6,
                  ),
                  const SizedBox(height: 20),
                  // Submit button for submitting the improvement plan
                  ElevatedButton(
                    onPressed: () {
                      // Get the entered improvement plan text
                      String improvementPlan = improvementController.text.trim();
                      // Update the improvement plan in the UserData using Provider
                      Provider.of<UserData>(context, listen: false)
                          .setImprovementPlan(improvementPlan);
                      // Show a SnackBar indicating successful submission
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              const Icon(Icons.check_circle, color: Colors.blueGrey),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  '$email, your improvement plan is received: $improvementPlan',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      // Navigate back to the previous screen
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}