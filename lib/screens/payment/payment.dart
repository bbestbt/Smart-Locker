// import 'package:barcode_scan/barcode_scan.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:locker/components/default_button.dart';
// import 'package:locker/screens/payment/scan.dart';

// class PaymentScreen extends StatelessWidget {
//   static String routeName = "/payment";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             children: [
//               Text(
//                 "Payment",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Image(
//                   image: NetworkImage(
//                       "https://media.istockphoto.com/vectors/qr-code-scan-phone-icon-in-comic-style-scanner-in-smartphone-vector-vector-id1166145556")),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: DefaultButton(
//                   text: "Scan QR cdoe",
//                   press: () {
//                     Navigator.of(context).push(
//                         MaterialPageRoute(builder: (context) => ScanPage()));
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
