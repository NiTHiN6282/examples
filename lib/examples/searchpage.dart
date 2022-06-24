import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

/// This is a very simple class, used to
/// demo the `SearchPage` package
class Person {
  final String name, surname;
  final num age;

  Person(this.name, this.surname, this.age);
}


class SearchPageUi extends StatelessWidget {
  static List<Person> people = [
    Person('Mike', 'Barron', 64),
    Person('Todd', 'Black', 30),
    Person('Ahmad', 'Edwards', 55),
    Person('Anthony', 'Johnson', 67),
    Person('Annette', 'Brooks', 39),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
        actions: [
          GestureDetector(
              onTap: (){
                showSearch(
                  context: context,
                  delegate: SearchPage<Person>(
                    onQueryUpdate: (s) => print(s),
                    items: people,
                    searchLabel: 'Search people',
                    suggestion: Center(
                      child: Text('Filter people by name, surname or age'),
                    ),
                    failure: Center(
                      child: Text('No person found :('),
                    ),
                    filter: (person) => [
                      person.name,
                      person.surname,
                      person.age.toString(),
                    ],
                    builder: (person) => ListTile(
                      title: Text(person.name),
                      subtitle: Text(person.surname),
                      trailing: Text('${person.age} yo'),
                    ),
                  ),
                );
              },
              child: Icon(Icons.search))
        ],
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          final Person person = people[index];
          return ListTile(
            title: Text(person.name),
            subtitle: Text(person.surname),
            trailing: Text('${person.age} yo'),
          );
        },
      ),
    );
  }
}