part of dartlero_todo;

class TaskModel extends ConceptModel {

  // Class members
  static final String task = 'Task';

  // Fill Tasks class with a map
  Map<String, ConceptEntities> newEntries() {
    var tasks = new Tasks();
    var map = new Map<String, ConceptEntities>();
    map[task] = tasks;
    return map;
  }

  // Getter for Tasks
  Tasks get tasks => getEntry(task);
  
  // Complete all tasks in Tasks
  void completeAllTasks() {
    tasks.completeAllTasks();
  }
  
  // Count all non-completed in Tasks (not including deleted)
  int countNonCompTasks() {
    tasks.countNonCompTasks();
  }
  
  // Count all Tasks (not including deleted)
  int countTasks() {
    tasks.countTasks();
  }
  
  // Count all completed in Tasks (not including deleted)
  int countCompTasks() {
    tasks.countCompTasks();
  }

  // Initial sample
  void init() {
    var design = new Task();
    design.name = 'Make Dartling Design';
    design.code = tasks.length.toString();
    tasks.add(design);

    var prototype = new Task();
    prototype.name = 'Make Dartling Prototype';
    design.code = tasks.length.toString();
    prototype.isCompleted = true;
    tasks.add(prototype);
    
    var marketing = new Task();
    marketing.name = 'Plan Dartling Marketing Campaing';
    design.code = tasks.length.toString();
    marketing.isCompleted = true;
    marketing.deleteTask();
    tasks.add(marketing);

    var production = new Task();
    production.name = 'Dartling';
    design.code = tasks.length.toString();
    production.isCompleted = false;
    tasks.add(production);
  }

  // Print function
  void display() {
    print('Tasks Model');
    print('=============');
    tasks.display('Tasks');
    print(
      '============= ============= ============= '
      '============= ============= ============= '
    );
  }

}


