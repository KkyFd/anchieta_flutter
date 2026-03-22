import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _sliderValue = 0.0;
  String? _radio;
  String? _regiao;
  bool _checkbox = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Olá Flutter')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Preenche com o nome do Produto:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
              ),
              Padding(
                padding: EdgeInsets.all(20), 
                child: 
                TextField(
                  onChanged: (value) {
                    setState(() {
                      // depois?
                    });
                  },
                  autocorrect: true, 
                  decoration: 
                  InputDecoration(
                    hintText: "Nome do produto",
                    labelText: "Produto", 
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.person)
                  )
                )
              ),
              Text(
                "Defina a quantidade: ${_sliderValue.round()}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Slider(
                  value: _sliderValue, 
                  min: 0.0,
                  max: 8001.0,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child:
                Text(
                  "Escolha o tipo de entrega:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                ),
              ),
/*era pra fazer radio aqui :skull:               DropdownButton(
                items: ["Carreto", "Retirada", "Correio"].map((String entrega){ 
                  return DropdownMenuItem (
                    value: entrega,
                    child: Text(entrega),
                  );
                }).toList(), // cacete que syntax chata
                onChanged: (String? novo) {
                  setState(() {
                    //
                  });
                }
              ) */
              RadioGroup(
                groupValue: _radio,
                onChanged: (String? novo){
                  setState(() {
                    _radio = novo!;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio(
                          value: "Carreto"
                          ),
                          Text("Carreto", style: TextStyle(fontSize: 14))
                        ],
                      ),

                      SizedBox(height: 10),

                      Row(
                        children: [
                          Radio(
                          value: "Retirada"
                          ),
                          Text("Retirada", style: TextStyle(fontSize: 14))
                        ],
                      ),

                      SizedBox(height: 10),

                      Row(
                        children: [
                          Radio(
                          value: "Correio"
                          ),
                          Text("Correio", style: TextStyle(fontSize: 14))
                        ],
                      ),
                    ],
                  ),
                )
              ),
              SizedBox(height: 10),
/*               Column(
                children: [
                  Radio(
                    value: "Carreto",
                    groupValue: _radio,
                  ),
                  Radio(
                    value: "Retirada",
                    groupValue: _radio
                  ),
                  RadioGroup(
                    value: "Correio",
                    groupValue: _radio
                  )
                ],
              ) */
              Text(
                "Escolha a região:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
              ),

              SizedBox(height: 30),
            //agora sim é o dropdown :D
              DropdownButton(
                value: _regiao,
                items: ["Norte", "Leste", "Sul", "Oeste"].map((String regiaoMap){ 
                  return DropdownMenuItem (
                    value: regiaoMap,
                    child: Text(regiaoMap),
                  );
                }).toList(), // cacete que syntax chata
                onChanged: (String? novo) {
                  setState(() {
                    _regiao = novo;
                  });
                }
              ),

              SizedBox(height: 30),

              Text(
                "Deseja receber promoções via e-mail?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _checkbox, 
                    onChanged: (bool? novo) {
                      setState(() {
                        _checkbox = novo!;
                      });
                    }
                  ),
                  Text(
                    "Sim, eu desejo receber promoções via e-mail",
                    style: TextStyle(fontSize: 16)
                  ),
                ],
              )
            ],
            
          ),
        ),
      ),
    );
  }
}
