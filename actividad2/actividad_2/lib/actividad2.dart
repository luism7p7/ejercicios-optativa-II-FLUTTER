import 'package:flutter/material.dart';

// Modelo de datos para los ejercicios
class Exercise {
  final String title;
  final String imageUrl;

  Exercise({required this.title, required this.imageUrl});
}

class Miapp2 extends StatelessWidget {
  const Miapp2({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de datos
    final List<Exercise> exercises = [
      Exercise(
        title: "Push Ups",
        imageUrl:
            "https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?w=200",
      ),
      Exercise(
        title: "Squats",
        imageUrl:
            "https://images.unsplash.com/photo-1574680096145-d05b474e2158?w=200",
      ),
      Exercise(
        title: "Dumbbell Rows",
        imageUrl:
            "https://www.bing.com/images/search?view=detailV2&ccid=1C0P9AJy&id=2C04D1D4ECF0492FED3D181EC03E6666EE4D8449&thid=OIP.1C0P9AJyj_NxryP28kYj3gHaDp&mediaurl=https%3a%2f%2fwww.puregym.com%2fmedia%2fhtyfe25b%2fsingle-arm-dumbbell-row.jpg%3fquality%3d80&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.d42d0ff402728ff371af23f6f24623de%3frik%3dSYRN7mZmPsAeGA%26pid%3dImgRaw%26r%3d0&exph=1233&expw=2500&q=dumbbell+rows&FORM=IRPRST&ck=A002DFF500706AD6273D6F2601B99877&selectedIndex=4&itb=0",
      ),
      Exercise(
        title: "Sit Ups",
        imageUrl:
            "https://images.unsplash.com/photo-1594824476967-48c8b964273f?w=200",
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFDF9F1), // Fondo crema
        appBar: AppBar(
          title: const Text(
            'Actividad 2\nLista de ExerciseCard',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF6A1B9A), // Púrpura de la imagen
          toolbarHeight: 100,
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Construye una lista de ejercicios usando\nListView.builder.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Divider(indent: 40, endIndent: 40),
            Expanded(
              // Uso de ListView.builder solicitado
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  return ExerciseCard(exercise: exercises[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;

  const ExerciseCard({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            // Imagen del ejercicio
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                exercise.imageUrl,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
                // Manejo de error para web
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 120,
                  height: 80,
                  color: Colors.grey,
                  child: const Icon(Icons.fitness_center),
                ),
              ),
            ),
            const SizedBox(width: 15),
            // Título
            Expanded(
              child: Text(
                exercise.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            // Botón Iniciar
            ElevatedButton(
              onPressed: () {
                // Lógica del SnackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('¡Ejercicio: ${exercise.title}!'),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: const Color(0xFF5E35B1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5E35B1),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('INICIAR'),
            ),
          ],
        ),
      ),
    );
  }
}
