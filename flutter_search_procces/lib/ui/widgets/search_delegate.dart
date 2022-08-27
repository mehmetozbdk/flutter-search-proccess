import 'package:flutter/material.dart';
import 'package:flutter_search_procces/core/model/people_model.dart';

class CostumeSearchDelegate extends SearchDelegate {
  List<Data> peopleList;

  CostumeSearchDelegate({
    required this.peopleList,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios_new),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    /// arama sonucu listesi
    List filtreList = [];

    /// Burda kullanıcı tarafından girilen query degeri listenin firstName'nin içinde varsa
    /// ilk harfleri işit ise ve boyutu 1'den buyuk ise o listenin elemanlarını ekrana listeler
    for (var element in peopleList) {
      if (element.firstName!.toLowerCase().contains(query.toLowerCase())) {
        if (query[0].toLowerCase() == element.firstName![0].toLowerCase() &&
            query.length > 1) {
          filtreList.add(element);
        }
      }
    }

    /// Eğer bos degılse true boş ise false
    return filtreList.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: filtreList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Image.network(filtreList[index].avatar!),
                  ),
                  title: Text(
                    filtreList[index].firstName.toString(),
                  ),
                  subtitle: Text(
                    filtreList[index].lastName.toString(),
                  ),
                ),
              );
            },
          )
        : const Center(
            child: Text('Sonuç bulnumadı'),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
