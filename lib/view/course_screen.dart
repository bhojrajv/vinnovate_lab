import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinnovate_task/Appconst/appcolors.dart';
import 'package:five_pointed_star/five_pointed_star.dart';
import 'package:vinnovate_task/viewmodel/courseController.dart';
class CoursePage extends GetView<CourseController> {
  const CoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (backgroundColor: AppcColors.txtgrey, appBar:  AppBar(centerTitle: true, title: Text("Accademy",style: TextStyle(color: AppcColors.textcolor), ), leading: InkWell(onTap: (){ Get.back();}, child: Icon(Icons.arrow_back_ios,color: AppcColors.textcolor,)),backgroundColor: AppcColors.white, elevation: 0),
    body: Obx(
      ()=>controller.new_course.isEmpty&& controller.isloading==true?Center(child: CircularProgressIndicator()):
    SingleChildScrollView(controller: controller.scrcontroller,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0,top: 10),
            child: Text("Showing 14 Course",style: TextStyle(color: AppcColors.textcolor,fontWeight: FontWeight.w600,fontSize: 15),),
          ),
         const SizedBox(height: 10,),
          ListView.builder (
              primary: false, itemCount: controller.getCourses().length+(controller.isloading.value==true?1:0),shrinkWrap: true, itemBuilder: (context,index){
            return index== controller.getCourses().length?Center(child: CircularProgressIndicator()) :
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 12.0),
              child: Card(  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)), color: AppcColors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Image.network("${controller.getCourses()[index].image}",width: 80,height: 80,fit: BoxFit.cover,),SizedBox(width: 10,),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(maxLines: 5,"${controller.getCourses()[index].description}",style: TextStyle(color: AppcColors.textcolor,fontSize: 14,fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis),),
                  const SizedBox(height: 5,),
                    Text("${controller.getCourses()[index].category}",style: TextStyle(fontSize: 12),),
                    const SizedBox(height: 5,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Row(children: [FivePointedStar(selectedColor: Colors.yellow,color: Colors.amber,
                      count: double.parse("${controller.getCourses()[index].rating?.rate}").toInt(),
                      onChange: (count){
                       // print(count);
                      },
                    ),const SizedBox(width: 5.0,),Text("${controller.getCourses()[index].rating?.rate}"),const SizedBox(width: 5.0,),Text("${controller.getCourses()[index].rating?.count}")],),Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text("${controller.getCourses()[index].price}"),
                    )],)],)),

            ],),
              ),),
            );
          })
        ],),
      ),
    ),);
  }
}
