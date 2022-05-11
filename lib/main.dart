//--- 1. material import 해오기
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';

// riverpod, hooks를 적용

// 1. ui 적 요소
// 1-1. 우선 hello 띄우기(riverpod으로 적용)

// final hello = Provider((_) => "hello");
//
// //--- 2. void main 함수 MyApp 연결하기
// void main() => runApp(ProviderScope(child: const MyApp()));
//
// class MyApp extends HookConsumerWidget {
//   const MyApp({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text('data'),
//           ),
//           body: Main()),
//     );
//   }
// }
//
// // --- 3. MyApp widget (HooksconsumerWidget)
// class Main extends HookConsumerWidget {
//   const Main({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final String value = ref.watch(hello);
//     return Scaffold(
//         body: ListView(children: <Widget>[
//       Container(
//         height: 200,
//         color: Colors.deepOrange,
//         child: ListView(
//           scrollDirection: Axis.horizontal,
//           children: <Widget>[
//             ...test5ImageWidgetForListView(count: 10, height: 200)
//           ],
//         ),
//       ),
//       ...test5ImageWidgetForListView(count: 20, height: 200)
//     ], scrollDirection: Axis.vertical));
//   }
// }
//
// List<dynamic> test5ImageWidgetForListView(
//     {int count = 5,
//     double width = 200,
//     double height = 100,
//     double margin_h = 20.0,
//     double margin_v: 20.0}) {
//   List list = [];
//   for (var i = 0; i < count; i++) {
//     list.add(
//       Container(
//         height: height,
//         margin: EdgeInsets.symmetric(horizontal: margin_h, vertical: margin_v),
//         // color: Colors.deepPurple,
//         child: i % 2 == 0
//             ? Image.network(
//                 'https://picsum.photos/seed/picsum/200/300',
//                 scale: 2,
//               )
//             : Image.network(
//                 'https://picsum.photos/200/300',
//                 scale: 2,
//               ),
//       ),
//     );
//   }
//   return list;
// }

// 2-1. 화면 분할(app bar, list, Main)
//2-1-1 app bar구성
//2-1-2 list구성
//2-1-3 main구성
// 2. data 적 요소
//  1. 데이터를 받아온다.
// 어떻게 받아올지??
//  2. 데이터를 받아온것을 확인한다.
// 어떻게 확인할지??
//  3. 데이터 받아온것을 확인하면 넘겨준다.
// 어떤 방식으로 넘겨줄지??
//  4. 데이터를 화면 띄운다.
// 넘겨준것을 어떤식으로 받을지??

// 1. TabBar 생성

// 2. 카테고리 지정 및 누를 때마다 다른 화면 보이게 하기
// 3. appbar 아래쪽에 tabbar 생성 및 위로 스크롤 했을때 tapbar는 sticky appbar는 사라지게 생성


// 1. 버튼 2개 만든다 => + , -
// 2. 버튼 2개 각각 Counter안에 있는 setter를 각각 연결한다.
// 3. 컨슈머(provider 값을 가져오기 위해 ) 사용
// 4. state 화면에 띄우기
// 5. 버튼 눌러보자!!
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//     );
//   }
// }

void main() {
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

/// Providers are declared globally and specify how to create a state
final counterProvider = StateProvider((ref) {
  int number=0;
  int getter(){
    return number;
  }
  setter_increse(){
    int _number=number;
    return _number;
  }
  return number;
});

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter example')),
      body: Center(
        // Consumer is a widget that allows you reading providers.
        child: Consumer(builder: (context, ref, _) {
          print(ref.watch(apiDataProvider.notifier));
          final count = ref.watch(counterProvider.state).state;
          return Text('$count');
        }),
      ),
      floatingActionButton: FloatingActionButton(
        // The read method is a utility to read a provider without listening to it
        onPressed: () => ref.read(counterProvider.state).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// 1. 뷰만들기
// 2. viewmodel : 데이터를 받아오는 로직
// 3. 모델 데이터 : 타입지정

class ApiConnect extends StateNotifier {
  ApiConnect() : super([]);

  void connect(/*{required String post}*/) async {
    print('1');
    //디오 선언
    final dio = Dio();
    // 디오로 데이터 받아온거 변수 선언
    final data = await dio.get("https://jsonplaceholder.typicode.com/posts");
    //
    final responseData = data.data;
    state = [...responseData];
  }
}

final apiDataProvider = StateNotifierProvider((ref) => ApiConnect());


