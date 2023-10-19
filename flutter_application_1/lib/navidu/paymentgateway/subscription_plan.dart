import 'package:flutter/material.dart';
import 'package:flutter_application_1/navidu/paymentgateway/credit_card_page.dart';

class SubscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription Plans'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.attach_money),
                title: const Text('Basic'),
                subtitle: Text('5.99/month'),
                trailing: ElevatedButton(
                  child: const Text('Select'),
                  onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreditCardPage()),
                      );
                    // Handle selection of Basic plan
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.attach_money),
                title: const Text('Premium'),
                subtitle: Text('9.99/month'),
                trailing: ElevatedButton(
                  child: const Text('Select'),
                  onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreditCardPage()),
                     );
                    // Handle selection of Premium plan
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.attach_money),
                title: const Text('Premium Plus'),
                subtitle: Text('14.99/month'),
                trailing: ElevatedButton(
                  child: const Text('Select'),
                  onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreditCardPage()),
                     );
                    // Handle selection of Premium Plus plan
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
