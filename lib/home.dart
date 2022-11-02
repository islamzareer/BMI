import 'dart:math';

import 'result.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;
  double heightVal = 170;

  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              title: const Text('BMI: Body Mass Index'), centerTitle: true),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      // Gender(gender: 'male'),

                      Gender(context, 'male'),
                      const SizedBox(width: 15),
                      Gender(context, 'female'),
                      //Gender(gender: 'female'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Height',
                            style: Theme.of(context).textTheme.headline2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(heightVal.toStringAsFixed(1),
                                style: Theme.of(context).textTheme.headline1),
                            Text('CM',
                                style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                        Slider(
                          min: 90,
                          max: 220,
                          activeColor: Colors.white,
                          inactiveColor: Colors.grey,
                          value: heightVal,
                          onChanged: (newValue) =>
                              setState(() => heightVal = newValue),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      WeightAndAge(context, 'weight'),
                      const SizedBox(width: 15),
                      WeightAndAge(context, 'age'),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.teal,
                ),
                height: MediaQuery.of(context).size.height / 16,
                child: TextButton(
                  onPressed: () {
                    var result = weight / pow(heightVal / 100, 2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Result(result: result, isMale: isMale, age: age),
                      ),
                    );
                  },
                  child: Text(
                    'Calculate',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Expanded Gender(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() {
          isMale = (type == 'male') ? true : false;
        }),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(type == 'male' ? Icons.male : Icons.female, size: 90),
              const SizedBox(height: 15),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded WeightAndAge(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 15),
            Text(
              type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  onPressed: () {
                    setState(() {
                      if (type == 'age') {
                        if (age <= 0) {
                          age = 0;
                        } else {
                          age--;
                        }
                      } else { 
                        if (weight <= 0) {
                          weight = 0;
                        } else {
                          weight--;
                        }
                      }
                    });
                  },
                  mini: true,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age++' : 'weight++',
                  onPressed: () =>
                      setState(() => type == 'age' ? age++ : weight++),
                  mini: true,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
