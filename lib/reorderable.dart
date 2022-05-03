import 'package:flutter/material.dart';

class ReOrderable extends StatefulWidget {
  const ReOrderable({Key? key}) : super(key: key);

  @override
  State<ReOrderable> createState() => _ReOrderableState();
}

class _ReOrderableState extends State<ReOrderable> {
  final List _myList = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) => Scaffold(body: _body);

  SafeArea get _body {
    return SafeArea(
      top: true,
      child: ReorderableListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        header: _header,
        itemBuilder: (context, index) => _containerField(index),
        itemCount: _myList.length,
        onReorder: (oldIndex, newIndex) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          var item = _myList.removeAt(oldIndex);
          _myList.insert(newIndex, item);
        },
      ),
    );
  }

  Row get _header {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Header",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Container _containerField(int index) {
    return Container(
      child: _containerTextField(index),
      key: ValueKey(_myList[index]),
      height: 80,
      transform: Matrix4.rotationZ(-0.05),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Column _containerTextField(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ((_myList[index]) + 1).toString(),
              style: const TextStyle(fontSize: 48),
            )
          ],
        )
      ],
    );
  }
}
