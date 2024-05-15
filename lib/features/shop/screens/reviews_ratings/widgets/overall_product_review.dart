import 'package:flexi/features/shop/screens/reviews_ratings/widgets/progress_indicator_and_rating.dart';
import 'package:flutter/material.dart';

class ReviewsRatingsOverallReview extends StatelessWidget {
  const ReviewsRatingsOverallReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 3,
            child: Text(
              '4.8',
              style: Theme.of(context).textTheme.displayLarge,
            )),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              ReviewsRatingsProgressIndicator(text: '5', value: 0.8),
              ReviewsRatingsProgressIndicator(text: '4', value: 0.4),
              ReviewsRatingsProgressIndicator(text: '3', value: 0.6),
              ReviewsRatingsProgressIndicator(text: '2', value: 0.3),
              ReviewsRatingsProgressIndicator(text: '1', value: 0.1),
            ],
          ),
        )
      ],
    );
  }
}
