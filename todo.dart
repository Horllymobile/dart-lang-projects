void main() {
  Todo todo = Todo([]);

  todo.addTodo(TodoItem('1', "Go to the market", Status.PENDING));
  todo.addTodo(TodoItem('2', "Code and sleep", Status.PENDING));

  todo.updateTodoStatus('1', Status.IN_PROGRESS);

  for (var todo in todo.todos) {
    print("-------------------------------------------------------");
    print("Title: ${todo.title}");
    print("Status: ${todo.status.name.toUpperCase()}");
    print("-------------------------------------------------------");
  }
}

class TodoItem {
  String id;
  String title;
  Status status;
  TodoItem(this.id, this.title, this.status);

  get getTitle {
    return this.title;
  }

  set setTitle(String title) {
    if (!title.isEmpty) {
      this.title = title;
    } else {
      throw Error();
    }
  }

  get getStatus {
    return this.status;
  }

  set updateStatus(Status status) {
    this.status = status;
  }
}

class Todo {
  List<TodoItem> todos;

  Todo(this.todos);

  void addTodo(TodoItem item) {
    var todo = this.todos.where((element) => element.id == item.id);
    if (!todo.isEmpty) {
      throw Error();
    } else {
      this.todos.add(item);
    }
  }

  TodoItem getTodoItem(String id) {
    var todo = this.todos.where((element) => element.id == id);
    if (!todo.isEmpty) {
      throw Error();
    }
    return todo.first;
  }

  void updateTodoStatus(String id, Status status) {
    var todo = this.todos.where((element) => element.id == id);
    if (todo.isEmpty) {
      throw Error();
    }
    todo.first.updateStatus = status;
  }

  @override
  String toString() {
    return todos.toString();
  }
}

enum Status { PENDING, IN_PROGRESS, DONE }
