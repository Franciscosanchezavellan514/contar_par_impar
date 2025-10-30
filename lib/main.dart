import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 37, 129, 1)),
      ),
      home: const MyHomePage(title: 'Identificar numeros pares e impares'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  final TextEditingController _controller = TextEditingController();
  List<int> pares = [];
  List<int> impares = [];


  void contarNumeros() {
    final texto = _controller.text.trim();
    if (texto.isEmpty) return;

    final numeros = texto.split(',').map((e) => int.tryParse(e.trim()) ?? 0).toList();

    pares = [];
    impares = [];

    for (var n in numeros) {
      if (n % 2 == 0) {
        pares.add(n);
      } else {
        impares.add(n);
      }
    }
    setState(() {}); 
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Identificar número'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Ingrese números separados por comas (ej: 1,2,3,4,5)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: contarNumeros,
              child: const Text('Contar Pares e Impares'),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('Pares (${pares.length})', style: const TextStyle(color: Color.fromARGB(255, 33, 82, 243), fontWeight: FontWeight.bold)),
                    for (var n in pares) Text('$n', style: const TextStyle(color: Color.fromARGB(255, 33, 54, 243))),
                  ],
                ),
                Column(
                  children: [
                    Text('Impares (${impares.length})', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    for (var n in impares) Text('$n', style: const TextStyle(color: Colors.red)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Calcular numero',
        child: const Icon(Icons.add),
      ),
    );
  }
}
