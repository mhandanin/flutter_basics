class Jour {
  String nom;
  String description;

  Jour(this.nom, this.description);

  void showTasks() {
    print("jour: $nom\nTasks: $description");
  }
}
