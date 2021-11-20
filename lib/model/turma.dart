class Turma {
  final int id;
  final String nome;
  final double nota1;
  final double nota2;

  const Turma({
    required this.id,
    required this.nome,
    this.nota1 = 0.00,
    this.nota2 = 0.00,
  });
  Turma copy({
    int? id,
    String? nome,
    double? nota1,
    double? nota2,
  }) =>
      Turma(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        nota1: nota1 ?? this.nota1,
        nota2: nota2 ?? this.nota2,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Turma &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          nome == other.nome &&
          nota1 == other.nota1 &&
          nota2 == other.nota2;

  @override
  int get hashCode =>
      id.hashCode ^ nome.hashCode ^ nota1.hashCode ^ nota2.hashCode;
}
