import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> liste = [];
  int currentIndex = 0;
  List<Map<String, String>> usersList = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  FocusNode nameFocus = FocusNode();
  FocusNode ageFocusNode = FocusNode();
  FocusNode surnameFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            currentIndex = index;
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
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
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
                  Expanded(
                    child: ListView.builder(
                      itemCount: usersList.length,
                      itemBuilder: (context, index) {
                        return myListTile(index);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const Center(
          child: Text("Ikinci sayfa"),
        )
      ].elementAt(currentIndex),
    );
  }

  Container myListTile(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
              colors: [Color(0xff220045), Colors.white],
              begin: Alignment.center)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          nameAndSurnameTextArae(
              name: usersList[index]['name'] ?? "",
              surname: usersList[index]['surname'] ?? "",
              age: usersList[index]['age'] ?? ""),
          IconButton(
            onPressed: () {
              deleteUser(index);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
              size: 32,
            ),
          )
        ],
      ),
    );
  }

  void deleteUser(int index) {
    usersList.removeAt(index);
    setState(() {});
  }

  Column nameAndSurnameTextArae(
      {required String name, required String surname, required String age}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Adı: $name",
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Text(
          "Soyadı: $surname",
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Text(
          "Yaş: $age",
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontStyle: FontStyle.italic),
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
          TextField(
            controller: nameController,
            focusNode: nameFocus,
            onChanged: (value) {
              List<String> data = value.split("");
              isThereSpace(data);
              if (isThereSpace(data)) {
                FocusScope.of(context).requestFocus(surnameFocus);
              }
            },
            autofocus: true,
            decoration: const InputDecoration(
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
          TextField(
            controller: surnameController,
            focusNode: surnameFocus,
            onChanged: (value) {
              List<String> data = value.split("");
              isThereSpace(data);
              if (isThereSpace(data)) {
                FocusScope.of(context).requestFocus(ageFocusNode);
              }
            },
            decoration: const InputDecoration(
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
          TextField(
            controller: ageController,
            focusNode: ageFocusNode,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              List<String> data = value.split("");
              isThereSpace(data);
              if (isThereSpace(data)) {
                FocusScope.of(context).requestFocus(FocusNode());
              }
            },
            decoration: const InputDecoration(
              hintText: "Yaşı",
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 16),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              filled: true,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        surnameController.text.isNotEmpty) {
                      setState(() {
                        usersList.add({
                          "name": nameController.text,
                          "surname": surnameController.text,
                          "age": ageController.text
                        });
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Kayıt Başarılı."),
                        ),
                      );
                      print(usersList);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Ad-Soyad Alanı Boş Olamaz!'),
                      ));
                    }
                  },
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
                  onPressed: () {
                    nameController.clear();
                    surnameController.clear();
                    ageController.clear();

                    setState(() {});
                    // usersList.removeWhere((element) {
                    //   return nameController.text.trim() ==
                    //       element['name']?.trim();
                    // });
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: const Text("Temizle"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  bool isThereSpace(List<String> list) {
    for (var element in list) {
      print("element: $element");
      if (element == " ") {
        return true;
      }
    }
    return false;
  }
}
