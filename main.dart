import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

void main() {
  runApp(
      //1
      MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CounterProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //2
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selector Example'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 3 Selector listens only to the `count` property
            Selector<CounterProvider, int>(
              selector: (context, provider) => provider.getCount,
              builder: (context, getCount, child) {
                print('Counter widget rebuild');
                //retun widget to display data
                return Text(
                  'Value 1(Selctor): $getCount',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                );
              },
            ),

            // 4 Consumer
            Consumer<CounterProvider>(
              builder: (context, value, child) {
                print('Counter widget rebuild');
                //retun widget to display data
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Value 2(Consumer): ${value.getCount} ',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //4 read data from the class and set new data
                context.read<CounterProvider>().increment();
              },
              style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Colors.black),
                  backgroundColor: WidgetStatePropertyAll(Colors.blue)),
              child: const Text(
                'Decrement',
                style: TextStyle(fontSize: 23),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> people = <String>['Neo', 'Thabo', 'Ken'];
