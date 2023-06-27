import 'package:flutter/material.dart';
import 'package:eqipped_test/brands/custom_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Animation for Image Loading',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: const [
              CustomImage(
                  imageURL:
                      'https://images.unsplash.com/photo-1611558709798-e009c8fd7706?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80'),
              CustomImage(
                  imageURL:
                      'https://images.unsplash.com/photo-1601288496920-b6154fe3626a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80'),
              CustomImage(
                  imageURL:
                      'https://images.unsplash.com/photo-1507114845806-0347f6150324?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80'),
              CustomImage(
                  imageURL:
                      'https://images.unsplash.com/photo-1606893995103-a431bce9c219?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80'),
              CustomImage(
                  imageURL:
                      'https://images.unsplash.com/photo-1642802767829-bea7b5a6c15f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80'),
              CustomImage(
                  imageURL:
                      'https://images.unsplash.com/photo-1512850692650-c382e34f7fb2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80'),
              CustomImage(
                  imageURL:
                      'https://images.unsplash.com/photo-1617079098163-43d49057277d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80'),
              CustomImage(
                  imageURL:
                      'https://images.unsplash.com/photo-1622347434466-147a44cffda7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80'),
              CustomImage(
                  imageURL:
                      'https://images.unsplash.com/photo-1625698457101-fec2f565a8f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80'),
              CustomImage(
                  imageURL:
                      'https://images.unsplash.com/photo-1654797314248-c41c8a8cf35b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80'),
            ],
          ),
        ),
      ),
    );
  }
}

