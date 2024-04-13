import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PublishPage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();

  Future<void> _publish(BuildContext context) async {
    final String token = ''; // 获取用户 token，可以通过 Provider 管理状态或其他方式获取
    final String title = titleController.text;

    final response = await http.post(
      Uri.parse('http://your-api-url/douyin/publish/action/'),
      body: {
        'token': token,
        'title': title,
      },
    );

    if (response.statusCode == 200) {
      // 处理成功发布的逻辑
    } else {
      // 处理失败的逻辑
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('投稿')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: titleController, decoration: InputDecoration(labelText: '标题')),
            SizedBox(height: 16.0),
            ElevatedButton(onPressed: () => _publish(context), child: Text('发布')),
          ],
        ),
      ),
    );
  }
}