import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jaewoo/view/http.dart';

void main() => runApp(ProviderScope(child: MyApp()));
// //Todo 일반적인 todo를 관리할땐 controller로 관리하는데 내가 하고싶은것은 전역 객체의 변수에 값을 저장해서 버튼을 누르면 변수의 저장된 값을 보여주는 것; counter예제와 todo예제를 응용하자.
//1. 프로바이더에서 데이터 값 저장.
//provider에 현재 전역으로 String 변수 선언

final TextProvider = StateProvider<String>((ref) => 'example');
// final TextProvider = StateProvider<>((ref) {
//
// });

//2. 프로바이더의 데이터값을 저장한 것을 위젯에 쏴주기.
//3. 프로바이더의 데이터 쏴준것을 화면에 띄워주기.

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      home: TextSend(),
    );
  }
}

class TextSend extends HookConsumerWidget {
  const TextSend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(title: Text('text')),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //빈칸 생성
                Container(
                  child: Text('asd'),
                ),
                //1.  버튼을 누르면 텍스트를 입력할 칸을 만든다.
                FloatingActionButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: TextField(
                                onChanged: (value) {
                                  //onchanged에 값을 value로 받는거 확인
                                  print(value);
                                  //alertdialog에 엔터활성화
                                },
                              ),
                            );
                          });
                    },
                    child: Text('add'))

                //3. 버튼을 누르고 나면 보여줄 리스트를 아래쪽에 정렬한다.
                //ListView생성
              ]),
        ));
  }
}

//todo : todolist 만들기
// textField 생성

// stateless -> ConsumerWidget
// statefullWidget -> ConsumerStatefulWidget
//HookWidget은 -> HookConsumerWidget = ConsumerWidget(stateless) + HookWidget
// hookConsumer = stateless + hookwidget
