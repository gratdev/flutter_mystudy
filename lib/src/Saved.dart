import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SavedList extends StatefulWidget {


  SavedList({@required this.saved});
  final Set<WordPair> saved;

  @override
  _SavedListState createState() => _SavedListState();
}

class _SavedListState extends State<SavedList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test'),
        ),
        body: _buldList(),
    );
  }

  Widget _buldList(){
    return ListView.builder(
            itemCount: widget.saved.length*2,
            itemBuilder: (context,index){
              if(index.isOdd)
                return Divider();

              var realIndex = index ~/2;
              return _buildRow(widget.saved.toList()[realIndex]);

        });
  }

  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(pair.asPascalCase),
      onTap: (){
        setState(() {
        print('시작"'+widget.saved.toString());
        widget.saved.remove(pair);
        print('시작"'+widget.saved.toString());
        });
      },

    );
  }
}
