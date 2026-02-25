import 'package:flutter/material.dart';

class Miapp extends StatelessWidget {
  const Miapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(
          0xFFFDF9F1,
        ), // Fondo crema suave como el de la imagen
        appBar: AppBar(
          title: const Text(
            'Actividad 1\nCrea tu ProfileCard',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF4A78D0), // Azul de la cabecera
          toolbarHeight: 100,
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Diseña un widget ProfileCard que muestre la foto, nombre y rol del usuario.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
            const Divider(indent: 40, endIndent: 40),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                children: const [
                  ProfileCard(
                    name: "Carlos Pérez",
                    role: "Desarrollador Flutter",
                    imageUrl:
                        "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150",
                  ),
                  ProfileCard(
                    name: "Laura Gómez",
                    role: "Diseñadora UI/UX",
                    imageUrl:
                        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150",
                  ),
                  ProfileCard(
                    name: "Andrés Ruiz",
                    role: "Instructor de Fitness",
                    imageUrl:
                        "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;

  const ProfileCard({
    super.key,
    required this.name,
    required this.role,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(radius: 40, backgroundImage: NetworkImage(imageUrl)),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 4),
                // Línea decorativa debajo del nombre
                Container(
                  height: 2,
                  width: 40,
                  color: Colors.grey.withOpacity(0.3),
                ),
                const SizedBox(height: 4),
                Text(
                  role,
                  style: const TextStyle(color: Colors.black45, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
