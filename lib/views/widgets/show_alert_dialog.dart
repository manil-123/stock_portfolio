import 'package:flutter/material.dart';
import '../../config/size_config.dart';

class ShowAlertDialog extends StatelessWidget {
  final BuildContext? ctx;
  final IconData? iconData;
  final String? title;
  final String? actionTitle;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Function? takeAction;
  final bool? showCancel;

  const ShowAlertDialog(
      {Key? key,
      this.ctx,
      this.iconData,
      this.title,
      this.actionTitle,
      this.scaffoldKey,
      this.takeAction,
      this.showCancel = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Ssize(context);
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: size.getFs(60),
              backgroundColor: Colors.grey.withOpacity(0.15),
              child: Icon(
                iconData,
                size: size.getFs(48),
                color: Theme.of(context).accentColor,
              ),
            ),
            SizedBox(height: size.getH(8)),
            Text(
              '$title',
              style: TextStyle(fontSize: size.getFs(14)),
            ),
          ],
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            showCancel!
                ? MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(size.getFs(20))),
                    color: Colors.grey,
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          color: Colors.white, fontSize: size.getFs(14)),
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  )
                : SizedBox.shrink(),
            Expanded(
              flex: showCancel! ? 0 : 1,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size.getFs(20))),
                color: Theme.of(context).accentColor,
                child: Text(
                  actionTitle!,
                  style:
                      TextStyle(color: Colors.white, fontSize: size.getFs(14)),
                ),
                onPressed: () async {
                  await takeAction!();
                },
              ),
            )
          ],
        ));
  }
}
