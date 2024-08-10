import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reflective_app/user/user_data.dart';
import 'package:reflective_app/widgets/main_widgets.dart';

// Define a stateless widget for the UnderstoodPage
class UnderstoodPage extends StatelessWidget {
  final TextEditingController strategyController = TextEditingController();

  // Constructor for the UnderstoodPage widget
  UnderstoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract email and understanding data using Provider
    String email = Provider.of<UserData>(context).email;
    String understanding = Provider.of<UserData>(context).understanding;

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
            // Display understanding information
            Text(
              'Understanding: $understanding',
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
                  // Text field for entering strategies
                  TextField(
                    controller: strategyController,
                    decoration: InputDecoration(
                      labelText: 'Strategies',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    minLines: 2,
                    maxLines: 6,
                  ),
                  const SizedBox(height: 20),
                  // Submit button for submitting the strategies
                  ElevatedButton(
                    onPressed: () {
                      // Get the entered strategy text
                      String strategy = strategyController.text.trim();
                      // Update the improvement plan in the UserData using Provider
                      Provider.of<UserData>(context, listen: false)
                          .setImprovementPlan(strategy);
                      // Show a SnackBar indicating successful submission
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              const Icon(Icons.check_circle, color: Colors.blueGrey),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  '$email, your strategies are received: $strategy',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          backgroundColor: Colors.blue, // Custom background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Custom border radius
                          ),
                          behavior: SnackBarBehavior.floating, // Custom animation behavior
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
                      padding:
                          const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
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
