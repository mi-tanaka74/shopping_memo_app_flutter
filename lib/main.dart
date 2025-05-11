import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // アプリ起動時にMyAppを実行
}

// アプリのルートウィジェット（テーマやホーム画面を設定）
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '買い物メモアプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShoppingListPage(), // 最初に表示する画面
    );
  }
}

// 商品リストを表示する画面
class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  final List<String> items = []; // 商品名を保存するリスト

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('買い物メモ'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: Text(items[index]),
            onTap: () {
              // 商品をタップしたら削除
              setState(() {
                items.removeAt(index);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // AddItemPage から戻ってきた商品名を受け取る
          final newItem = await Navigator.push<String>(
            context,
            MaterialPageRoute(
              builder: (context) => const AddItemPage(),
            ),
          );

          // nullや空文字でなければ追加
          if (newItem != null && newItem.isNotEmpty) {
            setState(() {
              items.add(newItem);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// 商品を追加する画面
class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final TextEditingController _controller = TextEditingController(); // 入力管理用

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('商品を追加'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: '商品名',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final text = _controller.text;
                if (text.isNotEmpty) {
                  Navigator.pop(context, text); // 入力値を戻す
                }
              },
              child: const Text('追加'),
            ),
          ],
        ),
      ),
    );
  }
}