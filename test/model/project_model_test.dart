import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import 'package:dartlero_todo/dartlero_todo.dart';

testTasks(Tasks tasks) {
  group("Testing Tasks", () {
    setUp(() {
      var tasksCount = 0;
      expect(tasks.countTasks(), equals(tasksCount));
      
      var design = new Task();
      design.name = 'Make Dartling Design';
      design.code = tasks.length.toString();
      tasks.add(design);

      var prototype = new Task();
      prototype.name = 'Make Dartling Prototype';
      prototype.code = tasks.length.toString();
      prototype.isCompleted = true;
      tasks.add(prototype);
      
      var marketing = new Task();
      marketing.name = 'Plan Dartling Marketing Campaing';
      marketing.code = tasks.length.toString();
      marketing.isCompleted = true;
      marketing.deleteTask();
      tasks.add(marketing);

      var production = new Task();
      production.name = 'Dartling';
      production.code = tasks.length.toString();
      production.isCompleted = false;
      tasks.add(production);

    });
    
    // Remove all previously created tasks
    tearDown(() {
      tasks.clear();
      expect(tasks.isEmpty, isTrue);
    });
    
    // Test : Add a task
    test('Add Task', () {
      // Add task
      var task = new Task();
      expect(task, isNotNull);
      task.name = 'Write unit tests for SIO-6014';
      task.code = tasks.length.toString();
      
      // Validation
      var added = tasks.add(task);
      expect(added, isTrue);
      tasks.display('Add Task');
    });
    
    // Test : Delete a task
    test('Delete Task', () {
      // Record current task count
      var oldTasksCount = tasks.countTasks();
      
      // Create new task
      var task = new Task();
      task.name = 'Mark this task as deleted';
      task.code = tasks.length.toString();
      tasks.add(task);
      
      // Validate creation
      expect(task, isNotNull);
      var newTasksCount = tasks.countTasks();
      var isValidated = false;
      if (newTasksCount != oldTasksCount) {
        isValidated = true;
      }
      expect(isValidated, isTrue);
      
      // Delete task
      task.deleteTask();
      
      // Validation
      newTasksCount = tasks.countTasks();
      isValidated = false;
      if (newTasksCount == oldTasksCount){
        isValidated = true;
      }
      expect(isValidated, isTrue);
      tasks.display('Delete Task');
    });
    
    // Test : Complete a task
    test('Complete Task', () {
      // Create new task
      var task = new Task();
      task.name = 'Mark this task as completed';
      task.code = tasks.length.toString();
      tasks.add(task);
      
      // Validate creation
      expect(task, isNotNull);
      
      // Complete task
      task.completeTask();
      
      // Validation
      expect(task.isCompleted, isTrue);
      tasks.display('Complete Task');
    });
    
    // Test : Reset a task
    test('Reset Task', () {
      // Create new task
      var task = new Task();
      task.name = 'Reset this task';
      task.code = tasks.length.toString();
      task.isCompleted = true;
      tasks.add(task);
      
      // Validate creation
      expect(task, isNotNull);
      
      // Reset task
      task.resetTask();
      
      // Validation
      expect(task.isCompleted, isFalse);
      tasks.display('Reset Task');
    });
    
    // Testing the export to JSON
    test('From Tasks to JSON', () {
      var json = tasks.toJson();
      expect(json, isNotNull);
      print(json);
    });
    
    // Testing the reload from JSON
    test('From JSON to Task Model', () {
      List<Map<String, Object>> json = tasks.toJson();
      tasks.clear();
      expect(tasks.isEmpty, isTrue);
      tasks.fromJson(json);
      expect(tasks.isEmpty, isFalse);
      tasks.display('From JSON to Tasks');
    });
    
    // Test : Complete all tasks
    test('Complete all tasks', () {
      // Validate that we have at least one task non-completed and non-deleted
      var oldTasksCount = tasks.countNonCompTasks();
      var isValidated = false;
      if (oldTasksCount > 0){
        isValidated = true;
      }
      expect(isValidated, isTrue);
      
      // Complete all tasks
      tasks.completeAllTasks();
      
      // Validation
      var newTasksCount = tasks.countNonCompTasks();
      isValidated = false;
      if (newTasksCount != oldTasksCount){
        isValidated = true;
      }
      expect(isValidated, isTrue);
      tasks.display('Reset Task');
    });
  });
}

initDisplayModel() {
  TaskModel taskModel = new TaskModel();
  taskModel.init();
  taskModel.display();
}

testModel() {
  TaskModel taskModel = new TaskModel();
  Tasks tasks = taskModel.tasks;
  testTasks(tasks);
}

main() {
  initDisplayModel();
  testModel();
}
