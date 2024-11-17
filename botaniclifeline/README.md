# Flutter UI - Plants App

An onboarding screen ui for a Plant App coded in Flutter and Dart
![plant-app](https://user-images.githubusercontent.com/102694446/173368186-5ac0d80f-d6f6-4594-98b3-838d95b0b8f8.png)

View Tutorial on YouTube
[https://youtu.be/YI64uyPSduE](https://www.youtube.com/watch?v=NWAJDtaovOU)


# Reference code for previous home page:
Expanded(
    child: SizedBox(
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TabBarView(
            children: [
                Column(
                children: [
                    Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(12.0),
                        itemCount: _earlyplantList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                child: EDetailPage(
                                    plantId: _earlyplantList[index].plantId,
                                ),
                                type: PageTransitionType.bottomToTop,
                                ),
                            );
                            },
                            child: Container(
                            width: 200,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Stack(
                                children: [
                                Positioned(
                                    left: 0,
                                    right: 0,
                                    top: -10,
                                    bottom: 0,
                                    child: Center(
                                    child: Image.asset(
                                        _earlyplantList[index].imageURL,
                                        width: 80, // Adjust the width value to resize the image
                                        height: 80, // Adjust the height value to resize the image
                                    ),
                                    ),
                                ),
                                Positioned(
                                    bottom: 15,
                                    left: 20,
                                    child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                        _earlyplantList[index].plantName,
                                        style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                    ],
                                    ),
                                ),
                                ],
                            ),
                                decoration: BoxDecoration(
                                color: Constants.primaryColor.withOpacity(.8),
                                borderRadius: BorderRadius.circular(20),
                            ),
                            ),
                        );
                        },
                    ),
                    ),
                    Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                        color: Colors.green.withOpacity(.8),
                        borderRadius: BorderRadius.circular(10),
                        ),
                        width: 300,
                        height: 10,
                        child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'Reminder for Beach Daisy',
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            ),
                            ),
                        ),
                    ),
                    )
                    
                ],
                ),
                Column(
                children: [
                    Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(12.0),
                        itemCount: _vegetativeplantList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            
                            child: Container(
                            width: 200,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Stack(
                                children: [
                                Positioned(
                                    left: 0,
                                    right: 0,
                                    top: -10,
                                    bottom: 0,
                                    child: Center(
                                    child: Image.asset(
                                        _vegetativeplantList[index].imageURL,
                                        width: 80, // Adjust the width value to resize the image
                                        height: 80, // Adjust the height value to resize the image
                                    ),
                                    ),
                                ),
                                Positioned(
                                    bottom: 15,
                                    left: 20,
                                    child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                        _vegetativeplantList[index].plantName,
                                        style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                    ],
                                    ),
                                ),
                                ],
                            ),
                            decoration: BoxDecoration(
                                color: Constants.primaryColor.withOpacity(.8),
                                borderRadius: BorderRadius.circular(20),
                            ),
                            ),
                        );
                        },
                    ),
                    ),
                    Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                        color: Colors.yellow.shade800.withOpacity(.8),
                        borderRadius: BorderRadius.circular(10),
                        ),
                        width: 300,
                        height: 50,
                        child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'Reminder for Plumbago',
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            ),
                            ),
                        ),
                    ),
                    )
                ],
                ),
                Column(
                children: [
                    Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(12.0),
                        itemCount: _floweringplantList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            
                            child: Container(
                            width: 200,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Stack(
                                children: [
                                Positioned(
                                    left: 0,
                                    right: 0,
                                    top: -10,
                                    bottom: 0,
                                    child: Center(
                                    child: Image.asset(
                                        _floweringplantList[index].imageURL,
                                        width: 80, // Adjust the width value to resize the image
                                        height: 80, // Adjust the height value to resize the image
                                    ),
                                    ),
                                ),
                                Positioned(
                                    bottom: 15,
                                    left: 20,
                                    child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                        _floweringplantList[index].plantName,
                                        style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                    ],
                                    ),
                                ),
                                ],
                            ),
                            decoration: BoxDecoration(
                                color: Constants.primaryColor.withOpacity(.8),
                                borderRadius: BorderRadius.circular(20),
                            ),
                            ),
                        );
                        },
                    ),
                    ),
                    Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                        color: Colors.blue.shade800.withOpacity(.8),
                        borderRadius: BorderRadius.circular(10),
                        ),
                        width: 300,
                        height: 50,
                        child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'Reminder for Big Bluestem',
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            ),
                            ),
                        ),
                    ),
                    )
                ],
                ),
            ],
            ),
        ),
        ),
    ),
