import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_staggered_grid_view/src/widgets/staggered_grid_tile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/lucky_draw.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber),
            ),
            Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/book_test_drive.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber),
            ),
            Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/book_serices.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber),
            ),
            Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/ths.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber),
            ),
            Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/catalog.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber),
            ),
            Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/calculator.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber),
            ),
            Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/claim_insurance.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber),
            ),
            Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/service_berkala.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber),
            ),
            Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/tipsandtrick.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber),
            ),
            Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/tradein.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber),
            ),
            Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/dealer_location.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber),
            ),
          ],
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
        ),
      )),
    );
  }
}
