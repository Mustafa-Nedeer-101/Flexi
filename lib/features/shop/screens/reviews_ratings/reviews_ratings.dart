import 'package:flexi/common/widgets/appbar/appbar.dart';
import 'package:flexi/common/widgets/products/ratings/rating_indicator.dart';
import 'package:flexi/features/shop/screens/reviews_ratings/widgets/overall_product_review.dart';
import 'package:flexi/features/shop/screens/reviews_ratings/widgets/user_review_card.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class ReviewsRatingsScreen extends StatelessWidget {
  const ReviewsRatingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: const CustomAppBar(
        title: Text("Ratings & Reviews"),
        showBackArrow: true,
      ),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(CTexts.verifiedReviews),

              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),

              // Overall Product Reviews
              const ReviewsRatingsOverallReview(),

              // Rating Indicator
              const CustomRatingIndicator(rating: 3.5),
              Text(
                " (261)",
                style: Theme.of(context).textTheme.bodySmall,
              ),

              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              const ReviewsRatingsUserReviewCard(),
              const ReviewsRatingsUserReviewCard(),
              const ReviewsRatingsUserReviewCard(),
              const ReviewsRatingsUserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
