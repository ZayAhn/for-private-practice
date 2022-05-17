import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() => runApp(MyApp());


class MyApp extends HookConsumerWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('practice'),
        ),
        body: const TextForm());
  }
}

//Text를 입력할 위젯
class TextForm extends HookConsumerWidget {
  const TextForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextData = useState('');
    return Form(
        child: Column(children: <Widget>[
          TextFormField(onChanged:(value) {TextData.value = value;}),
          ElevatedButton(onPressed: () {print(TextData.value);}, child:  Text('data')),
          const TextResponse(),
        ]));;
  }
}


//todo TextData를 아래쪽 TextResponsc에서 받아서 보여줘야함.
//텍스트 받아줄 위젯
class TextResponse extends StatefulWidget {
  const TextResponse({Key? key}) : super(key: key);

  @override
  State<TextResponse> createState() => _TextResponseState();
}

class _TextResponseState extends State<TextResponse> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
