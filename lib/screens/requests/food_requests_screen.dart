import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddonationapp/models/food_request.dart';
import 'package:fooddonationapp/res/app_colors.dart';
import 'package:fooddonationapp/screens/requests/components/empty_request.dart';
import 'package:fooddonationapp/screens/requests/components/request_item.dart';
import 'package:fooddonationapp/services/request_service.dart';
import 'package:fooddonationapp/widgets/widgets.dart';
import 'package:get/get.dart';

class FoodRequestScreen extends StatelessWidget {
  const FoodRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: const Text(
          'Food Requests',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: RequestService.getAllRequests(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: circularProgress());
            }
            if (snapshot.data!.docs.isEmpty) {
              return const EmptyRequest();
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              itemBuilder: (context, index) {
                FoodRequest foodRequest = FoodRequest.fromMap(
                    snapshot.data!.docs[index].data() as Map<String, dynamic>);
                return RequestItem(foodRequest: foodRequest);
              },
            );
          }),
    );
  }
}
