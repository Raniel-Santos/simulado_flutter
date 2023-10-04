import 'package:flutter/material.dart';
import 'cargos.dart';

class ListagemFuncionarios extends StatefulWidget {
  const ListagemFuncionarios({Key? key}) : super(key: key);

  @override
  FormsState createState() => FormsState();
}

List<Map<String, dynamic>> data = [
  {"id": 1, "name": "Raniel Santos"},
  {"id": 2, "name": "Natalia Bessa"},
  {"id": 3, "name": "Rafael Waltrick"},
  {"id": 4, "name": "Nicolas Lima"},
  {"id": 5, "name": "Rodrigo Ribeiro"},
  {"id": 6, "name": "Vinicius Andrade"},
  {"id": 7, "name": "Kevin Mirenda"}
];

class FormsState extends State<ListagemFuncionarios> {
  int funcionarioSelecionado = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 100.0),
            const Text('Funcionários Cadastrados',
                style: TextStyle(fontSize: 25.0)),
            const SizedBox(height: 50.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = data[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          funcionarioSelecionado = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: funcionarioSelecionado == index
                                ? Colors.teal
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${item['name']}',
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                String nome = "";

                if (funcionarioSelecionado != -1) {
                  nome = data[funcionarioSelecionado]["name"];
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalheFuncionario(
                      nome: nome,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(100, 50),
              ),
              child: const Text('Selecionar'),
            ),
            const SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }
}
