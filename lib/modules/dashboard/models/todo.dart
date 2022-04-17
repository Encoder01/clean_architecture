class TodoModel{
  var id;
  var todo;

  TodoModel({this.id,this.todo});

  factory TodoModel.fromJson(Map<String,dynamic> json)=> TodoModel(id: json['id'],todo: json['todo']);

  toJson()=> {
    ['id']:id,
    ['todo']:todo,
  };
}