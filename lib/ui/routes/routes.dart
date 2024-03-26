import 'package:esperar_drivers/core/const/colors.dart';
import 'package:esperar_drivers/core/const/navigate.dart';
import 'package:esperar_drivers/domain/blocs/layout.dart';
import 'package:esperar_drivers/domain/blocs/routes.dart';
import 'package:esperar_drivers/domain/repositories/routes.dart';
import 'package:esperar_drivers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoutesProvider(
        routesInterface: Provider.of<RoutesInterface>(context, listen: false),
      )..init(),
      builder: (context, child) => const RoutesScreen._(),
    );
  }

  @override
  State<RoutesScreen> createState() => _RoutesCompanyScreenState();
}

class _RoutesCompanyScreenState extends State<RoutesScreen> {
  @override
  void initState() {
    Provider.of<RoutesProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RoutesProvider>(context);
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: bloc.routes != null
              ? bloc.routes!.isEmpty
                  ? const Center(
                      child: Text(
                      'No se encontraron rutas',
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold),
                    ))
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        final route = bloc.routes![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: size.width,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: primaryColor),
                                borderRadius: BorderRadius.circular(5)),
                            height: 150,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        route.name!,
                                        style: const TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 10),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: IndicatorRoute(
                                                text: route.from!,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: IndicatorRoute(
                                                text: route.to!,
                                                endRoute: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Row(
                                            children: [
                                              Icon(
                                                Icons.car_crash_sharp,
                                                color: primaryColor,
                                              ),
                                              SizedBox(width: 5),
                                              Text('10')
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                 onTap: () => push(context,
                                                'detail-route-map', route),
                                                child: const Row(
                                                  children: [
                                                    Text('Ver en el mapa'),
                                                    SizedBox(width: 5),
                                                    Icon(
                                                      Icons.map,
                                                      color: primaryColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              GestureDetector(
                                                onTap: () => push(context,
                                                    'detail-route', route),
                                                child: const Row(
                                                  children: [
                                                    Text(
                                                        'Detalle de la ruta'),
                                                    SizedBox(width: 5),
                                                    Icon(
                                                      Icons.route,
                                                      color: primaryColor,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Align( alignment: Alignment.bottomRight, child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector( onTap: () {
                                          Provider.of<LayoutProvider>(context,listen: false).init(route);
                                          Provider.of<LayoutProvider>(context,listen: false).setPage(1);
                                        }, child: Text('Iniciar ruta' , style: TextStyle(color: primaryColor,),)),
                                      ),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: bloc.routes!.length,
                    )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ],
    );
  }
}
