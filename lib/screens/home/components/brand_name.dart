import 'package:carousel_slider/carousel_slider.dart';
import 'package:eqipped_test/screens/home/components/section_title.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Brand_Name_Image extends StatefulWidget {
  const Brand_Name_Image({Key? key}) : super(key: key);

  @override
  State<Brand_Name_Image> createState() => _Brand_Name_ImageState();
}
class _Brand_Name_ImageState extends State<Brand_Name_Image> {
  @override
  int cureentIndex =0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(23)),
          child: SectionTitle(
            title: "Brands",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        CarouselSlider(
          options: CarouselOptions(
              aspectRatio: 8/2,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index,reason){
                setState(() {
                  cureentIndex = index;
                });
              }
          ),
          items: [

            // Image.asset(
            //   'assets/images/eqippedImg3.jpeg',
            //   width: 200, // set the width of the image
            //   height: 200, // set the height of the image
            //   fit: BoxFit.cover, // set the fit of the image
            // ),
            //

            SpecialOfferCard(
              image: 'assets/images/eqippedImg3.jpeg',
              category: "Beaker",
              numOfBrands: 18,
              press: () {},
            ),  SpecialOfferCard(
              image: "assets/images/labequipement5.jpeg",
              category: "Shackleton",
              numOfBrands: 18,

              press: () {},
            ),  SpecialOfferCard(
              image: "assets/images/eqippedImg4.jpg",
              category: "Microscope",
              numOfBrands: 18,
              press: () {},
            ),
            // SpecialOfferCard(
            //   image: "assets/images/eqippedImg3.jpeg",
            //   category: "Fashion",
            //   numOfBrands: 24,
            //   press: () {},
            // ),
            SizedBox(width: getProportionateScreenWidth(20)),
          ],
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(22)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(100),
          height: getProportionateScreenWidth(20),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(image,fit: BoxFit.fill,)
          ),
        ),
      ),
    );
  }
}