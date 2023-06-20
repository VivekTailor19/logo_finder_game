import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logo_finder_game/controller/logo_controller.dart';
import 'package:sizer/sizer.dart';

class Game_Home extends StatefulWidget {
  const Game_Home({super.key});

  @override
  State<Game_Home> createState() => _Game_HomeState();
}

class _Game_HomeState extends State<Game_Home> {
  @override
  Widget build(BuildContext context) {

    LogoController control = Get.put(LogoController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          leading: Text(""),
          title: Text("Logo Finder",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22.sp),),
          centerTitle: true,
        ),

        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal:5.w,vertical: 2.w),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(height: 100.h,
                child: Column(
                  children: [
                    // DragTarget(builder: (context, candidateData, rejectedData) {
                    //   return control.isFacebook.value == true ?
                    //   RightBox("Facebook", "assets/facebook.png") :
                    //   NullBox("FaceBook");
                    // },
                    //   onAccept: (data) => control.isFacebook.value = true,
                    //   onWillAccept: (data) => data == "facebook",
                    //
                    // ),
                    DragTarget_Widget('facebook',"Facebook","assets/facebook.png",control.isFacebook),
                    DragTarget_Widget('youtube',"Youtube","assets/youtube.png",control.isYoutube),
                    DragTarget_Widget('whatsapp',"WhatsApp","assets/whatsapp.png",control.isWhatsApp),
                    DragTarget_Widget('twitter',"Twitter","assets/twitter.png",control.isTwitter),
                    DragTarget_Widget('instagram',"Instagram","assets/instagram.png",control.isInstagram),
                  ],
                ),
              ),
              Container(
                height: 80.h,
                width: 20.w,
                alignment: Alignment.center,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Obx(() =>
                    //     Draggable(
                    //       data: "facebook",
                    //       child: control.isFacebook.value == true ? Container() : LogoTabTile("assets/facebook.png"),
                    //       feedback: LogoTabTile("assets/facebook.png"),
                    //     ),
                    // ),
                    Draggble_Widget(LogoTabTile("assets/facebook.png"),"facebook",control.isFacebook),
                    Draggble_Widget(LogoTabTile("assets/instagram.png"),"instagram",control.isInstagram),
                    Draggble_Widget(LogoTabTile("assets/twitter.png"),"twitter",control.isTwitter),
                    Draggble_Widget(LogoTabTile("assets/whatsapp.png"),"whatsapp",control.isWhatsApp),
                    Draggble_Widget(LogoTabTile("assets/youtube.png"),"youtube",control.isYoutube),
                  ],
                ),
              )
            ],
          ),
        ),

      ),
    );
  }

  Widget DragTarget_Widget(String dataDrag,String title,String imgPath,RxBool variable) {
    return DragTarget(builder: (context, candidateData, rejectedData) {
                    return variable.value == true ?
                      RightBox(title, imgPath) :
                    NullBox(title);
                  },
                    onAccept: (data) => variable.value = true,
                    onWillAccept: (data) => dataDrag == data,
                  );
  }

  Widget Draggble_Widget(Widget widget,String dataDrag,RxBool variable) {
    return
        Obx(() => Draggable(
                  data: dataDrag,
                  child: variable.value == true ? Container() : widget,
                  feedback: widget,
                  childWhenDragging: Container(),
    ),
        );
  }

  Widget LogoTabTile(String imgpath)
  {
    return Container(
      height: 65,
      width: 75,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("$imgpath"),fit: BoxFit.fill)),
    );
  }

  Widget NullBox(String title)
  {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 13.h,width: 20.h,decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.w),
            border: Border.all(color: Colors.black12,width: 3)
          ),
        ),
        SizedBox(height: 5,),
        Text("$title",style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.w400)),
      ],
    );
  }

  Widget RightBox(String title,String imgpath)
  {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          child: Image.asset("$imgpath",height:10.h,width:10.h,fit: BoxFit.fill,),
          height: 13.h,width: 20.h,decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.w),
            border: Border.all(color: Colors.black12,width: 3)
        ),
        ),
        SizedBox(height: 1.h,),
        Text("$title",style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.w400)),
      ],
    );
  }


}



















/*


Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LongPressDraggable(
                            data: "data",
                            child: control.isgot.value == true ? Container() : Container(height: 80,width: 80,color: Colors.red,),
                            feedback: Container(height: 80,width: 80,color: Colors.amber,),
                            onDragStarted: () {
                              print("---------------------Started");
                            },
                            onDragUpdate: (details) {
                              print("---------------------Update");
                            },
                            onDragEnd: (details) {
                              print("---------------------End");
                            },
                            onDragCompleted: () {
                              print("---------------------Complete");
                            },

                        ),
                        DragTarget(
                          onAccept: (data) {
                            control.isgot.value = true;
                          },

                          onWillAccept: (data) {
                            return data == "data";

                          },
                          builder: (context, candidateData, rejectedData) {
                          return control.isgot.value == true ? Container(height: 80,width: 80,color: Colors.red,) : Container(height: 150,width: 150,color: Colors.black12,);
                        },
                        ),
                      ],
                    ),


*/