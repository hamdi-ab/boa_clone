import 'package:boa_clone/core/auth_state.dart';
import 'package:boa_clone/features/auth/viewmodel/sign_in_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(create: (_) => AuthState()),
  ChangeNotifierProvider(create: (context) => SignInViewModel()),
];