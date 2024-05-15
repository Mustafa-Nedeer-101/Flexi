import 'package:flexi/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flexi/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:flexi/features/authentication/screens/sign_up/sign_up.dart';
import 'package:flexi/features/authentication/screens/sign_up/verify_email.dart';
import 'package:flexi/features/personalization/screens/address/address.dart';
import 'package:flexi/features/personalization/screens/profile/profile.dart';
import 'package:flexi/features/personalization/screens/settings/settings.dart';
import 'package:flexi/features/shop/screens/cart/cart.dart';
import 'package:flexi/features/shop/screens/checkout/checkout.dart';
import 'package:flexi/features/shop/screens/home/home.dart';
import 'package:flexi/features/shop/screens/orders/orders.dart';
import 'package:flexi/features/shop/screens/reviews_ratings/reviews_ratings.dart';
import 'package:flexi/features/shop/screens/store/store.dart';
import 'package:flexi/features/shop/screens/wishlist/wishlist.dart';
import 'package:flexi/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: RRoutes.home, page: () => const HomeScreen()),
    GetPage(name: RRoutes.store, page: () => const StoreScreen()),
    GetPage(name: RRoutes.favourites, page: () => const WishlistScreen()),
    GetPage(name: RRoutes.settings, page: () => const SettingsScreen()),
    GetPage(
        name: RRoutes.productReviews, page: () => const ReviewsRatingsScreen()),
    GetPage(name: RRoutes.order, page: () => const OrdersScreen()),
    GetPage(name: RRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: RRoutes.cart, page: () => const CartScreen()),
    GetPage(name: RRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: RRoutes.userAddress, page: () => const AddressScreen()),
    GetPage(name: RRoutes.signup, page: () => const SignUp()),
    GetPage(name: RRoutes.forgetPassword, page: () => const ForgotPassword()),
    GetPage(name: RRoutes.onBoarding, page: () => const OnBoarding()),
    GetPage(name: RRoutes.verigyEmail, page: () => const VerifyEmail()),
  ];
}
