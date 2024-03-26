import 'package:esperar_drivers/core/const/colors.dart';
import 'package:esperar_drivers/core/const/navigate.dart';
import 'package:esperar_drivers/domain/blocs/drawer.dart';
import 'package:esperar_drivers/domain/blocs/layout.dart';
import 'package:esperar_drivers/domain/blocs/pop_ups.dart';
import 'package:esperar_drivers/domain/repositories/local_storage.dart';
import 'package:esperar_drivers/ui/chat/chat.dart';
import 'package:esperar_drivers/ui/map/map.dart';
import 'package:esperar_drivers/ui/routes/routes.dart';
import 'package:esperar_drivers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen._();

  static Widget init(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DrawerProvider(
            localStorageInterface:
                Provider.of<LocalStorageInterface>(context, listen: false),
          )..init(),
        ),
        ChangeNotifierProvider(
          create: (context) => LayoutProvider(
            Provider.of<LocalStorageInterface>(context,listen: false)
          ),
        )
      ],
      builder: (context, child) => const LayoutScreen._(),
    );
  }

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Provider.of<DrawerProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LayoutProvider>(context);
    List<Widget> pages = [
RoutesScreen.init(context), MapScreen(), ChatScreen()
    ];
    List<String> title = ['Rutas', 'Mapa', 'Chats'];

    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
                child: Column(
              children: [
                AppBarCustom(
                  action: GestureDetector(
                      onTap: () => _scaffoldKey.currentState?.openDrawer(),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.menu),
                      )),
                  title: Text(
                    title.elementAt(bloc.getPage()),
                    style: const TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(child: pages.elementAt(bloc.getPage())),
                BottomNavigationBar(
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.route_outlined,
                      ),
                      label: 'Rutas',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.map_rounded),
                      label: 'Mapa',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.message,
                      ),
                      label: 'Chats',
                    ),
                  ],
                  onTap: (value) => bloc.setPage(value),
                  currentIndex: bloc.getPage(),
                  elevation: 1,
                  backgroundColor: Colors.white,
                  selectedItemColor: primaryColor,
                  unselectedItemColor: Colors.grey,
                ),
              ],
            )),
            const Positioned.fill(child: PopUps()),
          ],
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bloc = Provider.of<DrawerProvider>(context);

    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => pop(context, null),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.close),
                    ),
                  ),
                ),
                Container(
                  width: size.width > 500 ? 300 : 150,
                  height: size.width > 500 ? 300 : 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      shape: BoxShape.circle),
                ),
                const SizedBox(height: 10),
                if (bloc.user != null)
                  Text(
                    bloc.user!.email ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: primaryColor,
                    ),
                  )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  ButtonCustom(
                    text: 'Cerrar sesión',
                    onTap: () {
                      pop(context, null);
                      Provider.of<PopUpsProvider>(context, listen: false)
                          .setCloseSession();
                    },
                    background: primaryColor,
                    color: Colors.white,
                    borderColor: primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
