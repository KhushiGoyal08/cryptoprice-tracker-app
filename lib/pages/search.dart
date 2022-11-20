import 'package:cryptospeed/modals/api.dart';
import 'package:cryptospeed/providers/market_Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final formkey = GlobalKey<FormState>();
  final MyContoller = TextEditingController();
  @override
  void dispose() {
    MyContoller.dispose;
    super.dispose;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
        ),
        child: Column(
          children: [
            Form(
              key: formkey,
              child: TextFormField(
                controller: MyContoller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Number of currency",
                ),
              ),
            ),
            const SizedBox(
              height: 20,
              ),
            ElevatedButton(onPressed: (){
              
            }, 
            child: const Text('Search'),
             style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
            // side: BorderSide(color: Colors.yellow, width: 5),
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            shadowColor: Colors.lightBlue,
          ),
            )
          ],
        ),
      ),
    ),
    );
  }
}
