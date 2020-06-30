import 'package:flutter/material.dart';
import 'package:flutter_gif_trail/services/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

final TextStyle RLabelStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);
final BoxDecoration kBoxDecorationStyle = BoxDecoration(
    color: Color(0xFF6CA8F1),
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );
class _LoginPageState extends State<LoginPage> {
  String error = '';

  bool checkEmail(String email) {
    print(email.substring(email.length - 7));
    if (email.substring(email.length - 7) == '.edu.in')
      return true;
    else if (email.substring(email.length - 6) == '.ac.in')
      return true;
    else
      return false;
  }

  final Authservice _auth = Authservice();
  String _firstname, _lastname, _id, _email = '', _password = '';
  List gender = ["Faculty", "Student"];

  String select;
  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (value) {
            setState(() {
              print(value);
              select = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  var _institute = [
    'CSPIT',
    'DEPSTAR',
    'I2IM',
    'CMPICA',
    'RPCP',
    'PDPIAS',
    'MTIN',
    'ARIP',
    'CIPS'
  ];
  var _currentItemSelected = 'CSPIT';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "OpenSans",
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomPadding: false,
      body: 
      Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    _firstname = val;
                  });
                },
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please type first name';
                  }
                },
                //onSaved: (input) => _firstname = input,
                decoration: InputDecoration(
                    labelText: 'First Name', labelStyle: RLabelStyle),
              ),
              
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    _lastname = val;
                  });
                },
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please type last name';
                  }
                },
                //onSaved: (input) => _lastname = input,
                decoration: InputDecoration(
                    labelText: 'Last Name', labelStyle: RLabelStyle),
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    _id = val;
                  });
                },
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please enter your id';
                  }
                },
                //onSaved: (input) => _age = input,
                decoration:
                    InputDecoration(labelText: 'Id', labelStyle: RLabelStyle),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    _email = val;
                  });
                },
                //onSaved: (input) => _email = input,
                decoration: InputDecoration(
                    labelText: 'Email', labelStyle: RLabelStyle),
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    _password = val;
                  });
                },
                //onSaved: (input) => _password = input,
                decoration: InputDecoration(
                    labelText: 'Password', labelStyle: RLabelStyle),
                obscureText: true,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Are you a?? ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        fontSize: 16.0),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  addRadioButton(0, 'Faculty'),
                  addRadioButton(1, 'Student'),
                ],
              ),
              Row(children: <Widget>[
                Text(
                  'Institue Name',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      fontSize: 16.0),
                ),
                SizedBox(
                  width: 50,
                ),
                DropdownButton<String>(
                  items: _institute.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String newValueSelected) {
                    setState(() {
                      this._currentItemSelected = newValueSelected;
                    });
                  },
                  value: _currentItemSelected,
                ),
              ]),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () async {
                  String finalname = _firstname + ' ' + _lastname;
                  if (checkEmail(_email)) {
                    print(_email);
                    print(_password);
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        _email, _password, _id, finalname);
                    if (result == null) {
                      print('Error');
                    } else {
                      Navigator.pop(context);
                      print('Sucess');
                      //runApp(Temp());
                      //Navigator.pushNamed(context, '/temp');
                    }
                  } else {
                    setState(() {
                      error = 'please Sign up with college id';
                    });
                  }
                },
                padding: EdgeInsets.all(15.0),
                child: Text(
                  '          REGISTER          ',
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.lightBlue,
              ),
              SizedBox(height: 15.0),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
