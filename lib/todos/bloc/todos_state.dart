part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();
}

class TodosInitial extends TodosState {
  @override
  List<Object> get props => [];
}

class TodosLoadedState extends TodosState {
  final List<Task> tasks;

  const TodosLoadedState(this.tasks);

  @override
  List<Object?> get props => [tasks];

}