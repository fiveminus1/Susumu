import 'exercise.dart';

class Workout {
  final DateTime timestamp;
  final List<Exercise> exercises;

  Workout({
    required this.timestamp,
    required this.exercises
  });

  Map<String, dynamic> toMap(){ // object -> firebase
    return {
      'timestamp': timestamp.toIso8601String(),
      'exercises': exercises.map((exercise) => exercise.toMap()).toList(),
    };
  }

  factory Workout.fromMap(Map<String, dynamic> map){ // firebase -> object
    return Workout(
      timestamp: DateTime.parse(map['timestamp']),
      exercises: List<Exercise>.from(
        map['exercises'].map((exerciseMap) => Exercise.fromMap(exerciseMap)),
      ),
    );
  }

}