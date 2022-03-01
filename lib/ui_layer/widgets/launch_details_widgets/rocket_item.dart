import 'package:flutter/material.dart';

class RocketItem extends StatelessWidget {
   RocketItem({
    Key? key,
    required this.rocketName,
    required this.rocketType,
  }) : super(key: key);
  String rocketName;
  String rocketType;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Rocket Name : '),
                Expanded(
                    child: Text(
                      rocketName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    )),
              ],
            ),
          const  SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text('Rocket Type : '),
                Expanded(
                    child: Text(
                     rocketType,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
