import 'package:flutter/material.dart';
import 'package:wave/constants/colors.dart';
import 'package:wave/screens/productDetail/widgets/bottombar.dart';
import 'package:wave/screens/productDetail/widgets/detailimage.dart';

import 'package:wave/utils/responsive.dart';
import 'package:wave/utils/widgethelpers.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool favorite = false;
  int _activeSize = 0;
  List<Color> allcolors = [wblue, wpink, wyellow, wlgreen];
  List<String> image = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png'
  ];
  late Color _activeColor = allcolors[0];
  void _handleFav() {
    setState(() {
      favorite = !favorite;
    });
  }

  void _handlecolor(index) {
    setState(() {
      _activeColor = allcolors[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBarProductDetail(
        price: 14.99,
        mrp: 20.00,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Stack(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            width: double.infinity,
            height: screenHeight(context) * 0.5,
            child: Productdetailimage(images: image),
          ),

          // ignore: sized_box_for_whitespace
          Container(
            height: screenHeight(context) * 0.5,
            width: double.infinity,
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white)),
                              onPressed: () {},
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ))),
                      Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                              alignment: Alignment.center,
                              onPressed: () {
                                _handleFav();
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: favorite
                                    ? heartEnableColor
                                    : heartDisableColor,
                              )))
                    ],
                  ),
                ],
              ),
            )),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: screenHeight(context) * 0.45),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: Container(
                      width: screenWidth(context) / 3,
                      height: 7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: bottomSheetDragColor),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  responsiveText(
                    text: 'Blue Moon Earings',
                    style: const TextStyle(
                        fontSize: 23,
                        fontFamily: 'popReg',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      responsiveText(
                          text: 'by',
                          style: TextStyle(fontSize: 15, color: textGreyColor)),
                      const SizedBox(
                        width: 10,
                      ),
                      responsiveText(
                          text: 'Kuberlo',
                          style: TextStyle(
                              fontSize: 15,
                              color: textGreyColor,
                              fontWeight: FontWeight.bold)),
                      const Spacer(),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          child: OutlinedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    side: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(30),
                                  )),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white)),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Trending',
                                      style: TextStyle(color: wBlack),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 15,
                                      width: 10,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/images/trendfire.png'))),
                                    )
                                  ],
                                ),
                              ))),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: const Text(
                      'Gold-Toned Circular Earrings, gold-plated, and has kundan. Secured with a post and back. This earrings is suitable ',
                      textAlign: TextAlign.start,
                      style: TextStyle(wordSpacing: -1),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  responsiveText(
                      text: 'Select Size',
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(
                              width: 40, height: 40),
                          child: OutlinedButton(
                            child: Text(
                              (index + 1).toString(),
                              style: const TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              setState(() {
                                _activeSize = _activeSize == index ? 0 : index;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                side: BorderSide(
                                    color: _activeSize == index
                                        ? textGreyColor
                                        : textGreyColor.withOpacity(0.2)),
                                primary: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  responsiveText(
                      text: 'Select Color',
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: List.generate(
                      allcolors.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: _activeColor == allcolors[index]
                                      ? Colors.black
                                      : Colors.white),
                              borderRadius: BorderRadius.circular(50)),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            constraints: BoxConstraints.tightFor(
                                width:
                                    _activeColor == allcolors[index] ? 20 : 30,
                                height:
                                    _activeColor == allcolors[index] ? 20 : 30),
                            child: OutlinedButton(
                              child: Container(),
                              onPressed: () {
                                _handlecolor(index);
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  primary: allcolors[index]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
