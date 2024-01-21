import 'package:flutter/material.dart';

class CalculPage extends StatefulWidget {
  const CalculPage({super.key});

  @override
  State<CalculPage> createState() => _CalculPageState();
}

class _CalculPageState extends State<CalculPage> {

  var _op1, _op2, _rslt;
  TextEditingController cont1=new TextEditingController(), cont2=new TextEditingController();

  void _addition(){
    setState(() {
      _rslt=_op1+_op2;
    });
  }

  void _soustraction(){
    setState(() {
      _rslt=_op1-_op2;
    });
  }

  void _multiplication(){
    setState(() {
      _rslt=_op1*_op2;
    });
  }

  void _division(){
    setState(() {
      _op2!=0 ? _rslt=_op1/_op2 : _rslt="Impossible de diviser par Zéro";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.handshake_outlined,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              "Calcul App",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset("assets/images/calcul.png"),
              TextField(
                controller: cont1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Taper un nombre',
                  hintStyle:  TextStyle(
                    fontSize: 20, color: Colors.black,
                  ),
                ),
                onChanged: (text){
                  _op1= int.parse(text);
                },
              ),
              SizedBox(height: 20,),
              TextField(
                controller: cont2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Taper un nombre',
                  hintStyle:  TextStyle(
                    fontSize: 20, color: Colors.black,
                  ),
                ),
                onChanged: (text){
                  _op2= int.parse(text);
                },
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: _addition,
                      child: Text(
                        "+",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      )
                  ),
                  ElevatedButton(
                      onPressed: _soustraction,
                      child: Text(
                        "-",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      )
                  ),
                  ElevatedButton(
                      onPressed: _multiplication,
                      child: Text(
                        "*",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      )
                  ),
                  ElevatedButton(
                      onPressed: _division,
                      child: Text(
                        "/",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      )
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Text(
                "$_rslt",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[400],
                ),
              )
            ],
          ),
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Icon(
            Icons.arrow_back_outlined
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,*/
    );
  }
}
