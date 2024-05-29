import 'package:flutter/material.dart';
import 'dart:math' as math;

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({super.key});

          @override
          Widget build(BuildContext context) {
          // Figma Flutter Generator PaymentWidget - FRAME
            return Container(
      width: 430,
      height: 932,
      decoration: const BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
  ),
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 430,
        height: 932,
        decoration: const BoxDecoration(
          color : Color.fromRGBO(255, 204, 229, 1),
  )
      )
      ),Positioned(
        top: 40,
        left: 30,
        child: SizedBox(
      width: 30,
      height: 33,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Image.asset(
        'assets/images/vector.svg',
        semanticLabel: 'vector'
      )
      ),
        ]
      )
    )
      ),Positioned(
        top: 192,
        left: 18,
        child: SizedBox(
      width: 394.41864013671875,
      height: 286,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 394.41864013671875,
        height: 286,
        decoration: BoxDecoration(
          borderRadius : const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
      color : const Color.fromRGBO(255, 255, 255, 1),
      border : Border.all(
          color: const Color.fromRGBO(118, 111, 111, 1),
          width: 1,
        ),
  )
      )
      ),
        ]
      )
    )
      ),Positioned(
        top: 513,
        left: 18,
        child: SizedBox(
      width: 394.41864013671875,
      height: 158,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 394.41864013671875,
        height: 158,
        decoration: BoxDecoration(
          borderRadius : const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
      color : const Color.fromRGBO(255, 255, 255, 1),
      border : Border.all(
          color: const Color.fromRGBO(118, 111, 111, 1),
          width: 1,
        ),
  )
      )
      ),
        ]
      )
    )
      ),const Positioned(
        top: 95,
        left: 30,
        child: Text('Details About', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 24,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),const Positioned(
        top: 225,
        left: 45,
        child: Text('Order Details', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 24,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),const Positioned(
        top: 553,
        left: 45,
        child: Text('Your Order on Delivery', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 16,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),const Positioned(
        top: 418,
        left: 45,
        child: Text('Total', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 24,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),const Positioned(
        top: 420,
        left: 295,
        child: Text('Rp. 277.000', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 16,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),const Positioned(
        top: 131,
        left: 30,
        child: Text('Order #221', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 24,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 401.0055236816406,
        left: 30,
        child: Transform.rotate(
        angle: -0.15653614126001691 * (math.pi / 180),
        child: Image.asset(
        'assets/images/line2.svg',
        semanticLabel: 'line2'
      ),
      )
      ),const Positioned(
        top: 283,
        left: 45,
        child: Text('3 x Strawberry Cheesecake (S)', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 14,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),const Positioned(
        top: 283,
        left: 295,
        child: Text('Rp.  111.ooo', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 14,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),const Positioned(
        top: 313,
        left: 295,
        child: Text('Rp.  44.ooo', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 14,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),const Positioned(
        top: 343,
        left: 295,
        child: Text('Rp.  35.ooo', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 14,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),const Positioned(
        top: 313,
        left: 45,
        child: Text('1 x Strawberry Dessert (R)', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 14,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),const Positioned(
        top: 348,
        left: 45,
        child: Text('1 x Strawberry Mousse (L)', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 14,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 547,
        left: 308,
        child: Container(
        width: 86,
        height: 90,
        decoration: const BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/images/berryhappylogo.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),const Positioned(
        top: 582,
        left: 46,
        child: Text('Delivery Estimate', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 16,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),const Positioned(
        top: 606,
        left: 46,
        child: Text('15 - 20 Minute', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(118, 111, 111, 1),
        fontFamily: 'Poppins',
        fontSize: 16,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),
        ]
      )
    );
          }
        }
        