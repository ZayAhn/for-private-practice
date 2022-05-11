import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
// import 'package:jaewoo/viewmodel/practice.dart/';


final counterProvider = StateProvider((ref) => 0);

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        actions: [
          IconButton(
              onPressed: () => ref.read(counterProvider.state).state++,
              icon: Text('plus')),
          IconButton(
              onPressed: () => ref.read(counterProvider.state).state * 2,
              icon: Text('double')),
          IconButton(
              onPressed: () => ref.read(counterProvider.state).state-- print,
              icon: Text('minus'))
        ],
      ),
      body: Center(
        child: Consumer(builder: (context, ref, _) {
          final count = ref.watch(counterProvider.state).state;
          return Text('$count');
        }),
      ),
    );
  }
}
