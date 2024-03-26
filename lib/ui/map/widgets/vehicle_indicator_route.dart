
import 'package:esperar_drivers/core/const/generate_plate.dart';
import 'package:flutter/material.dart';

class VehicleIndicatorRoute extends StatelessWidget {
  const VehicleIndicatorRoute({
    super.key, this.vehiclesAhead,
  });
  final bool? vehiclesAhead;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                bottom:
                    index != 10 ? 10 : 0),
            child: const Row(
              mainAxisAlignment:
                  MainAxisAlignment.start,
              crossAxisAlignment:
                  CrossAxisAlignment.end,
              children: [
                PlateVehicle(
                  background: Colors.yellow,
                  number: 123,
                ),
                SizedBox(width: 5),
                Text(
                  '5MIN 2KM',
                  style: TextStyle(
                      fontWeight:
                          FontWeight.bold),
                )
              ],
            ),
          );
        },
        itemCount: 0,
        reverse: vehiclesAhead ?? false,
      ),
    );
  }
}
