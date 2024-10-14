import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/validation/email_validation.dart';

export 'src/validation/email_validation.dart';

part 'src/bloc/bloc.dart';
part 'src/event/event.dart';
part 'src/newsletter_repository.dart';
part 'src/state/state.dart';
