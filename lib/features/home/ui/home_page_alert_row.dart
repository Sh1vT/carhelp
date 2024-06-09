import 'package:flutter/material.dart';

class HomePageAlertRow extends StatelessWidget {
  String fieldName = "";
  String fieldValue = "";
  HomePageAlertRow(
      {super.key, required this.fieldName, required this.fieldValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0,0,2,0),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                Text(
                  fieldName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Text(
                  fieldValue,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 1),
            height: 1,
            color: Colors.grey[700],
          )
        ],
      ),
    );
  }
}
