import 'package:flutter/material.dart';
import 'package:jason_parsing/service.dart';

import 'List.dart';

class JasonParse extends StatefulWidget {
  const JasonParse({Key? key}) : super(key: key);

  @override
  State<JasonParse> createState() => _JasonParseState();
}

class _JasonParseState extends State<JasonParse> {
  late List<User> _users ;
   late bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getUsers().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'List of Users'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      body: Container(
        child: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_users[index].name),
                    subtitle: Text(_users[index].email),
                  );
                },
              ),
      ),

    );
  }
}
