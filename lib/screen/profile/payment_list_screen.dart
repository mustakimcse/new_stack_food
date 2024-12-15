import 'package:flutter/material.dart';

import '../../model/payment_method_list_model.dart';


class PaymentListScreen extends StatefulWidget {
  final Function(PaymentMethodListModel) onSelectPaymentMethod;

  const PaymentListScreen({super.key, required this.onSelectPaymentMethod});

  @override
  State<PaymentListScreen> createState() => _PaymentListScreenState();
}

class _PaymentListScreenState extends State<PaymentListScreen> {
  int? selectedPaymentMethodId;

  final List<PaymentMethodListModel> paymentMethods = [
    PaymentMethodListModel(id: 1, name: "Credit Card", icon: "assets/icon/method.png"),
    PaymentMethodListModel(id: 2, name: "Stripe", icon: "assets/icon/stripe.png"),
    PaymentMethodListModel(id: 3, name: "tSwap", icon: "assets/icon/bargar.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Payment Method"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: paymentMethods.length,
            itemBuilder: (context, index) {
              final method = paymentMethods[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white,
                  child: ListTile(
                    leading: Image.asset(method.icon, width: 40, height: 40),
                    title: Text(method.name),
                    trailing: Radio<int>(
                      value: method.id,
                      groupValue: selectedPaymentMethodId,
                      onChanged: (int? value) {
                        setState(() {
                          selectedPaymentMethodId = value;
                        });
                      },
                    ),
                    onTap: () {
                      setState(() {
                        selectedPaymentMethodId = method.id;
                      });
                    },
                  ),
                ),
              );
            },
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: 100,),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: ElevatedButton(
                onPressed: (){
                  if (selectedPaymentMethodId != null) {
                    final selectedMethod = paymentMethods.firstWhere(
                            (method) => method.id == selectedPaymentMethodId);
                    widget.onSelectPaymentMethod(selectedMethod);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 100),
                    backgroundColor: const Color(0xffb80808)
                ),
                child:  Text("Apply",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
            ),
          )
        ],
      ),

    );
  }
}
