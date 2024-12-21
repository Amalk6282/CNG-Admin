import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://ldobecfjsounhjluennl.supabase.co',
    anonKey: 'public-anon-key',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Frame: Dark Green Background
          Expanded(
            flex: 1, // Adjust size of the frame
            child: Container(
              color: Colors.green.shade900,
            ),
          ),
          // Right Frame: White Background
          Expanded(
            flex: 2, // Adjust size of the frame
            child: Container(
              color: Colors.white,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // App Name
                      const Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Username TextField
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                          hintText: 'Enter your username',
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Password TextField
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          hintText: 'Enter your password',
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16),
                      // Login Button
                      ElevatedButton(
                        onPressed: () {
                          // Add your login logic here
                        },
                        child: const Text('Login'),
                      ),
                      const SizedBox(height: 16),
                      // Continue with Google Button
                      ElevatedButton(
                        onPressed: () {
                          // Add Google login logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 221, 211, 210),
                        ),
                        child: const Text('Continue with Google'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
