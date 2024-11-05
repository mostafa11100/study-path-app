part of 'getinstracture_cubit.dart';

@immutable
sealed class GetinstractureState {}

final class Getinstractureloading extends GetinstractureState {}

final class Getinstracturesucces extends GetinstractureState {
  Instracturecourcesmodel model;
  Getinstracturesucces(this.model);
}

final class Getinstracturefail extends GetinstractureState {String eror;
Getinstracturefail(this.eror);}
