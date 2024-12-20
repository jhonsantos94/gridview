import 'package:flutter/material.dart';
import 'package:gridview/views/detalles_coches.dart';
import '../controller/coche_controller.dart';

class VistaCoches extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VistaCochesState();
}

class VistaCochesState extends State<VistaCoches> {
  final CocheController _controller = CocheController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo GridView'),
        backgroundColor: Colors.cyan,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: _controller.coches.length,
        itemBuilder: (context, index) {
          final item = _controller.coches[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetallesCoche(coche: item),
                ),
              );
            },
            child: Card(
              color: Colors.cyan,
              elevation: 3.0,
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Image.asset(
                        item.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Divider(color: Colors.white),
                    Text(
                      item.modelo,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      item.marca,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
