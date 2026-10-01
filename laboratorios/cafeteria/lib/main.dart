import 'package:flutter/material.dart';

void main() {
  runApp(const CafeteriaApp());
}

class CafeteriaApp extends StatelessWidget {
  const CafeteriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi pedido',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown,
        ),
        useMaterial3: true,
      ),
      home: const PedidoPage(),
    );
  }
}

class PedidoPage extends StatefulWidget {
  const PedidoPage({super.key});

  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  int cantidadCafe = 0;
  int cantidadSandwich = 0;
  int cantidadJugo = 0;

  final double precioCafe = 10.00;
  final double precioSandwich = 25.00;
  final double precioJugo = 12.00;

  double get total {
    return (cantidadCafe * precioCafe) +
        (cantidadSandwich * precioSandwich) +
        (cantidadJugo * precioJugo);
  }

  void vaciarPedido() {
    setState(() {
      cantidadCafe = 0;
      cantidadSandwich = 0;
      cantidadJugo = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi pedido'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ProductoPedido(
              nombre: 'Café',
              precio: precioCafe,
              cantidad: cantidadCafe,
              alRestar: () {
                if (cantidadCafe > 0) {
                  setState(() {
                    cantidadCafe--;
                  });
                }
              },
              alSumar: () {
                setState(() {
                  cantidadCafe++;
                });
              },
            ),

            const Divider(),

            ProductoPedido(
              nombre: 'Sándwich',
              precio: precioSandwich,
              cantidad: cantidadSandwich,
              alRestar: () {
                if (cantidadSandwich > 0) {
                  setState(() {
                    cantidadSandwich--;
                  });
                }
              },
              alSumar: () {
                setState(() {
                  cantidadSandwich++;
                });
              },
            ),

            const Divider(),

            ProductoPedido(
              nombre: 'Jugo',
              precio: precioJugo,
              cantidad: cantidadJugo,
              alRestar: () {
                if (cantidadJugo > 0) {
                  setState(() {
                    cantidadJugo--;
                  });
                }
              },
              alSumar: () {
                setState(() {
                  cantidadJugo++;
                });
              },
            ),

            const Spacer(),

            Text(
              'Total: Q${total.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: vaciarPedido,
                icon: const Icon(Icons.delete_outline),
                label: const Text('Vaciar pedido'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductoPedido extends StatelessWidget {
  final String nombre;
  final double precio;
  final int cantidad;
  final VoidCallback alRestar;
  final VoidCallback alSumar;

  const ProductoPedido({
    super.key,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.alRestar,
    required this.alSumar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Q${precio.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: alRestar,
            icon: const Icon(Icons.remove),
          ),

          Text(
            '$cantidad',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          IconButton(
            onPressed: alSumar,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}