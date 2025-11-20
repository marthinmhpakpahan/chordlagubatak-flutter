class Chord {
  final String id;
  final String name;
  final Map<String, String> positions; // {"E6": "x", "A5": "3", ...}
  final List<Map<String, String>> alternativeShapes;

  Chord({
    required this.id,
    required this.name,
    required this.positions,
    required this.alternativeShapes,
  });

  factory Chord.fromMap(Map<String, dynamic> data, String documentId) {
    return Chord(
      id: documentId,
      name: data['name'] ?? '',
      positions: Map<String, String>.from(data['positions'] ?? {}),
      alternativeShapes: List<Map<String, String>>.from(
        data['alternativeShapes'] ?? [],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'positions': positions,
      'alternativeShapes': alternativeShapes,
    };
  }

  Chord copyWith({
    String? name,
    Map<String, String>? positions,
    List<Map<String, String>>? alternativeShapes,
  }) {
    return Chord(
      id: id,
      name: name ?? this.name,
      positions: positions ?? this.positions,
      alternativeShapes: alternativeShapes ?? this.alternativeShapes,
    );
  }
}
