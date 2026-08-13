import 'package:flutter/material.dart';

const Color kFondo = Color(0xFFF7F7F5);
const Color kSuperficie = Color(0xFFF0F1EF);
const Color kBorde = Color(0xFFE0E0DD);
const Color kTexto = Color(0xFF1E1E1E);
const Color kMuted = Color(0xFF777777);
const Color kLima = Color(0xFFC8F54E);
const Color kOscuro = Color(0xFF303030);
const Color kBlanco = Color(0xFFFFFFFF);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pantalla 2',

      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: kFondo,

        colorScheme: ColorScheme.fromSeed(
          seedColor: kLima,
          brightness: Brightness.light,
        ),
      ),
      home: const AddMoneyPage(),
    );
  }
}

class AddMoneyPage extends StatelessWidget {
  const AddMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFondo,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),

          children: [

            Row(
              children: [

                Container(
                  width: 42,
                  height: 42,

                  decoration: BoxDecoration(
                    color: kBlanco,

                    border: Border.all(
                      color: kBorde,
                    ),

                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                    color: kTexto,
                  ),
                ),

                const Expanded(
                  child: Text(
                    'Add money',

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 20,
                      color: kTexto,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Espacio para mantener el título centrado
                const SizedBox(
                  width: 42,
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              'Select card',

              style: TextStyle(
                fontSize: 18,
                color: kTexto,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 120,

              child: ListView(
                scrollDirection: Axis.horizontal,

                children: [

                  bankCard(
                    color: kLima,
                    title: 'Debit card',
                    number: '•••• 4688',
                    selected: true,
                  ),

                  const SizedBox(width: 12),

                  bankCard(
                    color: kOscuro,
                    title: 'Credit card',
                    number: '•••• 2478',
                    selected: false,
                  ),

                  const SizedBox(width: 12),

                  bankCard(
                    color: const Color(0xFF555555),
                    title: 'Bank card',
                    number: '•••• 8091',
                    selected: false,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 35),

            // ADD MONEY TO NEOBANK

            const Text(
              'Add money to Neobank',

              style: TextStyle(
                fontSize: 18,
                color: kTexto,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            moneyMethod(
              icon: Icons.account_balance_outlined,
              title: 'Move your direct deposit',
            ),

            const SizedBox(height: 12),

            moneyMethod(
              icon: Icons.swap_horiz,
              title: 'Transfer from other banks',
            ),

            const SizedBox(height: 12),

            moneyMethod(
              icon: Icons.phone_iphone,
              title: 'Apple Pay',
            ),

            const SizedBox(height: 12),

            moneyMethod(
              icon: Icons.credit_card,
              title: 'Debit / Credit Card',
            ),
          ],
        ),
      ),
    );
  }
}

Widget bankCard({
  required Color color,
  required String title,
  required String number,
  required bool selected,
}) {
  return Container(
    width: 155,
    height: 115,

    padding: const EdgeInsets.all(15),

    decoration: BoxDecoration(
      color: color,

      borderRadius: BorderRadius.circular(16),

      border: selected
          ? Border.all(
              color: kTexto,
              width: 2,
            )
          : null,
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [

            if (selected)
              const Icon(
                Icons.check_circle,
                color: kTexto,
                size: 20,
              ),
          ],
        ),

        const Spacer(),
        Text(
          title,

          style: TextStyle(
            fontSize: 14,

            color: selected
                ? kTexto
                : kBlanco,

            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 5),
        Text(
          number,

          style: TextStyle(
            fontSize: 13,

            color: selected
                ? kTexto
                : kBlanco,
          ),
        ),
      ],
    ),
  );
}

Widget moneyMethod({
  required IconData icon,
  required String title,
}) {
  return Container(
    width: double.infinity,

    padding: const EdgeInsets.all(15),

    decoration: BoxDecoration(
      color: kSuperficie,

      borderRadius: BorderRadius.circular(14),

      border: Border.all(
        color: kBorde,
      ),
    ),

    child: Row(
      children: [

        // ÍCONO
        Container(
          width: 40,
          height: 40,

          decoration: BoxDecoration(
            color: kBlanco,

            borderRadius: BorderRadius.circular(10),
          ),

          child: Icon(
            icon,
            color: kTexto,
            size: 21,
          ),
        ),

        const SizedBox(width: 15),

        Expanded(
          child: Text(
            title,

            style: const TextStyle(
              fontSize: 14,
              color: kTexto,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        const Icon(
          Icons.chevron_right,
          color: kMuted,
          size: 25,
        ),
      ],
    ),
  );
}