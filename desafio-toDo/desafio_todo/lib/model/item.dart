class ToDo {
  String? id;
  String? todoText;
  bool feito;

  ToDo({
    required this.id,
    required this.todoText,
    this.feito = false,
  });

  static List<ToDo> todoLista() {
    return [
      ToDo(id: '01', todoText: 'Escovar os dentes', feito: true),
      ToDo(id: '02', todoText: 'Aprender Flutter', feito: false),
      ToDo(id: '03', todoText: 'Sem bool'),
    ];
  }
}
