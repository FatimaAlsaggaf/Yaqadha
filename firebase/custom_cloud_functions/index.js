const admin = require("firebase-admin/app");
admin.initializeApp();

const deletePostComments = require("./delete_post_comments.js");
exports.deletePostComments = deletePostComments.deletePostComments;
