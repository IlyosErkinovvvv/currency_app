import 'package:currency_app/data/service/currency_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Currency App')),
      body: FutureBuilder(
        future: CurrencyService.getCurrency(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.hasError.toString()),
            );
          } else {
            // List<CurrencyModel> data = snapshot.data as List<CurrencyModel>;
            return ListView.builder(
              itemCount: (snapshot.data as List<dynamic>).length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data[index].title.toString()),
                    subtitle: Text(snapshot.data[index].code.toString()),
                    trailing: Text(snapshot.data[index].date.toString()),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
