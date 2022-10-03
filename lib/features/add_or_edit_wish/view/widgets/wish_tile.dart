import 'package:flutter/material.dart';
import 'package:twenty_four_online_interview_test/features/home/models/wish_model.dart';

class WishTile extends StatelessWidget {
  const WishTile({
    Key? key,
    required this.wish,
    required this.onTap,
  }) : super(key: key);

  final WishModel wish;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade200,
            Colors.green.shade200,
          ],
        ),
        boxShadow: kElevationToShadow[4],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: ListTile(
          title: Text(wish.title),
          dense: false,
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(wish.date.toString().split('.')[0].replaceAll(' ', '   ')),
          ),
          trailing: const Icon(Icons.edit_rounded),
          onTap: onTap,
        ),
      ),
    );
  }
}
