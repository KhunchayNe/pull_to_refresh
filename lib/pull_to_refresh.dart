import 'package:flutter/material.dart';

class PullToRefresh extends StatefulWidget {
  const PullToRefresh({super.key});

  @override
  State<PullToRefresh> createState() => _PullToRefreshState();
}

class _PullToRefreshState extends State<PullToRefresh> {
  List<String> items =
      List<String>.generate(20, (index) => 'Item ${index + 1}');

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      items =
          List<String>.generate(20, (index) => 'Refreshed Item ${index + 1}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pull to Refresh'),
      ),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.deepPurple,
        onRefresh: _refresh,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),
      ),
    );
  }
}
