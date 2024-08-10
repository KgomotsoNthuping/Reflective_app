import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reflective_app/user/user_data.dart';
import 'package:reflective_app/widgets/main_widgets.dart';

// Define a stateless widget for the MainPage
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract email from UserData using Provider
    String email = Provider.of<UserData>(context).email;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Reflective App'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display welcome message with user's email
            Text(
              'Welcome, $email',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40), // Spacer
            Expanded(
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.center,
                scrollDirection: Axis.vertical,
                children: [
                  // TextField for entering understanding
                  TextField(
                    onChanged: (text) {
                      Provider.of<UserData>(context, listen: false)
                          .setUnderstanding(text);
                    },
                    decoration: InputDecoration(
                      labelText: 'Understanding', // Field label
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    minLines: 2,
                    maxLines: 6,
                  ),
                  const SizedBox(height: 20), // Spacer
                  // Button to navigate to the next screen for strategies
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/understood');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Next: Strategies'), // Button text
                  ),
                  const SizedBox(height: 40), // Spacer
                  // TextField for entering not understanding
                  TextField(
                    onChanged: (text) {
                      Provider.of<UserData>(context, listen: false)
                          .setNotUnderstanding(text);
                    },
                    decoration: InputDecoration(
                      labelText: 'Not Understanding', // Field label
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    minLines: 2,
                    maxLines: 6,
                  ),
                  const SizedBox(height: 20), // Spacer
                  // Button to navigate to the next screen for improvement plan
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/not-understood');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Next: Improvement Plan'), // Button text
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
