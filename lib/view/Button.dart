// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:jaewoo/viewmodel/practice.dart/';
//
// class Button extends HookConsumerWidget {
//   const Button({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return MaterialApp(
//       home: SafeArea(
//           child: Scaffold(
//             body: Column(
//               children: [
//                 FloatingActionButton(
//                   onPressed: () =>
//                   ref
//                       .read(counterProvider.state)
//                       .state++, child: Text("button"),),
//                 FloatingActionButton(onPressed: () =>
//                 ref
//                     .read(counterProvider.state)
//                     .state * 2, child : Text('double')),
//                 FloatingActionButton(onPressed: () => ref.read(counterProvider.state).state-1 , child: Text('minus'))
//               ],
//             ),
//           )),
//     );
//   }
// }
