import 'package:flutter/material.dart';

void main() {
  runApp(const MarcadorApp());
}

class MarcadorApp extends StatelessWidget {
  const MarcadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marcador Deportivo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MarcadorPage(),
    );
  }
}

class MarcadorPage extends StatefulWidget {
  const MarcadorPage({super.key});

  @override
  State<MarcadorPage> createState() => _MarcadorPageState();
}

class _MarcadorPageState extends State<MarcadorPage> {
  int puntosA = 0;
  int puntosB = 0;

  // Sumar puntos al equipo A
  void sumarA() {
    setState(() {
      puntosA++;
    });
  }

  // Restar puntos al equipo A
  void restarA() {
    if (puntosA > 0) {
      setState(() {
        puntosA--;
      });
    }
  }

  // Sumar puntos al equipo B
  void sumarB() {
    setState(() {
      puntosB++;
    });
  }

  // Restar puntos al equipo B
  void restarB() {
    if (puntosB > 0) {
      setState(() {
        puntosB--;
      });
    }
  }

  // Reiniciar marcador
  void reiniciar() {
    setState(() {
      puntosA = 0;
      puntosB = 0;
    });
  }

  // Mensaje del resultado
  String get mensajeResultado {
    if (puntosA > puntosB) {
      return 'Va ganando Equipo A';
    } else if (puntosB > puntosA) {
      return 'Va ganando Equipo B';
    } else {
      return 'Empate';
    }
  }

  // Color del Equipo A
  Color colorEquipoA() {
    if (puntosA > puntosB) {
      return Colors.green.shade200;
    }

    return Colors.grey.shade200;
  }

  // Color del Equipo B
  Color colorEquipoB() {
    if (puntosB > puntosA) {
      return Colors.green.shade200;
    }

    return Colors.grey.shade200;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marcador Deportivo'),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            // Mensaje del resultado
            Text(
              mensajeResultado,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // Equipos
            Row(
              children: [
                // EQUIPO A
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: colorEquipoA(),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),

                    child: Column(
                      children: [
                        const Text(
                          'Equipo A',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Text(
                          '$puntosA',
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: restarA,
                                child: const Text('-1'),
                              ),
                            ),

                            const SizedBox(width: 8),

                            Expanded(
                              child: ElevatedButton(
                                onPressed: sumarA,
                                child: const Text('+1'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                // EQUIPO B
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: colorEquipoB(),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),

                    child: Column(
                      children: [
                        const Text(
                          'Equipo B',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Text(
                          '$puntosB',
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: restarB,
                                child: const Text('-1'),
                              ),
                            ),

                            const SizedBox(width: 8),

                            Expanded(
                              child: ElevatedButton(
                                onPressed: sumarB,
                                child: const Text('+1'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            // Botón reiniciar
            ElevatedButton.icon(
              onPressed: reiniciar,
              icon: const Icon(Icons.refresh),
              label: const Text('Reiniciar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}