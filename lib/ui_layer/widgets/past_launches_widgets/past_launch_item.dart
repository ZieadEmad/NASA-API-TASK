import 'package:flutter/material.dart';
import 'package:mega_task/ui_layer/helpers/text_trim/text_trim.dart';
import 'package:mega_task/ui_layer/shared_widgets/image_place_holder/image_place_holder.dart';

class PastLaunchItem extends StatelessWidget {
   PastLaunchItem({
    Key? key,
    required this.imagePath,
    required this.details,
    required this.date,
  }) : super(key: key);
  String imagePath ;
  String details ;
  String date ;
  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              //color: Colors.red,
              child: ImagePlaceHolder(imagePath.toString()),
            ),
            SizedBox(width: MediaQuery.of(context).size.width/20,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(details.toString(),maxLines: 3,overflow:TextOverflow.ellipsis,softWrap: true,),
                 const SizedBox(height: 8,),
                  Text(textTrim(10, date.toString()),maxLines: 1,overflow:TextOverflow.ellipsis,softWrap: true,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
