import 'package:flutter/material.dart';
import 'package:flutter_search_procces/core/api/api_connection.dart';
import 'package:flutter_search_procces/core/model/people_model.dart';
import 'package:flutter_search_procces/ui/widgets/search_delegate.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var apiConnection = ApiConnection();

  List<Data> peopleList = [];

  @override
  void initState() {
    super.initState();
    getPeopleList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              _showFilterList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: peopleList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Image.network(peopleList[index].avatar!),
                      ),
                      title: Text(
                        peopleList[index].firstName.toString(),
                      ),
                      subtitle: Text(
                        peopleList[index].lastName.toString(),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 2,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showFilterList() {
    showSearch(
        context: context,
        delegate: CostumeSearchDelegate(peopleList: peopleList));
  }

  Future<void> getPeopleList() async {
    peopleList = await apiConnection.getPeopleData();
    setState(() {});
  }
}
