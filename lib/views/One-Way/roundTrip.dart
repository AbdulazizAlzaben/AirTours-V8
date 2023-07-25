import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'Var.dart';

class RoundTrip extends StatefulWidget {
  const RoundTrip({super.key});

  @override
  State<RoundTrip> createState() => _RoundTripState();
}

class _RoundTripState extends State<RoundTrip> {
  void addFlight() {
    setState(() {
      flightName.add(From.text);
    });
  }

  Future pickDate() async {
    DateTimeRange? newDate = await showDateRangePicker(
        context: context, firstDate: DateTime(2023), lastDate: DateTime(2024));
    if (newDate == null) return;

    setState(() {
      dateRange = newDate;
    });
  }

  void icreaseCount() {
    setState(() {
      count++;
    });
  }

  void decreaseCount() {
    setState(() {
      if (count == 0) return;
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(blurRadius: 2, offset: Offset(0, 0))
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItems: true,
                      items: flightName,
                      onChanged: (value) => fromName = value,
                      dropdownSearchDecoration: InputDecoration(
                          suffixIcon: const Icon(Icons.flight_takeoff_rounded),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none),
                          labelText: "from",
                          hintText: "City"),
                      showSearchBox: true,
                    ),
                  ),
                ), //SizedBox(height: 20,child:Icon(Icons.arrow_downward_sharp)),
                Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(blurRadius: 2, offset: Offset(0, 0))
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: DropdownSearch<String>(
                        mode: Mode.MENU,
                        showSelectedItems: true,
                        items: flightName,
                        onChanged: (value) => toName = value,
                        dropdownSearchDecoration: InputDecoration(
                            suffixIcon: const Icon(Icons.flight_takeoff_rounded),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none),
                            labelText: "To",
                            hintText: "City"),
                        showSearchBox: true,
                      ),
                    )),
                const SizedBox(
                  height: 1,
                ),
                Row(
                  children: [
                    //   Expanded(child: ElevatedButton(child: Text("${start.year}/${start.month}/${start.day}"),onPressed: ()async{pickDate;},)),
                    // SizedBox(width: 5,),

                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.all(5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(blurRadius: 2, offset: Offset(0, 0))
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 2,
                          ),
                          const Text("   Travel dates"),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 250, top: 8, bottom: 8),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                elevation: 0,
                                backgroundColor: Colors.white),
                            child: Text(
                              "${dateTime.day} ${monthNames[dateTime.month - 1]} , ${monthNames[end.month - 1] == monthNames[start.month - 1] ? end.day : end.day} ${monthNames[end.month - 1] == monthNames[start.month - 1] ? "" : monthNames[end.month - 1]}",
                              style:
                                  const TextStyle(color: Colors.black, fontSize: 17),
                            ),
                            onPressed: () async {
                              DateTimeRange? newDate =
                                  await showDateRangePicker(
                                      context: context,
                                      initialDateRange: dateRange,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2024));
                              if (newDate == null) return;
                              print(start);
                              print(end);
                              print("-----------");
                              setState(() {
                                dateRange = newDate;
                                print(start);
                                print(end.day);
                              });
                            },
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(blurRadius: 2, offset: Offset(0, 0))
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            const Expanded(flex: 1, child: Text("Passenger: ")),
                            Expanded(
                                flex: 2,
                                child: Row(children: [
                                  TextButton(
                                      onPressed: decreaseCount,
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.black,
                                        size: 15,
                                      )),
                                  Text("$count"),
                                  TextButton(
                                      onPressed: icreaseCount,
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.black,
                                        size: 15,
                                      )),
                                  const SizedBox(
                                    height: 70,
                                  )
                                ])),
                          ],
                        ),
                      ),
                      //before children if we want it to be at the end of the container mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(blurRadius: 2, offset: Offset(0, 0))
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: RadioListTile(
                                title: const Text("Guest"),
                                value: passengerType[0],
                                groupValue: currentPassenger,
                                onChanged: (value) {
                                  setState(() {
                                    currentPassenger = value.toString();
                                    print(currentPassenger);
                                  });
                                },
                              ),
                            ),
                            Flexible(
                              child: RadioListTile(
                                title: const Text("Business"),
                                value: passengerType[1],
                                groupValue: currentPassenger,
                                onChanged: (value) {
                                  setState(() {
                                    currentPassenger = value.toString();
                                    print(currentPassenger);
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 70,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}