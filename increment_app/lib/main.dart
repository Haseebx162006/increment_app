import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  int luckynumber = 4;
  bool check = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void submit() {
    String usernumber = _controller.text;
    String originalnumber = luckynumber.toString();
    setState(() {
      check = (usernumber == originalnumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Lottery Ticket App",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
                shadows: [
                  Shadow(
                    blurRadius: 4,
                    color: Colors.black45,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.grey.shade900,
            elevation: 6,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // ✨ Engaging intro section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: const [
                    Text(
                      "🎉 Welcome to the Ultimate Lottery Challenge!",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Pick the lucky number and stand a chance to win big prizes. "
                          "Your luck is just a guess away!",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "💰 Today's Jackpot: 1 Million 💰",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    prefixIcon: const Icon(Icons.arrow_forward_sharp),
                    hintText: "Enter your guess number",
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      onPressed: submit, child: const Text("Submit")),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_controller.text.isNotEmpty) ...[
                    if (check) ...[
                      const Icon(Icons.check, color: Colors.green, size: 40),
                      const Text(
                        "Congratulations! You guessed Right",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ] else ...[
                      const Icon(
                        Icons.cancel,
                        color: Colors.red,
                        size: 40,
                      ),
                      const Text(
                        "Oops! You guessed Wrong",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ]
                  ]
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
