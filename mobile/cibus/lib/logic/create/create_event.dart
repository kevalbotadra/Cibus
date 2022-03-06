import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CreateEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateDonation extends CreateEvent {
  final String title;
  final String body;
  final File image;
  final String location;
  final double weight;

  CreateDonation({
    required this.title,
    required this.body,
    required this.image,
    required this.location,
    required this.weight,
  });
}
