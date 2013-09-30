part of dartlero_todo;

class Task extends ConceptEntity<Task> {

  // Class members
  String _code;
  String _name;
  bool isCompleted = false; //Defaults to false
  bool _isDeleted = false; //Defaults to false + This is a soft delete in case the client clicked on delete by error
  
  // Constructor
  Task newEntity() => new Task();
  
  // Getsetter for the code
  String get code => _code;
  set code(String value) {
    _code = value;
  }
  
  // Getsetter for the name
  String get name => _name;
  set name(String value) {
    _name = value;
  }
  
  // Getter for the isDeleted
  bool get isDeleted => _isDeleted;
  
  // Complete a task by setting isComplete to true
  void completeTask() {
    isCompleted = true;
  }
  
  // Reset a task by setting isComplete to false
  void resetTask() {
    isCompleted = false;
  }
  
  // Delete a task by setting isDeleted to true
  // No turning back
  void deleteTask() {
    _isDeleted = true;
  }

  // Print task information
  String toString() {
    return '  {\n '
           '    name: ${name}, \n '
           '    completed: ${isCompleted}, \n '
           '    deleted: ${_isDeleted}\n'
           '  }';
  }

  // Export to JSON
  Map<String, Object> toJson() {
    Map<String, Object> entityMap = super.toJson();
    entityMap['name'] = name;
    entityMap['isCompleted'] = isCompleted;
    entityMap['isDeleted'] = _isDeleted;
    return entityMap;
  }

  // Import from JSON
  void fromJson(Map<String, Object> entityMap) {
    super.fromJson(entityMap);
    name = entityMap['name'];
    isCompleted = entityMap['isCompleted'];
    _isDeleted = entityMap['isDeleted'];
  }

}

class Tasks extends ConceptEntities<Task> {

  Tasks newEntities() => new Tasks();
  Task newEntity() => new Task();
  
  // Getter for Tasks
  Task getTask(int inIntTask) {
    return find(inIntTask.toString());
  }
  
  // Complete all tasks
  completeAllTasks(){
    for (int i = 0; i < this.length; i++){
      this.getTask(i).completeTask();
    }
  }
  
  // Count all non-completed tasks (and non-deleted)
  int countNonCompTasks(){
    int countNonCompTasks = 0;
    for (int i = 0; i < this.length; i++){
      if (this.getTask(i).isCompleted == true && this.getTask(i).isDeleted == false) {
        countNonCompTasks++;
      }
    }
    return countNonCompTasks;
  }
  
  // Count all tasks (and non-deleted)
  int countTasks(){
    int countTasks = 0;
    for (int i = 0; i < this.length; i++){
      if (this.getTask(i).isDeleted == false) {
        countTasks++;
      }
    }
    return countTasks;
  }
  
  // Count all completed tasks (and non-deleted)
  int countCompTasks(){
    return countTasks() - countNonCompTasks();
  }
}
