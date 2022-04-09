import 'package:flutter/material.dart';
import './page_indicator.dart';
import './page_body.dart';

class StepForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StepFormState();
  }
}

class _StepFormState extends State<StepForm> {
  final _stepFormController = PageController();

  int _page = 0;

  List _pagesList = [
    pageBody(
      'https://miro.medium.com/max/1400/1*TFZQzyVAHLVXI_wNreokGA.png',
      'Flutter',
      'Flutter é uma ferramenta que nos permite criar aplicações nativas '
      'multi-plataforma utilizando somente uma linguagem de programação,'
      ' chamada Dart. Com Flutter podemos então manter somente um código '
      'fonte para criar aplicativos que serão executados tanto no sistema '
      'operacional da Apple IOS e também do Google o Android.',
    ),
    pageBody(
        'https://download.logo.wine/logo/Dart_(programming_language)/Dart_(programming_language)-Logo.wine.png',
        'Dart',
        'Dart é a linguagem utilizada pelo Flutter, ela foi desenvolvida '
            'pelo Google e é uma linguagem focada no desenvolvimento '
            'front-end, além de aplicativos para smartphones podemos utilizar '
            'Dart também para criar aplicações web.'),
    pageBody('https://i.dlpng.com/static/png/6771635_preview.png',
        'Multi-Plataforma',
        'Outro ponto que podemos destacar é que com o Flutter nós conseguimos '
            'construir funcionalidades diferentes para cada plataforma, '
            'por exemplo: caso o aplicativo esteja rodando em um smartphone '
            'Android o codigo A é executado e caso seja um IOS o código B é '
            'executado.')
  ];

  void _changeStep(bool nextPage) {
    if (_page < 2 && nextPage) {
      setState(() {
        _page++;
      });
      _stepFormController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    } else if (_page > 0 && !nextPage) {
      setState(() {
        _page--;
      });
      _stepFormController.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step App Page'),
      ),
      body: PageView.builder(
          controller: _stepFormController,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return _pagesList[index];
          }),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => _changeStep(false),
            child: Text('Anterior'),
          ),
          pageIndicator(_page == 0),
          pageIndicator(_page == 1),
          pageIndicator(_page == 2),
          TextButton(
            onPressed: () => _changeStep(true),
            child: Text('Próximo'),
          ),
        ],
      ),
    );
  }
}
