import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> liste = ["ali", "veli", "kırkdokuz", "elli"];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (ali) {
            currentIndex = ali;
            setState(() {});
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 36,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.document_scanner,
                  size: 36,
                ),
                label: "List"),
          ]),
      body: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fieldContainer(),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Üyelerimiz",
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                          colors: [Color(0xff220045), Colors.white],
                          begin: Alignment.center)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      nameAndSurnameTextArae(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 32,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const Center(
          child: Text("Ikinci sayfa"),
        )
      ].elementAt(currentIndex),
    );
  }

  Column nameAndSurnameTextArae() {
    return const Column(
      children: [
        Text(
          "Adı: Ramazan",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Text(
          "Soyadı: Altun",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }

  Widget fieldContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          // colors: [Colors.blue.shade800, Colors.blue.shade500],
          colors: [Color(0xFF163578), Color(0xff4864E6)],
        ),
      ),
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: "Adı",
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 16),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              filled: true,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: "Soyadı",
              filled: true,
              contentPadding: EdgeInsets.only(left: 16),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: const Text("Kaydet"),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: const Text("Sil"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
