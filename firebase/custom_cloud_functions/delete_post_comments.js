const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.deletePostComments = functions.firestore
  .document("Post/{postId}")
  .onDelete(async (snapshot, context) => {
    // 1. هذا هو مرجع البوست الذي تم حذفه
    const deletedPostRef = snapshot.reference;
    const firestore = admin.firestore();

    console.log(
      `Post deleted: ${deletedPostRef.id}. Searching for comments...`,
    );

    // 2. البحث في كولكشن "comment" عن كل التعليقات المتعلقة بهذا البوست
    //    (نستخدم الأسماء التي أعطيتني إياها)
    const commentsQuery = firestore
      .collection("comment") //  <--- اسم كولكشن التعليقات
      .where("postref", "==", deletedPostRef); // <--- اسم حقل المرجع

    const commentsSnapshot = await commentsQuery.get();

    // إذا لم تكن هناك تعليقات، أنهِ الدالة
    if (commentsSnapshot.empty) {
      console.log("No comments found for deleted post. Exiting.");
      return null;
    }

    // 3. استخدام "Batch Write" لحذف كل التعليقات مرة واحدة
    const batch = firestore.batch();
    commentsSnapshot.forEach((doc) => {
      batch.delete(doc.reference);
    });

    // 4. تنفيذ عملية الحذف
    await batch.commit();

    console.log(`SUCCESS: Deleted ${commentsSnapshot.size} comments.`);
    return null;
  });
