library steps;

import 'package:flutter/material.dart';

class Steps extends StatelessWidget {
  final Axis direction;
  final List steps;
  final double size;
  final Map path;
  Steps({
    Key key,
    this.direction = Axis.vertical,
    @required this.steps,
    this.size = 21,
    @required this.path,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: direction,
      itemCount: steps.length,
      itemBuilder: (context, position) => Stack(
        children: <Widget>[
          Positioned(
            top:
                direction == Axis.horizontal ? 16 + size * 2.14 / 2 - 5 / 2 : 0,
            bottom: direction == Axis.horizontal ? null : 0,
            left:
                direction == Axis.horizontal ? 0 : 16 + size * 2.14 / 2 - 5 / 2,
            right: direction == Axis.horizontal ? 0 : null,
            height: direction == Axis.horizontal ? path['width'] : null,
            width: direction == Axis.horizontal ? null : path['width'],
            child: Container(
              color: path['color'],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Text(
                    steps[position]['label'],
                    style: TextStyle(
                      color: steps[position]['color'],
                      fontSize: size,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  padding: EdgeInsets.all(6),
                  width: size * 2.14,
                  height: size * 2.14,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: steps[position]['background'],
                    borderRadius: BorderRadius.circular(size * 2.14),
                  ),
                ),
                steps[position]['content'] != null
                    ? direction == Axis.horizontal
                        ? Padding(
                            padding: EdgeInsets.only(top: size * 2.14),
                            child: steps[position]['content'],
                          )
                        : Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: size * 2.14),
                              child: steps[position]['content'],
                            ),
                          )
                    : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
