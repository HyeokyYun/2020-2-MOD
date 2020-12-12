import 'package:flutter/material.dart';

class OptionTile extends StatefulWidget {
  final String option, description, correctAnswer, optionSelected;
  OptionTile({@required this.option, @required this.description, @required this.correctAnswer, @required this.optionSelected});
  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(
                  color: widget.description == widget.optionSelected
                      ? widget.optionSelected == widget.correctAnswer
                      ? Colors.green : Colors.red : Colors.grey, width: 1.5),
                  borderRadius: BorderRadius.circular(30)
              ),
            alignment: Alignment.center,
            child: Text("${widget.option}", style: TextStyle(
              color: widget.optionSelected == widget.description
                  ? widget.correctAnswer == widget.optionSelected
                  ? Colors.green : Colors.red : Colors.grey,
            ),),
          ),
          SizedBox(width: 10,),
          Text(widget.description, style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),)
        ],
      ),
    );
  }
}
