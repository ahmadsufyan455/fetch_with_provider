import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_foxes/fox_provider.dart';
import 'package:the_foxes/repository.dart';
import 'package:the_foxes/fox_provider.dart' as state;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FoxProvider(Repository()),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('The Fox'),
          ),
          body: Consumer<FoxProvider>(
            builder: (context, value, _) {
              if (value.state == state.State.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (value.state == state.State.loaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(value.fox.image, width: 250),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => value.getImage(),
                      child: const Text('Change Image'),
                    ),
                  ],
                );
              } else if (value.state == state.State.error) {
                return Center(child: Text(value.message));
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
