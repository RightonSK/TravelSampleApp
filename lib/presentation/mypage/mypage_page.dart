import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_sample_app/presentation/mypage/mypage_model.dart';

class MyPagePage extends ConsumerWidget {
  const MyPagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myPageModel = ref.read(myPageProvider);

    return Consumer(builder: (context, watch, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('マイページ'),
          //Edit modeならEdit mode終了ボタン、そうでないのなら戻る(画面遷移)ボタン
          leading: myPageModel.isEditMode
              ? IconButton(onPressed: () {}, icon: const Icon(Icons.close))
              : IconButton(
                  onPressed: () {}, icon: const Icon(Icons.navigate_before)),
          actions: <Widget>[
            //Edit modeなら完了ボタン、そうでないのなら編集ボタン
            myPageModel.isEditMode
                ? ElevatedButton(
                    onPressed: () {},
                    child: const Text('完了'),
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  )
                : ElevatedButton(
                    onPressed: () {},
                    child: const Text('編集'),
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
          ],
        ),
        body: _createBody(),
      );
    });
  }

  Widget _createBody() {
    const double photoSize = 80;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: photoSize,
                      width: photoSize,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(photoSize / 2),
                        child: Image.network(
                            'https://freeiconshop.com/wp-content/uploads/edd/person-girl-flat.png'),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Shota',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                'フォロー 86',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'フォロワー 64',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
