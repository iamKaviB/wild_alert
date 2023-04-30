
import 'package:flutter/material.dart';
import 'package:pharma/config/AppConfig.dart';
import '../data/Const.dart';
import 'avatar_image.dart';

class PrescriptionItemWidget extends StatelessWidget {
  const PrescriptionItemWidget(this.prescriptionData, { Key? key, this.onTap}) : super(key: key);
  final prescriptionData;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarImage(
                  prescriptionData['image'] == null ? Const().TEXT_PRESCRIPTION_IMAGE : prescriptionData['image'],
                  radius: 10,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: 
                  Container(
                    child:
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: Text(prescriptionData['name'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, color: AppColor.secondary, fontWeight: FontWeight.w700))
                                )
                              ),
                              SizedBox(width: 5),
                              Container(
                                child: Icon(Icons.save_alt_rounded, size: 10, color: AppColor.third,)
                              ),
                              SizedBox(width: 3),
                              Container(
                                child: Text(prescriptionData['date'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11, color: Colors.grey))
                              )
                            ],
                          ),
                          SizedBox(height: 3,),
                          Row(
                            children: <Widget>[
                              Container(
                                child: Text(prescriptionData['prescriptionTitle'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 13, color: AppColor.third))
                              ),
                            ],
                          ),
                          SizedBox(height: 6,),
                          Row(
                            children: <Widget>[
                              Expanded(child: Text(prescriptionData['drugList'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 13))),
                            ],
                          ),
                        ],
                      )
                  )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}