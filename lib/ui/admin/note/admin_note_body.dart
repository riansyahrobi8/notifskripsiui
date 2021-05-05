import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:notifskripsiui/models/data_model.dart';
import 'package:notifskripsiui/ui/note/detail/detail_note_screen.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class AdminNoteBody extends StatelessWidget {
  final DateFormat dateFormat = DateFormat.yMMMMd();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(24.0),
          ),
          ...List.generate(
              dataAtNote.length,
              (index) => Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    secondaryActions: <Widget>[
                      GestureDetector(
                        onTap: () => print("Ubah"),
                        child: Container(
                          padding: EdgeInsets.all(24.0),
                          decoration: BoxDecoration(
                              color: primaryColor, shape: BoxShape.circle),
                          child: Icon(Icons.edit_rounded, color: Colors.white),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => print("Hapus"),
                        child: Container(
                          padding: EdgeInsets.all(24.0),
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: Icon(
                            Icons.delete_forever_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                    child: buildItemContainer(
                        context,
                        dataAtNote[index].dateTime,
                        dataAtNote[index].titleNote,
                        dataAtNote[index].notes,
                        dataAtNote[index].notes2),
                  ))
        ],
      ),
    );
  }

  GestureDetector buildItemContainer(BuildContext context, DateTime dateTime,
      String titleNote, List notes1, List notes2) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (_) => DetailNoteScreen(
                      dateTime: dateTime,
                      titleNote: titleNote,
                      notes: notes1,
                      notes2: notes2,
                    )));
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            left: getProportionateScreenWidth(24.0),
            right: getProportionateScreenWidth(24.0),
            bottom: getProportionateScreenWidth(16.0)),
        decoration: BoxDecoration(
            color: textFieldAndCardColor,
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(24.0))),
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(24.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                dateFormat.format(dateTime),
                maxLines: 1,
                style: TextStyle(color: textColor2, fontSize: 14.0),
              ),
              SizedBox(
                height: getProportionateScreenHeight(4.0),
              ),
              Text(
                titleNote,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor1,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(16.0),
              ),
              Text(
                "1. ${notes1[0]}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: textColor2, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
