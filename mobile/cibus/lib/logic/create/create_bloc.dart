import 'package:bloc/bloc.dart';
import 'package:cibus/data/providers/auth_provider.dart';
import 'package:cibus/data/repositories/create_repository.dart';
import 'package:cibus/logic/auth/auth_event.dart';
import 'package:cibus/logic/auth/auth_state.dart';
import 'package:cibus/logic/create/create_event.dart';
import 'package:cibus/logic/create/create_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateBloc extends Bloc<CreateEvent, CreateState> {
  final CreateRepository _createRepository;

  CreateBloc(CreateRepository createRepository)
      : _createRepository = createRepository,
        super(InitalCreateState());

  @override
  Stream<CreateState> mapEventToState(CreateEvent event) async* {
    if (event is CreateDonation) {
      await _createRepository.createPost(
          title: event.title,
          body: event.body,
          image: event.image,
          location: event.location,
          weight: event.weight);
      yield DonationCreated();
    }
  }
}
