class Exercise{
  final String name;
  final int sets;
  final int reps;

  Exercise({
    required this.name, 
    required this.sets, 
    required this.reps
  });

  Map<String, dynamic> toMap(){ // object -> firebase 
    return {
      'name': name,
      'sets': sets,
      'reps': reps,
    };
  }

  factory Exercise.fromMap(Map<String, dynamic> map){ // firebase -> object
    return Exercise(name: map['names'], sets: map['sets'], reps: map['reps']);
  }
}