import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notifskripsiui/models/data_model.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';
import 'package:notifskripsiui/utils/constanta_strings.dart';
import 'package:notifskripsiui/utils/size_config.dart';

class AdminUserBody extends StatefulWidget {
  const AdminUserBody({
    Key key,
  }) : super(key: key);

  @override
  _AdminUserBodyState createState() => _AdminUserBodyState();
}

class _AdminUserBodyState extends State<AdminUserBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(24.0),
            getProportionateScreenWidth(8.0),
            getProportionateScreenWidth(24.0),
            getProportionateScreenWidth(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
                dataUsers.length,
                (index) => Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      secondaryActions: <Widget>[
                        GestureDetector(
                          onTap: () => showDialog(
                              context: context,
                              builder: (_) => buildAlertDialog()),
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: Icon(
                              Icons.delete_forever_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                      child: buildItemUser(dataUsers[index].name,
                          dataUsers[index].noid, dataUsers[index].type),
                    )),
          ],
        ),
      ),
    );
  }

  AlertDialog buildAlertDialog() {
    return AlertDialog(
      title: Center(
          child: Container(
        padding: EdgeInsets.all(8.0),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.red[100]),
        child: Icon(
          Icons.delete_forever_rounded,
          color: Colors.red,
        ),
      )),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            titleDialogDelete,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: backgroundColor),
          ),
          SizedBox(height: getProportionateScreenWidth(16.0)),
          Text(
            subtitleDialogDelete,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.0, color: textColor2),
          ),
          SizedBox(height: getProportionateScreenWidth(56.0)),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    elevation: 0.0,
                    visualDensity: VisualDensity.compact,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000.0)),
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(20.0),
                    ),
                    child: Center(
                      child: Text(
                        cancel,
                        style: TextStyle(color: primaryColor, fontSize: 14.0),
                      ),
                    )),
              ),
              SizedBox(
                width: getProportionateScreenWidth(8.0),
              ),
              Flexible(
                flex: 1,
                child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Pengguna berhasil dihapus",
                          style: TextStyle(
                              color: textColor1, fontFamily: "Poppins"),
                        ),
                      ));
                    },
                    color: accentColor,
                    elevation: 0.0,
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000.0)),
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(20.0),
                    ),
                    child: Center(
                      child: Text(
                        yes,
                        style: TextStyle(color: textColor1, fontSize: 14.0),
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildItemUser(String name, String noid, String type) {
    return Container(
      margin: EdgeInsets.only(bottom: getProportionateScreenWidth(36.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(color: textColor1, fontSize: 18.0),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(2.0),
                ),
                Text(
                  noid,
                  style: TextStyle(color: textColor2, fontSize: 12.0),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16.0),
                vertical: getProportionateScreenWidth(8.0)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000.0),
                color: accentColor),
            child: Text(
              type,
              style: TextStyle(fontSize: 12.0, color: textColor1),
            ),
          )
        ],
      ),
    );
  }
}
