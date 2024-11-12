import 'package:flutter/material.dart';
import 'models/exercise.dart';
import 'add_exercise_screen.dart';

class NewWorkoutScreen extends StatefulWidget{
  const NewWorkoutScreen({super.key});

  @override
  State<NewWorkoutScreen> createState() => _NewWorkoutScreenState();
}

class _NewWorkoutScreenState extends State<NewWorkoutScreen>{
  List<Exercise> exercises = [];

  void _addExercise(Exercise exercise){
    setState((){
      exercises.add(exercise);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('New Workout')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(exercises[index].name),
                  subtitle: Text(
                    'Sets: ${exercises[index].sets}, Reps: ${exercises[index].reps}'),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddExerciseScreen()),
              );
              if (result != null){
                _addExercise(result);
              }
            }, 
            child: const Text('Add Exercise'),
          ),
        ],
      ),
    );
  }
}