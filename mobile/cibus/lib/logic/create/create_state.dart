import 'package:equatable/equatable.dart';

abstract class CreateState extends Equatable {
  const CreateState();

  @override
  List<Object> get props => [];
}

class InitalCreateState extends CreateState {}

class DonationCreated extends CreateState {}


