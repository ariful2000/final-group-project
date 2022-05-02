import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fooddonationapp/models/food_request.dart';
import 'package:fooddonationapp/res/collections.dart';

class RequestService {
  static Future<void> saveRequest(FoodRequest foodRequest) async {
    await Collections.requestsCollection.add(FoodRequest.toMap(foodRequest));
  }

  static Stream<QuerySnapshot> getAllRequests() {
    return Collections.requestsCollection
        .orderBy('dateAdded', descending: true)
        .snapshots();
  }
}
