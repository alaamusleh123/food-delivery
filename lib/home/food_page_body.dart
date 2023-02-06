import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_taxt.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  var images={
    "p1.jpg",
    "p2.jpg",
    "p3.jpg",
    "p4.jpg",
    "p5.jpg"
  };
  PageController pageController=PageController(viewportFraction: 0.85);//هاي عشان اعرف ازا الصور في البيج فيو هتظهر صورة وحدة ولما اسحب مثلا من اليمين للشمال هتظهر الصورة التانية ولا هتظهر صورة وجزء من الصورة الي جميها
  var _currentPageValue=0.0;//وحدة التحكم بالصفحة عشان انكبر وانصغر يعني نعمل تحجيم للبيج فيو لما نسحب من الشمال لليمين اشي يكبر واشي يصغر
  double _scaleFactor=0.8; //عامل المقياس اعطاه 8بلمية
  double _height=220;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
     setState(() {
       _currentPageValue  = pageController.page!;
     });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();


  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white38,
          height: 320,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
    new DotsIndicator(
    dotsCount: 5,
    position: _currentPageValue,
    decorator: DotsDecorator(
      activeColor: Color(0xFF89dad0),
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    )
      ],
    );
  }
//صفحة اللبناء
  //هان كمان هيتم عملية تحجيم الكونتينر تاع البيج فيو
  Widget _buildPageItem(int index) {
    //هاي الماتريكس عشان البيج فيو فاول صفحة لما اسحب من الشمال لليمين اشي بيرتفع واشي بينزل لتحت عشان هيك استخدم الماتريكس
    Matrix4 mateix= new Matrix4.identity();   //هاي مصفوفة هتحدد xyz
    if(index==_currentPageValue.floor()){
      var currScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
      var currTrans= _height*(1-currScale)/2;
      mateix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,currTrans , 0) ;

    }else if(index==_currentPageValue.floor()+1){
      var currScale= _scaleFactor+(_currentPageValue-index+1)*(1-_scaleFactor);
      var currTrans= _height*(1-currScale)/2;
      mateix=Matrix4.diagonal3Values(1, currScale, 1);
      mateix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,currTrans , 0) ;

    }else if(index==_currentPageValue.floor()-1){
      var currScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
      var currTrans= _height*(1-currScale)/2;
      mateix=Matrix4.diagonal3Values(1, currScale, 1);
      mateix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,currTrans , 0) ;

    }else{
      var currScrle=0.8;
      mateix=Matrix4.diagonal3Values(1, currScrle, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1) ;
    }
    return Transform(
      transform: mateix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Colors.blue : Colors.deepPurple,
              image:  DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "images/"+images.elementAt(index),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                //هاد الشادو عشان الظل تحت الكونتينر
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(//هاد الشادو والي تحتية عشان يضيف شادو على الجوانب بلون ابيض كانهم جزء من الكونتينر عشان انوسعو
                    color: Colors.white,
                    offset: Offset(-5,0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5,0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 15,right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Chainese Side"),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Wrap( //بنستخدم الراب عشان لو بدنا نكرر زر او اي اشي بدنا نكررو افقيا
                          children:List.generate(5, (index) => Icon(Icons.star, color: Color(0xFF89dad0),size: 15,),)
                        ),
                        SizedBox(width: 10,),
                        SmallText(text: "4.5",color: Colors.black26,),
                        SizedBox(width: 10,),
                        SmallText(text: "1287",color: Colors.black26,),
                        SizedBox(width: 10,),
                        SmallText(text: "Comments",color: Colors.black26,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,//هلقيت اخر صف بلكونتينر مكرر بكزا مكان في التطبيق فبدو يعمل الو اكستراكت انو انشا ملف دات هيشتغلهم فيه ويكررهم في كل مكان
                      children: const [
                        IconAndTextWidget(
                            icon: Icons.circle_sharp,
                            text: "Normal",
                            color: Colors.black26,
                            iconColor: Color(0xFFF85C2D),
                        ),

                        IconAndTextWidget(
                          icon: Icons.location_on,
                          text: "1.7km",
                          color: Colors.black26,
                          iconColor: Color(0xFF789BD5),
                        ),

                        IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: "32min",
                          color: Colors.black26,
                          iconColor: Color(0xFF61C22A2A),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
