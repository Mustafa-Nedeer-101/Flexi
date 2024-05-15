import 'package:flexi/common/widgets/appbar/appbar.dart';
import 'package:flexi/features/shop/screens/orders/widgets/order_list.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      // Body
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CSizes.defaultSpace),
          child: OrderListItems(),
        ),
      ),
    );
  }
}
