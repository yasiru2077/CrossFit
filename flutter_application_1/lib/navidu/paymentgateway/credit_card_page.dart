
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter/src/material/colors.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({super.key});
  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvv = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      //App Bar design
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text('Card Details'),
        titleTextStyle: const TextStyle(
          color: Colors.orange,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
        //automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
              Navigator.pop(context);
            },
        ),
      ),

      // Body area for the card and the Form
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            CreditCardWidget(
              cardHolderName: cardHolderName,
              expiryDate: expiryDate,
              cardNumber: cardNumber,
              cvvCode: cvv,
              showBackView: isCvvFocused,
              obscureCardCvv: true,
              obscureCardNumber: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  CreditCardForm(
                    cardHolderName: cardHolderName,
                    expiryDate: expiryDate,
                    cardNumber: cardNumber,
                    cvvCode: cvv,
                    cursorColor: Colors.green,
                    themeColor: Colors.white,
                    textColor: Colors.black,
                    onCreditCardModelChange: onCreditCardModelChange1,
                    formKey: formkey,

                    // ignore: prefer_const_constructors
                    cardNumberDecoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: ('Number'),
                      hintText: 'xxxx xxxx xxxx xxxx',
                      filled: true,
                      fillColor: Colors.orange,
                    ),

                    expiryDateDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Expired Date',
                      hintText: 'xx/xx',
                      filled: true,
                      fillColor: Colors.orange,
                    ),

                    cvvCodeDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CVV',
                      hintText: 'xxx',
                      filled: true,
                      fillColor: Colors.orange,
                    ),

                    cardHolderDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Card Holder',
                      filled: true,
                      fillColor: Colors.orange,
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.0),
                          //primary: const Color(0x0ff1b44b)
                        ),
                        backgroundColor: Colors.orange,
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(0.5),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: const Text(
                          'Make payment',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'halter',
                              fontSize: 14,
                              package: 'flutter_credit_card'),
                        ),
                      ),

                      // Make payment in the fields
                      onPressed: () {
                    // Show the success message
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text("Payment Successful"),
                            content: Text("Your payment was successful"),
                            actions: [
                             /* FlatButton(
                                child: const Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),*/
                            ],
                          );
                        },
                      );
                     },
                    ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange1(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvv = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

