import 'package:cw2_cloud_services/services/auth_services.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() =>
      _SignInScreenState();
}

class _SignInScreenState
    extends State<SignInScreen> {

  final emailController =
  TextEditingController();

  final passwordController =
  TextEditingController();

  bool loading = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Quest'),
      ),
      body: Padding(
        padding:
        const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: emailController,
              decoration:
              const InputDecoration(
                labelText: 'Email',
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller:
              passwordController,
              obscureText: true,
              decoration:
              const InputDecoration(
                labelText: 'Password',
              ),
            ),

            const SizedBox(height: 16),

            FilledButton(
              onPressed: () {
                () async{
                  await register(
                    emailController.text,
                    passwordController.text,
                  );
                };
              },
              child: const Text('Sign Up'),
            ),

            OutlinedButton(
              onPressed: () {
                () async{
                  await signIn(
                    emailController.text,
                    passwordController.text,
                  );
                };
              },
              child: const Text('Sign In'),
            ),

             if (errorMessage != null)
              Semantics(
                liveRegion: true,
                child: Text(
                  errorMessage!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),

            // TODO: Disable buttons while loading
              if (loading)
                const CircularProgressIndicator(),
               
              ],


            // TODO: Show progress indicator
          ],
        ),
      ),
    );
  }
}