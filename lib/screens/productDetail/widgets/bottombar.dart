import 'package:flutter/material.dart';
import 'package:wave/constants/colors.dart';
import 'package:wave/utils/responsive.dart';
import 'package:wave/utils/widgethelpers.dart';

class BottomBarProductDetail extends StatefulWidget {
  const BottomBarProductDetail(
      {Key? key, required this.price, required this.mrp})
      : super(key: key);
  final double price;
  final double mrp;
  @override
  _BottomBarProductDetailState createState() => _BottomBarProductDetailState();
}

class _BottomBarProductDetailState extends State<BottomBarProductDetail> {
  @override
  Widget build(BuildContext detailBottombarCtx) {
    return Container(
      height: isLandscape(detailBottombarCtx) ? 100 : 60,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: textGreyColor, width: 0.2)),
        color: Colors.white,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 2),
          child: Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              responsiveText(
                  text: formatnumber(widget.price),
                  style: const TextStyle(
                    fontSize: 26,
                    fontFamily: 'porReg',
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                width: 10,
              ),
              responsiveText(
                  text: formatnumber(widget.mrp),
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 14,
                      color: textGreyColor,
                      fontFamily: 'popReg')),
              const Spacer(),
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black)),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text('Buy Now'),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
