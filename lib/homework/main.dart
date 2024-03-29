import 'package:flutter/material.dart';
import 'package:flutter_dersi3/homework/list_component.dart';

class KamilHorizontalList extends StatefulWidget {
  const KamilHorizontalList({super.key});

  @override
  State<KamilHorizontalList> createState() => _KamilHorizontalListState();
}

class _KamilHorizontalListState extends State<KamilHorizontalList> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'Animals',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ListItem(
                    imageText: 'Aslan',
                    photoName: 'aslan.jpg',
                  ),
                  ListItem(
                    imageText: 'Kedi',
                    photoName: 'kedi.jpg',
                  ),
                  ListItem(
                    imageText: 'Köpek',
                    photoName: 'kopek.jpg',
                  ),
                  ListItem(
                    imageText: 'Ayı',
                    photoName: 'ayı.jpg',
                  ),
                  ListItem(
                    imageText: 'Koala',
                    photoName: 'koala.jpg',
                  ),
                  ListItem(
                    imageText: 'Kanguru',
                    photoName: 'kanguru.jpg',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Cars',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ListItem(
                    imageText: 'Bugatti',
                    photoName: 'bugatti.jpg',
                  ),
                  ListItem(
                    imageText: 'Audi',
                    photoName: 'audi.jpg',
                  ),
                  ListItem(
                    imageText: 'Ferrari',
                    photoName: 'ferrari.jpg',
                  ),
                  ListItem(
                    imageText: 'Koenigsegg',
                    photoName: 'koenigsegg.jpg',
                  ),
                  ListItem(
                    imageText: 'Lamborghini',
                    photoName: 'lamborghini.jpg',
                  ),
                  ListItem(
                    imageText: 'Mercedes',
                    photoName: 'mercedes.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
