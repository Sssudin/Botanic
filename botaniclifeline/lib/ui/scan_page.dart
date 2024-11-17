import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/earlyplants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_onboarding/ui/screens/detail_page.dart';
import 'package:flutter_onboarding/ui/screens/widgets/plant_widget.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    List<EarlyPlant> _earlyplantList = EarlyPlant.earlyplantList;

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    width: size.width * .9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black54.withOpacity(.6),
                        ),
                        const Expanded(
                            child: TextField(
                            decoration: InputDecoration(
                            hintText: 'Search Plant',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        )),
                        Icon(
                          Icons.mic,
                          color: Colors.black54.withOpacity(.6),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )
                ],
              ),
            ),
      
            Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
            
            Container( 
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: size.height * .4,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _earlyplantList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: (){
                          Navigator.push(context, PageTransition(child: EDetailPage(plantId: _earlyplantList[index].plantId), type: PageTransitionType.bottomToTop));
                        },
                        child: EarlyPlantWidget(index: index, earlyplantList: _earlyplantList));
                  }),
            ),
      
            Container(  
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: size.height * .4,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _earlyplantList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: (){
                          Navigator.push(context, PageTransition(child: EDetailPage(plantId: _earlyplantList[index].plantId), type: PageTransitionType.bottomToTop));
                        },
                        child: EarlyPlantWidget(index: index, earlyplantList: _earlyplantList));
                  }),
            ),
      
            Container( 
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: size.height * .4,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _earlyplantList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: (){
                          Navigator.push(context, PageTransition(child: EDetailPage(plantId: _earlyplantList[index].plantId), type: PageTransitionType.bottomToTop));
                        },
                        child: EarlyPlantWidget(index: index, earlyplantList: _earlyplantList));
                  }),
            ),
      
            
          ],
        ),
          ),
      ));
  }
}