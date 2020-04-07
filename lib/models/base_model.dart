abstract class BaseModel<T> {
  T id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is BaseModel &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;


}