import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


void main() => runApp(ProviderScope(child: MyApp()));

//1. 프로바이더에서 데이터 값 저장.
//provider에 현재 전역으로 String 변수 선언
final TextProvider = StateProvider<String>((ref) { return'';
});

//2. 프로바이더의 데이터값을 저장한 것을 위젯에 쏴주기.
//3. 프로바이더의 데이터 쏴준것을 화면에 띄워주기.

class DataClass extends ChangeNotifier{
 String textchanged = "";

  void sendText(String text){
    textchanged = text;
    notifyListeners();
  }
}

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
    return Form(
        child: Column(children: <Widget>[
          // 전역변수에 적힌 문자를 읽어서 전역 변수에 저장
          TextFormField(onChanged:(String){ref.read(TextProvider);}),
          // 버튼을 누르면 전역변수에 저장된 문자를 화면에 보여주는 버튼
          ElevatedButton(onPressed: () {}, child:  Text('data')),
          const TextResponse(),
        ]));
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
