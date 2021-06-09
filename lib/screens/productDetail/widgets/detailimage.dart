import 'package:flutter/material.dart';

class Productdetailimage extends StatefulWidget {
  const Productdetailimage({Key? key, required this.images}) : super(key: key);
  final List<String> images;
  @override
  _ProductDetailImageState createState() => _ProductDetailImageState();
}

class _ProductDetailImageState extends State<Productdetailimage> {
  int currentSlider = 0;
  // ignore: unnecessary_new
  PageController pageController = new PageController(viewportFraction: 1);

  void _handlePage(int value) {
    setState(() {
      currentSlider = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
            onPageChanged: (value) {
              _handlePage(value);
            },
            controller: pageController,
            itemCount: widget.images.length,
            itemBuilder: (context, index) => Image.asset(
                  widget.images[index],
                  fit: BoxFit.cover,
                )),
        Align(
          alignment: Alignment.bottomCenter,
          // ignore: sized_box_for_whitespace
          child: Container(
            height: 100,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  widget.images.length,
                  (index) =>
                      buildDotNav(index: index, currentSlider: currentSlider)),
            ),
          ),
        )
      ],
    );
  }

  buildDotNav({int index = 0, int? currentSlider, Color color = Colors.white}) {
    return InkWell(
      onTap: () async {
        await pageController.animateToPage(
          index,
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 300),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: const EdgeInsets.only(right: 5),
        height: 6,
        width: currentSlider == index ? 24 : 6,
        decoration: BoxDecoration(
            color: currentSlider == index ? color : color.withAlpha(70),
            borderRadius: BorderRadius.circular(3)),
      ),
    );
  }
}
