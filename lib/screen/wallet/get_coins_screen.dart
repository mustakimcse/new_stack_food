import 'package:flutter/material.dart';

import '../../util/consttants.dart';

class GetCoinsScreen extends StatefulWidget {
  const GetCoinsScreen({super.key});

  @override
  State<GetCoinsScreen> createState() => _GetCoinsScreenState();
}

class _GetCoinsScreenState extends State<GetCoinsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(35)),

            ),
            child: Image.asset("assets/icon/rectangle.png")
        ),
        title: Text("Wallet"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: mrBackground,
                    borderRadius: const BorderRadius.all(Radius.circular(15))
                ),
                child:  Text("ssentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,"
                    " and more recently with desktop publishing software like Aldus PageMaker including "
                    "versions of Lorem Ipsum",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),

          SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
              ),
              itemCount: 4,
              itemBuilder: (context,index){
                return Card(
                  child: Column(
                    children: [
                      Image.asset("assets/icon/bargar.png",height: 60,fit: BoxFit.fill,),
                      Text("16 coins"),
                      Text("\$ 16"),
                    ],
                  ),
                );
              }
          )
        ],
      ),
    );
  }
}
