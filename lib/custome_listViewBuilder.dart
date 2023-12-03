import 'package:flutter/material.dart';

class counterView extends StatefulWidget {
  const counterView({super.key});

  @override
  State<counterView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<counterView> {
  TextEditingController friendListController = TextEditingController();
  TextEditingController updateItemController = TextEditingController();
  List friendList = [
    "Ahmed Raza",
    "Muzammil",
    "Mudassir",
    "Zainu",
    "Umme Hani",
    "Marium"
  ];
  addItems() {
    setState(() {
      friendList.add("value");
    });
  }

  removeItem({meraBanayaHuaParematerJoValuePassKarega}) {
    setState(() {
      friendList.removeAt(meraBanayaHuaParematerJoValuePassKarega);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: friendListController,
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  friendList.add(friendListController.text);
                  friendListController.clear();
                });
              },
              child: Text("Add Items"))
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: friendList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 4),
              child: ListTile(
                tileColor: Colors.grey,
                title: Text(friendList[index]),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            updateItemController.text = friendList[index];
                            showDialog(
                                context: context,
                                // barrierDismissible: false ,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Update Your Value"),
                                    content: TextField(
                                      controller: updateItemController,
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              friendList[index] =
                                                  updateItemController.text;
                                            });
                                            updateItemController.clear();
                                            Navigator.pop(context);
                                          },
                                          child: Text("Update"))
                                    ],
                                  );
                                });
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            removeItem(
                                meraBanayaHuaParematerJoValuePassKarega: index);
                          },
                          icon: Icon(Icons.delete)),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
