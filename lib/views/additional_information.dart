import 'package:flutter/cupertino.dart';

TextStyle titleFont =
    const TextStyle(
        fontWeight: FontWeight.w600, fontSize: 18.0, color: Color(0xFFFFFFFF)
    );

TextStyle infoFont =
const TextStyle(
  fontWeight: FontWeight.w400, fontSize: 18.0, color: Color(0xFFFFFFFF)
);
Widget additionalInformation(
    String wind, String humidity, String pressure, String feels_like) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ветер",
                  style:titleFont
                ),
                SizedBox(
                  height: 18.0,
                ),
                Text(
                  "Давление",
                  style: titleFont,
                ),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "$wind",
                    style:infoFont
                ),
                SizedBox(
                  height: 18.0,
                ),
                Text(
                  "$pressure",
                  style: infoFont,
                ),
              ],
            ),


            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Влажность",
                    style:titleFont
                ),
                SizedBox(
                  height: 18.0,
                ),
                Text(
                  "Ощущение",
                  style: titleFont,
                ),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "$humidity",
                    style:infoFont
                ),
                SizedBox(
                  height: 18.0,
                ),
                Text(
                  "$feels_like",
                  style: infoFont,
                ),
              ],
            ),

          ],
        )
      ],
    ),
  );
}
