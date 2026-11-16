import 'package:cloud_functions/cloud_functions.dart';

final completeToday =
FirebaseFunctions.instance
    .httpsCallable('completeToday');

Future<Map<String, dynamic>>
completeChallenge() async {

  final result =
  await completeToday.call<
      Map<String, dynamic>>({
    'challengeId': 'today',
  });

  return result.data;
}

// TODO: Handle FirebaseFunctionsException

// TODO: Display returned points

// TODO: Display returned badge

// TODO: Distinguish first completion
// from alreadyCompleted responses