import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // Adicione uma variável para controlar a página atual do PageView
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double carouselHeight = constraints.maxHeight * 0.50;
            double headerHeight = constraints.maxHeight * 0.20;
            double footerHeight = constraints.maxHeight * 0.10;
            double smallSpacer = constraints.maxHeight * 0.01;
            double largeSpacer = constraints.maxHeight * 0.05;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: headerHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome!',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
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
                SizedBox(height: largeSpacer),
                // Carousel
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: carouselHeight,
                      child: PageView(
                        onPageChanged: (index) {
                          // Atualize a página atual quando o usuário mudar a página
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(color: Colors.red),
                          Container(color: Colors.green),
                          Container(color: Colors.blue),
                        ],
                      ),
                    ),
                    // Indicador de posição
                    Positioned(
                      bottom: 15, // Ajuste a posição vertical conforme necessário
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3, // O número de páginas do PageView
                              (index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 7),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == index
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: largeSpacer),
                // Botão de Criar Conta
                Container(
                  height: footerHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Create account'),
                      ),
                      SizedBox(height: smallSpacer),
                      RichText(
                        text: TextSpan(
                          text: 'Already have an account?',
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Sign in',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Navegue para a página de login
                                },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}