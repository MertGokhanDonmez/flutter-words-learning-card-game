// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

//sqlite baglamayi unutma

void main() {
  runApp(LearnLang());
}

class LearnLang extends StatelessWidget {
  const LearnLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: buttomMenu(),
    );
  }
}

class buttomMenu extends StatefulWidget {
  buttomMenu({Key? key}) : super(key: key);

  @override
  State<buttomMenu> createState() => _buttomMenuState();
}

class _buttomMenuState extends State<buttomMenu> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Edit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Delete',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff9a25f9),
        onTap: _onItemTapped,
        backgroundColor: Color(0xffe4c4fd),
      ),
      body: cardWidget(),
    );
  }
}

class cardWidget extends StatefulWidget {
  const cardWidget({Key? key}) : super(key: key);

  @override
  State<cardWidget> createState() => _cardWidgetState();
}

class _cardWidgetState extends State<cardWidget> {
  int selectedWord = 0;
  int selectedSecondWord = 0;
  List wordListFirst = ['kedi', 'kopek', 'inek'];
  List wordListSecond = ['cat', 'dog', 'cow'];
  String uyari = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: () {
          setState(
            () {
              // listede kelime yoksa uyar, son kelimeye gelindiyse yazdir ve
              // sayaci sifirla, secilen kelime listede varsa goster ve sayaci arttir

              if (wordListFirst.isEmpty) {
                uyari = 'Baslamak icin bir kelime ekleyin';
              } else if (wordListFirst.length - 1 == selectedWord) {
                uyari = wordListFirst[selectedWord];
                selectedSecondWord = selectedWord;
                selectedWord = 0;
              } else {
                if (selectedWord < wordListFirst.length) {
                  uyari = wordListFirst[selectedWord];
                  selectedSecondWord = selectedWord;
                  selectedWord++;
                }
              }
            },
          );
        },
        onLongPress: () {
          setState(() {
            //print('basilmadan once 2. kelime: ' + selectedSecondWord.toString());
            if (wordListSecond.isEmpty) {
              uyari = 'Baslamak icin bir kelime ekleyin';
            } else if (wordListSecond.length - 1 == selectedSecondWord) {
              uyari = wordListSecond[selectedSecondWord];
              selectedSecondWord = 0;
            } else {
              if (selectedSecondWord < wordListSecond.length) {
                uyari = wordListSecond[selectedSecondWord];
              }
            }
          });
        },
        child: Text(
          uyari,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        minWidth: 300,
        height: 300,
      ),
    );
  }
}
