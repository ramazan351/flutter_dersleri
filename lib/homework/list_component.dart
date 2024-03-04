import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String imageText;
  // final Image image;
  final String photoName;

  const ListItem(
      {Key? key,
      required this.imageText,
      // required this.image,
      required this.photoName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 180,
        height: 100,
        // color: Colors.red,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: Colors.red,
            image: DecorationImage(
                image: AssetImage("assets/$photoName"), fit: BoxFit.fill)),
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 70),
              blurRadius: 50.0,
              spreadRadius: 2.0,
            ),
          ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                imageText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
