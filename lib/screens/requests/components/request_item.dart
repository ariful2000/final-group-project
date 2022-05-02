import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fooddonationapp/helpers/date_time_operations.dart';
import 'package:fooddonationapp/models/food_request.dart';

class RequestItem extends StatelessWidget {
  final FoodRequest foodRequest;
  const RequestItem({Key? key, required this.foodRequest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: const EdgeInsets.symmetric(vertical: 5),
      style: const NeumorphicStyle(
        color: Colors.white,
        shape: NeumorphicShape.convex,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              foodRequest.name,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              foodRequest.email,
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10.0),
            _buildRow(
              'Requested: ',
              foodRequest.foodCategory,
            ),
            const SizedBox(height: 6.0),
            _buildRow(
              'Date: ',
              DateTimeOperations.getFormattedDateTime(
                  foodRequest.dateAdded.toDate()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String title, String value) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
