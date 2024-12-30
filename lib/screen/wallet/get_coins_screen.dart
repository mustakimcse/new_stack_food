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
                child:  RichText(
                    text:  const TextSpan(
                      text: 'Buy coins once to start bartering!\n',
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0), // Add padding to this section
                            child: Text(
                              'You can earn future coins by sharing your homemade meals. '
                                  'Your purchase helps us grow the community and bring you more delicious options. Learn more ...',
                              style: TextStyle(fontSize: 14,color: Colors.white),
                            ),
                          ),
                        ),
                      ]
                    ),
                ),
              ),
            ),
          ),

          SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
              ),
              itemCount: 4,
              itemBuilder: (context,index){
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
