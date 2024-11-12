import 'package:flutter/material.dart';
import 'models/exercise.dart';

class AddExerciseScreen extends StatefulWidget{
  const AddExerciseScreen({super.key});

  @override
  State<AddExerciseScreen> createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen>{
  @override 
  Widget build(BuildContext context){
    final _formKey = GlobalKey<FormState>();
    String exerciseName = '';
    int sets = 0;
    int reps = 0;

    void _saveExercise(){
      if(_formKey.currentState!.validate()){
        _formKey.currentState!.save();
        final exercise = Exercise(name: exerciseName, sets: sets, reps: reps);
        Navigator.pop(context, exercise);
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Add Exercise')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Exercise Name'),
                onSaved: (value) => exerciseName = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Sets'),
                onSaved: (value) => sets = int.tryParse(value ?? '') ?? 0,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Reps'),
                onSaved: (value) => reps = int.tryParse(value ?? '') ?? 0,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveExercise,
                child: const Text('Save Exercise'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

