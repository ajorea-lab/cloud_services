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
              //register button
              onPressed: loading ? null : () async{
                setState(() {
                  loading = true;
                  errorMessage = null;
                });
                try{
                  await register(
                    emailController.text,
                    passwordController.text,
                  ); 
                } catch (e) {
                  setState(() {
                    errorMessage = e.toString();

                  });
                if (mounted) {
                  setState(() {
                    loading = false;
                  });
                }
                };
              },
              child: const Text('Sign Up'),
            ),

            OutlinedButton(
              //sign in button
              onPressed: loading ? null : () async{
                setState(() {
                  loading = true;
                  errorMessage = null;
                });
                try{
                  await signIn(
                    emailController.text,
                    passwordController.text,
                  ); 
                } catch (e) {
                  setState(() {
                    errorMessage = e.toString();

                  });
                if (mounted) {
                  setState(() {
                    loading = false;
                  });
                }
                };
              },
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 12),
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

            
              if (loading)
                const CircularProgressIndicator(),
              ],
        ),
      ),
    );
  }
}