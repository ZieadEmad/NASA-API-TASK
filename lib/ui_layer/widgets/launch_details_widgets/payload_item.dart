import 'package:flutter/material.dart';
class PayloadItem extends StatelessWidget {
   PayloadItem({
    Key? key,
    required this.payloadName,
    required this.payloadType
  }) : super(key: key);
  String payloadName;
  String payloadType;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Payload Name : '),
                Expanded(
                    child: Text(
                      payloadName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    )),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text('Payload Type : '),
                Expanded(
                    child: Text(
                     payloadType,
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
