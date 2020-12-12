import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  final String quizId;
  final String quizTitle;
  final String quizImageUrl;
  final String uid;
  final String quizDescription;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['uid'] != null),
        quizTitle = map['quizTitle'],
        quizId = map['quizId'],
        quizImageUrl = map['quizImageUrl'],
        quizDescription = map['quizDescription'],
        uid = map['uid'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
