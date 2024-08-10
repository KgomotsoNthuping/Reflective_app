import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reflective_app/user/user_data.dart';
import 'package:reflective_app/widgets/login_widgets.dart';

// Define a stateless widget for the LoginPage
class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  // Initialize text editing controllers for email and password fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Reflective App', // App bar title text
          style: TextStyle(
            color: Colors.blue, // Change the color of the app bar title text
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Welcome', // Welcome text
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8), // Spacer
              const Text(
                'Please login', // Login instruction text
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 99, 185, 255), // Custom text color
                ),
              ),
              const SizedBox(height: 100), // Spacer
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50), // Spacer
                  LoginTextField(
                    controller: emailController,
                    labelText: 'Email',       //Email field label
                    prefixIcon: Icons.email,      //Icon for email
                    ),
                  const SizedBox(height: 20), // Spacer
                  TextFormField(
                    controller: passwordController,
                    obscureText: true, // Hide password text
                    decoration: InputDecoration(
                      labelText: 'Password', // Password field label
                      prefixIcon: const Icon(Icons.lock), // Icon for password field
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Spacer
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        // Get the entered email and password
                        String email = emailController.text.trim();
                        String password = passwordController.text.trim();
                        // Validate email and password
                        if (email.isNotEmpty &&
                            password.length >= 8 &&
                            password.contains('@')) {
                          // Update user's email using Provider and navigate to main screen
                          Provider.of<UserData>(context, listen: false).setEmail(email);
                          Navigator.pushNamed(context, '/main');
                        } else {
                          // Show alert dialog for invalid credentials
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Invalid Credentials'), // Dialog title
                                content: const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Please enter a valid email and password:", // Instructions
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "- Email must not be empty.", // Email validation rule
                                    ),
                                    Text(
                                      "- Password must be at least 8 characters long and contain '@'.", // Password validation rule
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Close dialog
                                    },
                                    child: const Text('OK'), // OK button text
                                  ),
                                ],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15), // Dialog border radius
                                ),
                                backgroundColor: Colors.white, // Dialog background color
                                elevation: 4, // Dialog elevation
                              );
                            },
                          );
                        }
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
                      child: const Text('Login'), // Login button text
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}