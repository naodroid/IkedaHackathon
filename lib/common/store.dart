

abstract class Store<T> {
  List<StateObserver<T>> _observers = new List<StateObserver<T>>();

  void addObserver(StateObserver<T> observer) {
    _observers.add(observer);
  }
  void removeObserver(StateObserver<T> observer) {
    _observers.remove(observer);
  }
  void notifyChanged(T state) {
    _observers.forEach((StateObserver<T> o) => o.onStateUpdated(state));
  }
}

abstract class StateObserver<T> {
  void onStateUpdated(T state);
}