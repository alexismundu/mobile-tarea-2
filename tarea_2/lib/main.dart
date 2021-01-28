import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  int likesCounter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi primera app',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int likesCounter = 90;
  bool isLikeBtnPressed = false;
  bool isDislikeBtnPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App1'),
      ),
      body: Column(children: [
        Image.network("https://pbs.twimg.com/media/DburBCaVQAAM_2g.jpg"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ITESO, Universidad Jesuita de Guadalajara",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("San Pedro Tlaquepaque")
                  ],
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.thumb_up,
                    color: isLikeBtnPressed ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    likesCounter++;
                    setState(() {
                      isLikeBtnPressed = !isLikeBtnPressed;
                    });
                  }),
              IconButton(
                  icon: Icon(
                    Icons.thumb_down,
                    color: isDislikeBtnPressed ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    likesCounter--;
                    setState(() {
                      isDislikeBtnPressed = !isDislikeBtnPressed;
                    });
                  }),
              Text("$likesCounter"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                      iconSize: 64,
                      icon: Icon(Icons.mail),
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                              SnackBar(content: Text("Enviar correo")));
                      }),
                  Text("Correo"),
                ],
              ),
              Column(
                children: [
                  IconButton(
                      iconSize: 64,
                      icon: Icon(Icons.call),
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                              SnackBar(content: Text("Hacer llamada")));
                      }),
                  Text("Llamada"),
                ],
              ),
              Column(
                children: [
                  IconButton(
                      iconSize: 64,
                      icon: Icon(Icons.directions),
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                              SnackBar(content: Text("Ir al ITESO")));
                      }),
                  Text("Ruta"),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
              "Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas"),
        ),
        IconButton(
            iconSize: 64,
            color: Colors.lightGreen,
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              String dialogMsg = likesCounter % 2 == 0
                  ? "El contador de likes es par"
                  : "${DateTime.now()}";
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: Text("Dialog test"),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text(dialogMsg)],
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Close")),
                      ],
                    );
                  }); //mostrar dialogo
            })
      ]),
    );
  }
}
