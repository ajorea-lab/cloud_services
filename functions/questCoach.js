import { onCall, HttpsError }
from "firebase-functions/v2/https";

import { getFirestore }
from "firebase-admin/firestore";

// TODO: Import Genkit flow

// TODO: Import model gateway

const db = getFirestore();

export const askQuestCoach =
  onCall(async (request) => {

    // TODO: Verify sign in

    // TODO: Validate question

    // TODO: Enforce max 300 chars

    // TODO: Derive UID from auth context

    // TODO: Call readMyQuestState tool

    // TODO: Read only:
    // challenges/today
    // users/{uid}/progress/today

    // TODO: Force tool usage before hint

    // TODO: Return concise hint

    // TODO: Return fallback if model unavailable

    // TODO: Prevent any writes
});