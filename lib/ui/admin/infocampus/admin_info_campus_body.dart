import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:notifskripsiui/models/data_model.dart';
import 'package:notifskripsiui/ui/home/detail/detail_home_screen.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class AdminInfoCampusBody extends StatelessWidget {
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
              dataAtHome.length,
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
                    child: buildItemContainer(context, dataAtHome[index].title,
                        dataAtHome[index].desc, dataAtHome[index].dateTime),
                  ))
        ],
      ),
    );
  }

  GestureDetector buildItemContainer(
      BuildContext context, String title, String desc, DateTime dateTime) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (_) => DetailHomeScreen(
                      title: title,
                      desc: desc,
                      dateTime: dateTime,
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
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor1,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(8.0),
              ),
              Text(
                desc,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: textColor2, fontSize: 14.0),
              ),
              SizedBox(
                height: getProportionateScreenHeight(16.0),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  dateFormat.format(dateTime),
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  style: TextStyle(color: textColor2, fontSize: 14.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
