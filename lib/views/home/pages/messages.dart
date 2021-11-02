// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            color: Colors.white,
            padding: EdgeInsets.all(18.0),
            child: Text('Messages',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))),
        Divider(color: Colors.grey.shade200, height: 0, thickness: 2),
        ListTile(
          leading: CircleAvatar(
            backgroundImage:
                AssetImage('assets/images/temp/profile_picture.jpg'),
            radius: 24.0,
          ),
          title: Text('Michael Philips', style: TextStyle(fontWeight: FontWeight.w500)),
          subtitle: Text(
            'It\'s the one week of the year in which you get the chance to take a tour over all the premise', style: TextStyle(color: Colors.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          tileColor: Colors.white,
          contentPadding: EdgeInsets.all(12.0),
          onTap: () {},
        )
      ],
    );
  }
}

/**
 * * My custom built Message Tile
 * ! Deprecated in favor of the ListTile
 * TODO : Delete in case ListTile prove to be sufficient
 */
/*class MessageTile extends StatelessWidget {
  const MessageTile(
      {Key? key, this.avatarPhoto, this.name = '', this.message = ''})
      : super(key: key);

  final ImageProvider? avatarPhoto;
  final String name;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(14.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 26.0,
                  backgroundImage: avatarPhoto,
                ),
                SizedBox(width: 14.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18.0),
                      ),
                      Text(message,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/