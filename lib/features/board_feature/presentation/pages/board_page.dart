import 'package:a_couple_tasks/core/widgets/custom_bottom_nav_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Board'),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double smallSpacer = constraints.maxHeight * 0.01;
            double bottomNavBarHeight = constraints.maxHeight * 0.10;

            return Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text('Tarefas do Mês'),
                            SizedBox(height: smallSpacer),
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: smallSpacer),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children:[
                                      Icon(Icons.bookmark),
                                      Text('10'),
                                    ],
                                  ),
                                  Text('Conlcuídas'),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children:[
                                      Icon(Icons.ac_unit),
                                      Text('5'),
                                    ],
                                  ),
                                  Text('A Fazer'),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children:[
                                      Icon(Icons.access_alarm),
                                      Text('0'),
                                    ],
                                  ),
                                  Text('Atrasadas'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: smallSpacer),
                      Container(
                        padding: EdgeInsets.all(16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children:[
                                  Text('Pontuação do mês'),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text('Pontuação'),
                                          Text('100'),
                                        ],
                                      ),
                                      Container(height: 50, width: 2, color: Colors.black),
                                      Column(
                                        children: [
                                          Text('Pontuação'),
                                          Text('100'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ]
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                            SizedBox(height: smallSpacer),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white60
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(45),
                                        ),
                                      ),
                                      Text('Histórico'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(45),
                                        ),
                                      ),
                                      Text('Lembretes'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(45),
                                        ),
                                      ),
                                      Text('Regras'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(45),
                                        ),
                                      ),
                                      Text('Reclamações'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: smallSpacer,),
                            ElevatedButton(onPressed: () {
                              print('Button Pressed');
                            }, child: Text('Ver todas as tarefas'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightGreen,
                              padding: EdgeInsets.all(8),
                            ),)
                          ],
                        )
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: bottomNavBarHeight,
                    child: CustomBottomNavbar(
                      selectedIndex: 0,
                      onItemTapped: (index) {},
                    ),
                  )
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}
