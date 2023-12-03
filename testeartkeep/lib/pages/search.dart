import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('search',
          style: TextStyle(
            fontFamily: 'AlfaSlabOne',
            fontSize: 24,
            color: Colors.black,
          ),),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric
              (horizontal: 8.0),
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Art pieces, artists...",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 8),
              child: Text(
                'Results',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w100,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(color: Colors.black, width: 0.1),
                        bottom: BorderSide(color: Colors.black, width: 0.1),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Image.asset(
                              'lib/images/foryou-2.png',
                              width: 60.0,
                              height: 60.0,
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Annunciation Triptych (Merode Altarpiece)',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'Author for Item $index',
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
