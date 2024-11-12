import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/exercise.dart';
import 'models/workout.dart';
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

  Future<void> _saveWorkout() async{
    final workout = Workout(
      timestamp: DateTime.now(),
      exercises: exercises,
    );

    //print("Workout saved: ${workout.toMap()}");
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
                return Dismissible(
                  key: ValueKey(exercises[index]),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    setState((){
                      exercises.removeAt(index);
                    });
                  },
                  child: ListTile(
                    title: Text(exercises[index].name),
                    subtitle: Text(
                      'Sets: ${exercises[index].sets}, Reps: ${exercises[index].reps}'),
                  ),
                );
              },
            ),
          ),
          ElevatedButton( // add exercise button
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
          ElevatedButton( // save workout button
            onPressed: _saveWorkout, 
            child: const Text('Save Workout'),
          ),
        ],
      ),
    );
  }
}