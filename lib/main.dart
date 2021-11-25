import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  bool _isButtonDisabledValue1 = true;
  bool _isButtonDisabledOperationNegative = true;
  bool _isButtonDisabledOperation = false;
  bool _isButtonDisabledValue2 = false;
  bool _isButtonDisabledCalculate = false;
  int _value1 = 0, _value2 = 0, _negative = 1;
  String _result = '0';
  String _operation = '';
  String _operator = '';

  void _setValue1(int val) {
    setState(() {
      if (val == 0 && _value1 == 0) {
        _operation = val.toString();
        _isButtonDisabledValue1 = false;
      } else if (_value1 == 0 && _operation == '') {
        _operation = val.toString();
        _value1 = int.parse(_value1.toString() + val.toString());
      } else {
        _operation += val.toString();
        _value1 = int.parse(_value1.toString() + val.toString());
      }
      _isButtonDisabledOperation = true;
      _isButtonDisabledOperationNegative = true;
    });
  }

  void _setOperatorNegative(String operator) {
    setState(() {
      if (_negative == 1 && !_isButtonDisabledOperation) {
        _negative = -1;
        _operation = operator + ' ';
        _isButtonDisabledOperationNegative = false;
      } else if (_isButtonDisabledOperation) {
        _setOperator(operator);
      }
    });
  }

  void _setOperator(String operator) {
    setState(() {
      _operator = operator;
      _operation += ' ' + operator + ' ';
      _isButtonDisabledValue1 = false;
      _isButtonDisabledOperation = false;
      _isButtonDisabledOperationNegative = false;
      _isButtonDisabledValue2 = true;
    });
  }

  void _setValue2(int val) {
    setState(() {
      if (val == 0 && _value2 == 0) {
        // Adicionando o zero
        _operation += val.toString();
        _isButtonDisabledValue2 = false;
      } else {
        _operation += val.toString();
        _value2 = int.parse(_value2.toString() + val.toString());
      }
      _isButtonDisabledCalculate = true;
    });
  }

  void _calculate() {
    _value1 *= _negative;
    setState(() {
      switch (_operator) {
        case '+':
          _result = (_value1 + _value2).toString();
          break;
        case '-':
          _result = (_value1 - _value2).toString();
          break;
        case '*':
          _result = (_value1 * _value2).toString();
          break;
        case '/':
          _result = _value2 != 0
              ? (_value1 / _value2).toStringAsFixed(6)
              : 'Oh não divisão por zero, nos tempos atuais isso é uma indefinição, a menos que você consiga provar o contrário.';
          break;
        case '%':
          _result = (_value1 % _value2).toString();
          break;
        default:
      }
      _isButtonDisabledValue1 = false;
      _isButtonDisabledOperation = false;
      _isButtonDisabledValue2 = false;
      _isButtonDisabledCalculate = false;
      _isButtonDisabledOperationNegative = false;
    });
  }

  void _reset() {
    setState(() {
      _isButtonDisabledValue1 = true;
      _isButtonDisabledOperationNegative = true;
      _isButtonDisabledOperation = false;
      _isButtonDisabledValue2 = false;
      _isButtonDisabledCalculate = false;
      _value1 = 0;
      _value2 = 0;
      _result = '0';
      _operation = '';
      _operator = '';
      _negative = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                Text(
                  '$_operation',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 20),
                Text(
                  '$_result',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue1
                            ? () => _setValue1(0)
                            : null,
                        child: const Text(
                          '0',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue1
                            ? () => _setValue1(1)
                            : null,
                        child: const Text(
                          '1',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue1
                            ? () => _setValue1(2)
                            : null,
                        child: const Text(
                          '2',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue1
                            ? () => _setValue1(3)
                            : null,
                        child: const Text(
                          '3',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue1
                            ? () => _setValue1(4)
                            : null,
                        child: const Text(
                          '4',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue1
                            ? () => _setValue1(5)
                            : null,
                        child: const Text(
                          '5',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue1
                            ? () => _setValue1(6)
                            : null,
                        child: const Text(
                          '6',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue1
                            ? () => _setValue1(7)
                            : null,
                        child: const Text(
                          '7',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue1
                            ? () => _setValue1(8)
                            : null,
                        child: const Text(
                          '8',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue1
                            ? () => _setValue1(9)
                            : null,
                        child: const Text(
                          '9',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledOperation
                            ? () => _setOperator('+')
                            : null,
                        child: const Text(
                          '+',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledOperationNegative
                            ? () => _setOperatorNegative('-')
                            : null,
                        child: const Text(
                          '-',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledOperation
                            ? () => _setOperator('*')
                            : null,
                        child: const Text(
                          '*',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledOperation
                            ? () => _setOperator('/')
                            : null,
                        child: const Text(
                          '/',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledOperation
                            ? () => _setOperator('%')
                            : null,
                        child: const Text(
                          '%',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue2
                            ? () => _setValue2(0)
                            : null,
                        child: const Text(
                          '0',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue2
                            ? () => _setValue2(1)
                            : null,
                        child: const Text(
                          '1',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue2
                            ? () => _setValue2(2)
                            : null,
                        child: const Text(
                          '2',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue2
                            ? () => _setValue2(3)
                            : null,
                        child: const Text(
                          '3',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue2
                            ? () => _setValue2(4)
                            : null,
                        child: const Text(
                          '4',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue2
                            ? () => _setValue2(5)
                            : null,
                        child: const Text(
                          '5',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue2
                            ? () => _setValue2(6)
                            : null,
                        child: const Text(
                          '6',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue2
                            ? () => _setValue2(7)
                            : null,
                        child: const Text(
                          '7',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue2
                            ? () => _setValue2(8)
                            : null,
                        child: const Text(
                          '8',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 60,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: _isButtonDisabledValue2
                            ? () => _setValue2(9)
                            : null,
                        child: const Text(
                          '9',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 186,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.amber,
                        onPressed:
                            _isButtonDisabledCalculate ? _calculate : null,
                        child: const Text(
                          'Calcular',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      color: Colors.grey,
                      width: 123,
                      height: 40,
                      child: RaisedButton(
                        onPressed: _reset,
                        color: Colors.blueAccent,
                        child: const Text(
                          'Zerar',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
