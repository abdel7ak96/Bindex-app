import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

/// * Dummy data
/// TODO Delete after Firebase integration
final items = [
  {
    'photo_url': 'assets/images/temp/profile_picture.jpg',
    'name': 'Michael Philips',
    'message':
        'It\'s the one week of the year in which you get the chance to take a tour over all the premise'
  },
  {
    'photo_url': 'assets/images/temp/profile_picture.jpg',
    'name': 'Sophie Vergas',
    'message':
        'Healthy, robust, contracting, and contracting like a lung'
  },
  {
    'photo_url': 'assets/images/temp/profile_picture.jpg',
    'name': 'Jolenne Wright',
    'message':
        'A wonderful serenity has taken possession of my entire soul, like...'
  },
  {
    'photo_url': 'assets/images/temp/profile_picture.jpg',
    'name': 'Melanie Ford',
    'message':
        'Speaking of which, Peter really wants you to come in on Friday'
  },
];

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            children: [
              const ListTile(
                tileColor: Colors.white,
                title: Text('Messages',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              ),
              Divider(color: Colors.grey.shade200, height: 0, thickness: 2),
            ],
          );
        } else {
          return MessageListTile(
              avatarPicture:
                  AssetImage(items[index - 1]['photo_url']!),
              name: items[index - 1]['name']!,
              message:
                  items[index - 1]['message']!);
        }
      },
    );
  }
}

class MessageListTile extends StatelessWidget {
  const MessageListTile(
      {Key? key, this.avatarPicture, this.name = '', this.message = ''})
      : super(key: key);

  final ImageProvider? avatarPicture;
  final String name;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: avatarPicture,
            radius: 24.0,
          ),
          title: Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
          subtitle: Text(
            message,
            style: const TextStyle(color: Colors.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          tileColor: Colors.white,
          contentPadding: const EdgeInsets.all(12.0),
          onTap: () {},
        ),
        Divider(color: Colors.grey.shade100, height: 0, thickness: 2),
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