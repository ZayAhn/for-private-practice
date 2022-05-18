import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() => runApp(ProviderScope(child: MyApp()));
//Todo 일반적인 todo를 관리할땐 controller로 관리하는데 내가 하고싶은것은 전역 객체의 변수에 값을 저장해서 버튼을 누르면 변수의 저장된 값을 보여주는 것; counter예제와 todo예제를 응용하자.
//1. 프로바이더에서 데이터 값 저장.
//provider에 현재 전역으로 String 변수 선언

final TextProvider = Provider((ref) => ChangeNotifier());

//2. 프로바이더의 데이터값을 저장한 것을 위젯에 쏴주기.
//3. 프로바이더의 데이터 쏴준것을 화면에 띄워주기.



class MyApp extends HookConsumerWidget {
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
    final reader = ref.watch(TextProvider);
    // todo : 오류 The argument type 'ChangeNotifierProvider<DataClass>' can't be assigned to the parameter type 'ProviderListenable<List<Texts>>'.
    // todo : 위의 오류 는 매개변수의 정적 유형에 할당 할 수없을때 오류가 생김
    return Form(
        child: Column(children: <Widget>[
      // 전역변수에 적힌 문자를 읽어서 전역 변수에 저장 provider의 값을 읽어와야함?
      TextFormField(onChanged: (ref){ref;},),
      // 버튼을 누르면 전역변수에 저장된 문자를 화면에 보여주는 버튼
      ElevatedButton(onPressed: () {}, child: Text('change data')),
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
    return Container(child: Text('$TextForm'));
  }
}
