import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({
    super.key,
    required this.user,
    required this.onComplete,
  });

  final User user;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Cloud Quest'),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
          },
        )
      ],
    ),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [

        Text(
          'Signed in as ${user.email ?? user.uid}',
        ),

        Text(
          "Today's challenge",
          style: Theme.of(context)
              .textTheme
              .headlineSmall,
        ),

        const Text(
          'Challenge prompt loads from Cloud Firestore.',
        ),
        
        // TODO: Load and display challenge data

        // TODO: Load and display learner progress

        // TODO: Display earned badge

        // TODO: Display current points

        const SizedBox(height: 16),

        FilledButton(
          onPressed: onComplete,
          child: const Text(
            'Complete challenge',
          ),
        ),

        // TODO: Disable completion after success

        // TODO: Show already-completed state

        TextField(
          maxLength: 300,

          // TODO: Add controller

          decoration: const InputDecoration(
            labelText:
            'Ask the Quest Coach for a hint',
          ),
        ),

        OutlinedButton(
          onPressed: () {},

          // TODO: Call getQuestHint()

          child: const Text('Get hint'),
        ),

        // TODO: Display coach reply text

        // TODO: Display loading state

        // TODO: Display function/model error state
      ],
    ),
  );
}