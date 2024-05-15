import 'package:flexi/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flexi/common/widgets/products/ratings/rating_indicator.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ReviewsRatingsUserReviewCard extends StatelessWidget {
  const ReviewsRatingsUserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // User
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // User Profile and Name
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(CImages.userProfileImage1),
                ),
                const SizedBox(
                  width: CSizes.spaceBtwItems,
                ),
                Text(
                  'John Cena',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),

            // More Icon
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),

        const SizedBox(
          height: CSizes.spaceBtwSections,
        ),

        // Review
        Row(
          children: [
            const CustomRatingIndicator(
              rating: 4,
              itemSize: 18,
            ),
            const SizedBox(
              width: CSizes.spaceBtwItems,
            ),
            Text(
              '30 Mar 2024',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),

        const SizedBox(
          height: CSizes.spaceBtwItems,
        ),

        // Review Message
        const ReadMoreText(
          CTexts.productReview1,
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' Show Less',
          trimCollapsedText: ' Show More',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: CColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: CColors.primary),
        ),

        const SizedBox(
          height: CSizes.spaceBtwItems,
        ),

        // Reply Message
        CustomRoundedContainer(
          backgroundColor: dark ? CColors.darkerGrey : CColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(CSizes.md),
            child: Column(
              children: [
                // Company Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mustafa's Store",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "2 Apr 2024",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),

                const SizedBox(
                  height: CSizes.spaceBtwItems,
                ),

                // Reply Message
                const ReadMoreText(
                  CTexts.replyMessage1,
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' Show Less',
                  trimCollapsedText: ' Show More',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: CColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: CColors.primary),
                ),
              ],
            ),
          ),
        ),

        // Space
        const SizedBox(
          height: CSizes.spaceBtwSections,
        ),
      ],
    );
  }
}
