import 'package:flutter/material.dart';

const Color kAzulOscuro = Color(0xFF3561C2);
const Color kAzulMedio = Color(0xFF3F7DD8);
const Color kCeleste = Color(0xFF55A9EA);

const Color kAzulTexto = Color(0xFF174FA8);
const Color kAzulLogo = Color(0xFF123F8C);

const Color kFondo = Color(0xFFF5F8FC);
const Color kSuperficie = Color(0xFFFFFFFF);

const Color kTexto = Color(0xFF182331);
const Color kTextoSecundario = Color(0xFF8190A5);

const Color kBorde = Color(0xFFE2EAF5);


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Empleos',

      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: kFondo,

        colorScheme: ColorScheme.fromSeed(
          seedColor: kAzulMedio,
          brightness: Brightness.light,
        ),
      ),

      home: const EmpleosPage(),
    );
  }
}


class EmpleosPage extends StatelessWidget {
  const EmpleosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFondo,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              kAzulOscuro,
              kAzulMedio,
              kCeleste,
            ],
          ),
        ),

        child: SafeArea(
          bottom: false,

          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.fromLTRB(
                  22,
                  12,
                  22,
                  0,
                ),

                child: Column(
                  children: [

                    // ==================================================
                    // LOGO MV + BIENVENIDA
                    // ==================================================

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [

                        // LOGO M + V
                        const MVLogo(
                          width: 130,
                          height: 105,
                        ),

                        const Spacer(),

                        // ==============================================
                        // BIENVENIDA
                        // ==============================================

                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            Text(
                              'Bienvenido!!',
                              style: TextStyle(
                                fontSize: 23,
                                color: Color(0xFF0A377C),
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            SizedBox(height: 2),

                            Text(
                              'Javier',
                              style: TextStyle(
                                fontSize: 28,
                                color: Color(0xFF0A377C),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // ==================================================
                    // BARRA DE BÚSQUEDA
                    // ==================================================

                    Container(
                      width: double.infinity,
                      height: 62,

                      decoration: BoxDecoration(
                        color: Colors.white,

                        // Puntas completamente redondeadas
                        borderRadius: BorderRadius.circular(35),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(
                              alpha: 0.13,
                            ),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),

                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Buscar empleo...',

                          hintStyle: TextStyle(
                            color: kTextoSecundario,
                            fontSize: 15,
                          ),

                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                              left: 14,
                              right: 8,
                            ),

                            child: Icon(
                              Icons.search_rounded,
                              size: 34,
                              color: kAzulTexto,
                            ),
                          ),

                          prefixIconConstraints: BoxConstraints(
                            minWidth: 60,
                          ),

                          border: InputBorder.none,

                          contentPadding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ==================================================
              // EMPLEOS DISPONIBLES
              // ==================================================

              Expanded(
                child: Container(
                  width: double.infinity,

                  decoration: const BoxDecoration(
                    color: kFondo,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                    ),
                  ),

                  child: Column(
                    children: [

                      const SizedBox(height: 20),
                      const Text(
                        'Empleos Disponibles',
                        style: TextStyle(
                          fontSize: 29,
                          color: kAzulTexto,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ==============================================
                      // NOMBRES DE LAS COLUMNAS
                      // ==============================================

                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                        ),

                        child: Row(
                          children: [

                            // EMPRESA
                            Expanded(
                              flex: 3,

                              child: Text(
                                'Empresa',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: kAzulTexto,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            // TIPO
                            Expanded(
                              flex: 2,

                              child: Text(
                                'Tipo',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: kAzulTexto,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            // SUELDO
                            Expanded(
                              flex: 3,

                              child: Text(
                                'Sueldo',
                                textAlign: TextAlign.end,

                                style: TextStyle(
                                  fontSize: 17,
                                  color: kAzulTexto,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 14),

                      // ==============================================
                      // LISTA DE EMPLEOS
                      // ==============================================

                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.fromLTRB(
                            20,
                            0,
                            20,
                            20,
                          ),

                          children: [

                            empleoCard(
                              empresa: 'Banrural',
                              tipo: 'Cajero',
                              sueldo: 'Q.3,000.00',
                            ),

                            empleoCard(
                              empresa: 'La TORRE',
                              tipo: 'Conserge',
                              sueldo: 'Q.2,500.00',
                            ),

                            empleoCard(
                              empresa: 'Pizza Hut',
                              tipo: 'Motorista',
                              sueldo: 'Q.3,000.00',
                            ),

                            empleoCard(
                              empresa: 'Oficinas S.A.',
                              tipo: 'Secretaria',
                              sueldo: 'Q.2,000.00',
                            ),

                            empleoCard(
                              empresa: 'Televisa',
                              tipo: 'Periodista',
                              sueldo: 'Q.5,000.00',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // ======================================================
      // MENÚ INFERIOR
      // ======================================================

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,

        type: BottomNavigationBarType.fixed,

        backgroundColor: Colors.white,

        selectedItemColor: kAzulMedio,

        unselectedItemColor: kAzulTexto,

        elevation: 12,

        iconSize: 31,

        showSelectedLabels: false,

        showUnselectedLabels: false,

        items: const [

          // NOTIFICACIONES
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none_rounded,
            ),
            label: 'Notificaciones',
          ),

          // PERFIL
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_rounded,
            ),
            label: 'Perfil',
          ),

          // INICIO
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
            ),
            label: 'Inicio',
          ),

          // AJUSTES
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}

// ======================================================
// TARJETA DE CADA EMPLEO
// ======================================================

Widget empleoCard({
  required String empresa,
  required String tipo,
  required String sueldo,
}) {
  return Container(
    margin: const EdgeInsets.only(
      bottom: 14,
    ),

    padding: const EdgeInsets.symmetric(
      horizontal: 18,
      vertical: 20,
    ),

    decoration: BoxDecoration(
      color: kSuperficie,

      // Puntas redondeadas de cada empresa
      borderRadius: BorderRadius.circular(18),

      border: Border.all(
        color: kBorde,
        width: 1,
      ),

      boxShadow: [
        BoxShadow(
          color: kAzulMedio.withValues(
            alpha: 0.10,
          ),
          blurRadius: 9,
          offset: const Offset(0, 4),
        ),
      ],
    ),

    child: Row(
      children: [

        // ==================================================
        // EMPRESA
        // ==================================================

        Expanded(
          flex: 3,

          child: Text(
            empresa,

            style: const TextStyle(
              fontSize: 16,
              color: kTexto,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        // ==================================================
        // TIPO
        // ==================================================

        Expanded(
          flex: 2,

          child: Text(
            tipo,

            style: const TextStyle(
              fontSize: 15,
              color: kTexto,
            ),
          ),
        ),

        // ==================================================
        // SUELDO
        // ==================================================

        Expanded(
          flex: 3,

          child: Text(
            sueldo,

            textAlign: TextAlign.end,

            style: const TextStyle(
              fontSize: 16,
              color: kAzulTexto,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

// ======================================================
// LOGO M + V
// ======================================================

class MVLogo extends StatelessWidget {
  final double width;
  final double height;

  const MVLogo({
    super.key,
    this.width = 130,
    this.height = 105,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,

      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,

        children: [

          // ==================================================
          // LETRA M
          // ==================================================

          Positioned(
            left: 0,
            top: 8,
            right: 0,

            child: Stack(
              alignment: Alignment.center,

              children: [

                // BORDE AZUL DE LA M
                Text(
                  'M',

                  style: TextStyle(
                    fontFamily: 'serif',
                    fontSize: 92,
                    height: 1,
                    fontWeight: FontWeight.w900,

                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 5
                      ..strokeJoin = StrokeJoin.miter
                      ..color = kAzulLogo,
                  ),
                ),

                // RELLENO BLANCO DE LA M
                const Text(
                  'M',

                  style: TextStyle(
                    fontFamily: 'serif',
                    fontSize: 92,
                    height: 1,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // ==================================================
          // LETRA V
          // ==================================================

          Positioned(
            top: 2,
            left: 27,
            right: 27,

            child: Stack(
              alignment: Alignment.center,

              children: [

                // BORDE AZUL DE LA V
                Text(
                  'V',

                  style: TextStyle(
                    fontFamily: 'serif',
                    fontSize: 73,
                    height: 1,
                    fontWeight: FontWeight.w900,

                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 4
                      ..strokeJoin = StrokeJoin.miter
                      ..color = kAzulLogo,
                  ),
                ),

                // RELLENO BLANCO DE LA V
                const Text(
                  'V',

                  style: TextStyle(
                    fontFamily: 'serif',
                    fontSize: 73,
                    height: 1,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}