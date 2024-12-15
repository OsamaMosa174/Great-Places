import 'package:flutter/material.dart';
import 'package:offline_project/provider/great_places.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class MyPlace_list extends StatelessWidget {
  const MyPlace_list({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('addplace');
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    builder: (ctx, greatPlaces, ch) => greatPlaces.items.isEmpty
                        ? (ch ??
                            const Center(
                                child: Text(
                                    'No places available, start adding some!')))
                        : ListView.builder(
                            itemCount: greatPlaces.items.length,
                            itemBuilder: (ctx, i) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(greatPlaces.items[i].image),
                              ),
                              title: Text(greatPlaces.items[i].title),
                              onTap: () {},
                            ),
                          )),
      ),
    );
  }
}
