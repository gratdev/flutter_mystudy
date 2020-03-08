import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'Saved.dart';
class WordList extends StatefulWidget {
  @override
  _WordListState createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  final _wordList = List<String>();

  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();

  @override
  void initState() {
    // TODO: implement initState
    _wordList.addAll([
      '1',
      '2',
      '3',
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final randomWord = WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: Text('타이틀'),
        actions :<Widget>[
          IconButton(
            icon:Icon(Icons.list),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>SavedList(saved:_saved)
                )
              );
            },
          ),

        ]
      ),
//        body : Text(_randomWord.asPascalCase),
      body: _buildList(),

//    return ListView.builder(
//        itemBuilder: (context,index){
//
//        }
    );
  }

  Widget _buildList() {
    return ListView.builder(itemBuilder: (context, index) {
      if (index.isOdd) {
        return Divider();
      }
      var realIndex = index ~/ 2;
      if (realIndex >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[realIndex]);
//          return
//            ListTile(title: Text(_suggestions[realIndex].toString()));
    });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(pair.toString()),
      trailing: Icon(alreadySaved ?Icons.favorite: Icons.favorite_border),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
          print(_saved);
        });

      });
  }
}
