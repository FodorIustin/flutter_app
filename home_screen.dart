import 'package:flutter/material.dart';
import '../common/strings.dart' as strings;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(strings.homeScreenTitle),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.paste),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: () => showDummyDialog(context),
        label: const Text('What?'),
        icon: const Icon(Icons.access_alarm),
        focusColor: Colors.blue,
        splashColor: Colors.orange,
        foregroundColor: Colors.red,
        mouseCursor: SystemMouseCursors.cell,
      ),
    );
  }

  void showDummyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext) {
        return AlertDialog(
          title: Text('Hello Darling'),
          content: Text('This is what I want'),
        );
      },
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text(query));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestions = ['Result 1', 'Result 2', 'Result 3'];
    final List<String> filteredSuggestions =
        suggestions.where((suggestion) => suggestion.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: filteredSuggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredSuggestions[index]),
          onTap: () => showResults(context),
        );
      },
    );
  }
}
