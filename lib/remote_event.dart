abstract class RemoteEvent{
}
class IncrementEvent extends RemoteEvent{
  final int increment;
  IncrementEvent({required this.increment});
}
class DecrementEvent extends RemoteEvent{
  final int decrement;
  DecrementEvent({required this.decrement});
}
class MuteEvent extends RemoteEvent{}