// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _searchTextFieldValue = "";
  double _distanceSliderValue = 10.0;
  List<String> _operationsChipsList = ['Buy'];

  void setOperationsChipsList(String value, bool add) {
    setState(() {
      add
          ? _operationsChipsList.add(value)
          : _operationsChipsList.remove(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(height: 20.0),
          Container(
            padding: const EdgeInsets.only(left: 10.0, right: 15.0),
            color: Colors.white,
            child: TextField(
              onChanged: (value) {
                _searchTextFieldValue = value;
              },
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Title, Author, Owner...',
                hintStyle: TextStyle(color: Colors.black26),
                suffixIconConstraints:
                    BoxConstraints(maxHeight: 20.0, maxWidth: 20.0),
                suffixIcon: Icon(Icons.search, color: Colors.black26),
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Container(
            alignment: Alignment.topLeft,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'More Options',
                    style: TextStyle(color: Colors.black45, fontSize: 16.0),
                  ),
                ),
                const SizedBox(height: 15.0),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Distance',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('10km',
                          style:
                              TextStyle(color: Colors.black38, fontSize: 12.0)),
                      Text('200 - ∞ km',
                          style:
                              TextStyle(color: Colors.black38, fontSize: 12.0))
                    ],
                  ),
                ),
                MySlider(setValue: (value) {
                  _distanceSliderValue = value;
                }),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Operations',
                    style: TextStyle(color: Colors.black38),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyChoiceChip(
                      text: 'Buy',
                      selected: _operationsChipsList.contains('Buy'),
                      setStatus: setOperationsChipsList,
                    ),
                    const SizedBox(width: 5.0),
                    MyChoiceChip(
                      text: 'Trade',
                      selected: _operationsChipsList.contains('Trade'),
                      setStatus: setOperationsChipsList,
                    ),
                    const SizedBox(width: 5.0),
                    MyChoiceChip(
                      text: 'Borrow',
                      selected: _operationsChipsList.contains('Borrow'),
                      setStatus: setOperationsChipsList,
                    ),
                    const SizedBox(width: 5.0),
                    MyChoiceChip(
                      text: 'Free',
                      selected: _operationsChipsList.contains('Free'),
                      setStatus: setOperationsChipsList,
                    )
                  ],
                ),
                const SizedBox(height: 5.0)
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                print(_searchTextFieldValue);
                print(_distanceSliderValue);
                print(_operationsChipsList);
              },
              child: Text('Search'),
            ),
          )
        ])),
      ),
    );
  }
}

class MySlider extends StatefulWidget {
  const MySlider({Key? key, required this.setValue}) : super(key: key);

  final Function setValue;

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _value = 10.0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _value,
      min: 10.0,
      max: 210.0,
      divisions: 10,
      label: _value < 200.0 ? _value.round().toString() : '∞',
      onChanged: (newValue) {
        setState(() {
          _value = newValue;
        });
      },
      onChangeEnd: (newValue) {
        widget.setValue(newValue);
      },
    );
  }
}

class MyChoiceChip extends StatelessWidget {
  const MyChoiceChip(
      {Key? key,
      required this.text,
      required this.selected,
      required this.setStatus})
      : super(key: key);

  final String text;
  final bool selected;
  final Function setStatus;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(text),
      labelStyle: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontSize: 12.0,
          fontWeight: selected ? FontWeight.bold : null),
      selected: selected,
      backgroundColor: Colors.black12,
      selectedColor: const Color(0x00ba2981).withOpacity(1),
      onSelected: (selected) {
        setStatus(text, selected);
      },
    );
  }
}
