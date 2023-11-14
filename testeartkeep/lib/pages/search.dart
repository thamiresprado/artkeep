import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: const EdgeInsets
                  .fromLTRB(16, 24,
                  16, 0),
              child: Text(
                'search',
                style: TextStyle(
                  fontFamily: 'AlfaSlabOne',
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                //controller: editingController,
                decoration: InputDecoration(
                  hintText: "Art pieces, artists...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                // onChanged: (text) {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'Results (20)',
                style: TextStyle(
                  fontSize: 15.0, // Tamanho da fonte
                  fontWeight: FontWeight.normal, // Peso da fonte
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: 20, // Defina o número de itens na sua lista
                itemBuilder: (context, index) {
                  return Card(
                    // Aqui você pode configurar as propriedades do seu card
                    child: ListTile(
                      leading: Image.asset(
                          'lib/images/foryou-1.png'), // Substitua 'assets/sua_imagem.png' pelo caminho da sua imagem
                      title: Text('Item $index'),
                      subtitle: Text('Description for Item $index'),
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
