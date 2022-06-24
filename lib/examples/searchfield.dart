import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class FormSearchField extends StatefulWidget {
  @override
  _FormSearchFieldState createState() => _FormSearchFieldState();
}

class _FormSearchFieldState extends State<FormSearchField> {
  final List<String> _suggestions = [
    'United States',
    'Germany',
    'Washington',
    'Paris',
    'Jakarta',
    'Australia',
    'India',
    'Czech Republic',
    'Lorem Ipsum',
  ];

  final _formKey = GlobalKey<FormState>();

  final _searchController = TextEditingController();
  final _searchController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchField(
              suggestionState: Suggestion.expand,
              suggestionAction: SuggestionAction.unfocus,
              suggestions:
              _suggestions.map((e) => SearchFieldListItem(e)).toList(),
              textInputAction: TextInputAction.next,
              controller: _searchController,
              hint: 'SearchField Example 1',
              // initialValue: SearchFieldListItem(_suggestions[2], SizedBox()),
              maxSuggestionsInViewPort: 5,
              itemHeight: 45,
              onSuggestionTap: (x) {},
            ),
          ),

          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchField(
              suggestionState: Suggestion.hidden,
              suggestionAction: SuggestionAction.next,
              suggestions:
              _suggestions.map((e) => SearchFieldListItem(e)).toList(),
              textInputAction: TextInputAction.next,
              controller: _searchController2,
              hint: 'SearchField Example 1',
              // initialValue: SearchFieldListItem(_suggestions[2], SizedBox()),
              maxSuggestionsInViewPort: 5,
              itemHeight: 45,
              onSuggestionTap: (x) {},
            ),
          ),

        ],
      ),
    );
  }
}
