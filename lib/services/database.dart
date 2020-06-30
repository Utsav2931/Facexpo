import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gif_trail/models/user.dart';

class DatabaseService {
  String id2;
  String email2;
  String uid2;
  DatabaseService({this.uid2});
  //collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(
      String name, String email, String id, String uid) async {
    print(email + ' ');
    return await userCollection.document(uid).setData({
      'image':null,
      'name': name,
      'email': email,
      'id': id,
      'uid': uid,
      'instituename': null,
      'department': null,
      'course': null,
      'seating': null,
      'expertise': null,
      'no': null,
      'check': 'false',
    });
  }

  Future updateUser(
      String image,
      String name,
      String uid,
      String instituename,
      String department,
      String course,
      String seating,
      String expertise,
      String no,
      String email,
      String id) async {
    return await userCollection.document(uid).setData({
      'image' : image,
      'name': name,
      'uid': uid,
      'instituename': instituename,
      'department': department,
      'course': course,
      'seating': seating,
      'expertise': expertise,
      'no': no,
      'check': 'true',
      'email': email,
      'id': id
    });
  }

  //User data from snapshot
  UserInfo _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserInfo(
      image:snapshot.data['image'],
      name: snapshot.data['name'],
      instituename: snapshot.data['instituename'],
      department: snapshot.data['department'],
      course: snapshot.data['course'],
      seating: snapshot.data['seating'],
      expertise: snapshot.data['expertise'],
      no: snapshot.data['no'],
      email: snapshot.data['email'],
      id: snapshot.data['id'],
    );
  }

  //List from snapshot
  List<UserInfo> _userListFromSnapShot(QuerySnapshot querySnapshot) {
    return querySnapshot.documents.map((doc) {
      //print('hohihihihihihihihi');
      return UserInfo(
          image: doc.data['image'] ?? null,
          uid: doc.data['uid'] ?? null,
          name: doc.data['name'] ?? null,
          instituename: doc.data['instituename'] ?? null,
          department: doc.data['department'] ?? null,
          course: doc.data['course'] ?? null,
          seating: doc.data['seating'] ?? null,
          expertise: doc.data['expertise'] ?? null,
          no: doc.data['no'] ?? null,
          email: doc.data['email'] ?? null,
          id: doc.data['id'] ?? null,
          check: doc.data['check']);
    }).toList();
  }

  //get user stream
  Stream<List<UserInfo>> get userData {
    return userCollection.snapshots().map(_userListFromSnapShot);
  }

  //Document Stream
  Stream<UserInfo> get userInfo {
    return userCollection.document(uid2).snapshots().map(_userDataFromSnapshot);
  }
}
