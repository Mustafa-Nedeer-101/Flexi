import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flexi/features/personalization/models/address_model.dart';
import 'package:flexi/features/shop/models/cart_item_model.dart';
import 'package:flexi/utils/constants/enums.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';

class OrderModel {
  OrderModel({
    required this.id,
    this.userId = '',
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Paypal',
    this.address,
    this.deliveryDate,
    required this.items,
  });

  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  String get formattedOrderDate => UHelperFunctions.getFormattedDate(orderDate);
  String get formattedDeliveryDate => deliveryDate != null
      ? UHelperFunctions.getFormattedDate(deliveryDate!)
      : '';

  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : 'Processing';

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'UserId': userId,
      'Status': status.toString(),
      'TotalAmount': totalAmount,
      'OrderDate': orderDate,
      'PaymentMethod': paymentMethod,
      'Address': address?.toJson(),
      'DeliveryDate': deliveryDate,
      'Items': items.map((item) => item.toJson()).toList(),
    };
  }

  factory OrderModel.instanceFromQueryDocumentSnapshot(
      DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return OrderModel(
        id: data['Id'] as String,
        userId: data['UserId'] as String,
        status: OrderStatus.values
            .firstWhere((element) => element.toString() == data['Status']),
        totalAmount: data['TotalAmount'] as double,
        orderDate: (data['OrderDate'] as Timestamp).toDate(),
        paymentMethod: data['PaymentMethod'] as String,
        address: data['Address'] == null
            ? null
            : AddressModel.instanceFromMap(
                data['Address'] as Map<String, dynamic>),
        deliveryDate: data['DeliveryDate'] == null
            ? null
            : (data['DeliveryDate'] as Timestamp).toDate(),
        items: (data['Items'] as List<dynamic>)
            .map((item) => CartItemModel.instanceFromDocumentSnapshot(
                item as Map<String, dynamic>))
            .toList());
  }
}
