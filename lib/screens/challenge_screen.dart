import 'package:cw2_cloud_services/services/coach_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({
    super.key,
    required this.user,
    required this.onComplete,
  });

  final User user;
  final VoidCallback onComplete;

  @override
  State<ChallengeScreen> createState() =>
      _ChallengeScreenState();
}

class _ChallengeScreenState
    extends State<ChallengeScreen> {

  final questionController =
      TextEditingController();

  String coachReply = '';

  bool isLoading = false;

  @override
  void dispose() {
    questionController.dispose();
    super.dispose();
  }
  //completeion function pass from app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Quest'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance
                  .signOut();
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          Text(
            'Signed in as ${widget.user.email ?? widget.user.uid}',
          ),

          Text(
            "Today's challenge",
            style: Theme.of(context)
                .textTheme
                .headlineSmall,
          ),

          Text(challengeText.isEmpty? 'Loading challenge...': challengeText,),

          // TODO: Load and display challenge data

          // TODO: Load and display learner progress

          // TODO: Display earned badge

          // TODO: Display current points

          const SizedBox(height: 16),

          FilledButton(
            onPressed: widget.onComplete,
            child: const Text(
              'Complete challenge',
            ),
          ),

          // TODO: Disable completion after success

          // TODO: Show already-completed state

          TextField(
            controller: questionController,
            maxLength: 300,
            decoration: const InputDecoration(
              labelText:
                  'Ask the Quest Coach for a hint',
            ),
          ),

          OutlinedButton(
            onPressed: isLoading
                ? null
                : () async {

                    setState(
                      () => isLoading = true,
                    );

                    try {

                      final reply =
                          await getQuestHint(
                        questionController.text,
                      );

                      if (!mounted) return;

                      setState(
                        () => coachReply = reply,
                      );

                    } on FirebaseFunctionsException
                        catch (error) {

                      debugPrint(
                        'Quest Coach request failed: ${error.code}',
                      );

                      if (!mounted) return;

                      setState(
                        () => coachReply =
                            'The coach is unavailable. Try again.',
                      );

                    } finally {

                      if (mounted) {
                        setState(
                          () => isLoading = false,
                        );
                      }
                    }
                  },
            child: Text(
              isLoading
                  ? 'Thinking...'
                  : 'Get hint',
            ),
          ),

          const SizedBox(height: 12),

          if (coachReply.isNotEmpty)
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.all(12),
                child: Text(
                  coachReply,
                ),
              ),
            ),

          // TODO: Display function/model error state
        ],
      ),
    );
  }
}