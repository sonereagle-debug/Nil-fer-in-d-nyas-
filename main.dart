import 'package:flutter/material.dart';

void main() => runApp(const NiluferApp());

const pink = Color(0xFFFF72A7);
const purple = Color(0xFF9C7AE8);
const blue = Color(0xFF62BCEB);
const green = Color(0xFF68C98A);
const cream = Color(0xFFFFF7F1);

class NiluferApp extends StatelessWidget {
  const NiluferApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Nilüfer'in Dünyası",
    theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: pink)),
    home: const HomePage(),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFE7F1), Color(0xFFE8DFFF), Color(0xFFDFF6FF)],
          begin: Alignment.topLeft, end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            const SizedBox(height: 10),
            const Text("🌸", style: TextStyle(fontSize: 54)),
            const Text("Nilüfer'in Dünyası", textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFF7A4D9E))),
            const Text("Renkli dünyanı keşfet!", style: TextStyle(fontSize: 17, color: Color(0xFF765F7E))),
            const SizedBox(height: 20),
            Container(
              height: 240, width: double.infinity,
              decoration: BoxDecoration(color: Colors.white.withOpacity(.68), borderRadius: BorderRadius.circular(34)),
              child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("🎀", style: TextStyle(fontSize: 30)),
                Text("👧", style: TextStyle(fontSize: 105)),
                Text("🐱  Nilüfer'in sevimli dostu", style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
            ),
            const SizedBox(height: 20),
            _button(context, "👗", "Karakterimi Giydir", pink, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DressPage()))),
            _button(context, "🏠", "Odamı Dekore Et", blue, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RoomPage()))),
            _button(context, "🎮", "Oyna", green, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GamePage()))),
          ]),
        ),
      ),
    ),
  );

  Widget _button(BuildContext c, String icon, String title, Color color, VoidCallback onTap) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: SizedBox(width: double.infinity, height: 68, child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(backgroundColor: color, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22))),
      child: Row(children: [
        Text(icon, style: const TextStyle(fontSize: 28)),
        const SizedBox(width: 15),
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios_rounded, size: 18),
      ]),
    )),
  );
}

class DressPage extends StatefulWidget {
  const DressPage({super.key});
  @override State<DressPage> createState() => _DressPageState();
}
class _DressPageState extends State<DressPage> {
  int selected = 0;
  final outfits = ["🌸 Günlük Elbise", "👚 Tişört + Etek", "🛌 Pijama", "✨ Parti Elbisesi", "🩷 Kapüşonlu Takım"];
  final icons = ["🎀","👗","🩷","✨","🧥"];
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: cream,
    appBar: AppBar(title: const Text("Kıyafetler"), backgroundColor: pink, foregroundColor: Colors.white),
    body: Padding(
      padding: const EdgeInsets.all(18),
      child: Column(children: [
        Container(height: 250, width: double.infinity,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(icons[selected], style: const TextStyle(fontSize: 76)),
            const Text("👧", style: TextStyle(fontSize: 82)),
            Text(outfits[selected], style: const TextStyle(fontWeight: FontWeight.bold, color: purple)),
          ])),
        ),
        const SizedBox(height: 15),
        Expanded(child: GridView.builder(
          itemCount: outfits.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.55, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (_, i) => InkWell(
            onTap: () => setState(() => selected = i),
            child: Container(
              decoration: BoxDecoration(color: i == selected ? const Color(0xFFFFD5E5) : Colors.white, borderRadius: BorderRadius.circular(18),
                border: Border.all(color: i == selected ? pink : Colors.transparent, width: 3)),
              child: Center(child: Text(outfits[i], textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold))),
            ),
          ),
        )),
        SizedBox(width: double.infinity, child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(backgroundColor: green, foregroundColor: Colors.white),
          child: const Text("✓ Onayla ve Kaydet"),
        )),
      ]),
    ),
  );
}

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});
  @override State<RoomPage> createState() => _RoomPageState();
}
class _RoomPageState extends State<RoomPage> {
  int selected = 0;
  final items = ["🛏️","🪑","🧸","🌷","🖼️","🌱","🧺"];
  final names = ["Yataklar","Masalar","Oyuncaklar","Bitkiler","Posterler","Dolaplar","Halılar"];
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFFF4EAFE),
    appBar: AppBar(title: const Text("Odamı Dekore Et"), backgroundColor: blue, foregroundColor: Colors.white),
    body: Column(children: [
      Expanded(child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFFFFE7EF), Color(0xFFE5D7FF)]),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(children: [
          const Positioned(top: 20, left: 25, child: Text("🪟", style: TextStyle(fontSize: 48))),
          const Positioned(top: 25, right: 30, child: Text("🌿", style: TextStyle(fontSize: 42))),
          const Positioned(bottom: 70, left: 30, child: Text("🛏️", style: TextStyle(fontSize: 105))),
          Positioned(bottom: 45, right: 25, child: Text(items[selected], style: const TextStyle(fontSize: 70))),
          const Positioned(bottom: 15, left: 0, right: 0, child: Center(child: Text("Nilüfer'in odası", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)))),
        ]),
      )),
      SizedBox(height: 105, child: ListView.builder(
        scrollDirection: Axis.horizontal, itemCount: items.length,
        itemBuilder: (_, i) => GestureDetector(
          onTap: () => setState(() => selected = i),
          child: Container(width: 90, margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            decoration: BoxDecoration(color: i == selected ? const Color(0xFFFFD5E5) : Colors.white, borderRadius: BorderRadius.circular(18)),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(items[i], style: const TextStyle(fontSize: 30)),
              Text(names[i], textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
            ]),
          ),
        ),
      )),
      Padding(padding: const EdgeInsets.fromLTRB(16, 0, 16, 14), child: SizedBox(width: double.infinity,
        child: ElevatedButton(onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(backgroundColor: green, foregroundColor: Colors.white),
          child: const Text("💾 Odamı Kaydet")))),
    ]),
  );
}

class GamePage extends StatelessWidget {
  const GamePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFFFFF5DA),
    appBar: AppBar(title: const Text("Oyna"), backgroundColor: green, foregroundColor: Colors.white),
    body: Center(child: Padding(padding: const EdgeInsets.all(24), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text("🎯", style: TextStyle(fontSize: 90)),
      const Text("Yıldızları Topla!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: purple)),
      const SizedBox(height: 12),
      const Text("Nilüfer'in mini oyunları burada olacak.", textAlign: TextAlign.center, style: TextStyle(fontSize: 17)),
      const SizedBox(height: 25),
      ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: pink, foregroundColor: Colors.white), child: const Text("Başla 🎮")),
    ])),
  );
}
