part of 'in_singl_cubit.dart';

@freezed
class InSinglState with _$InSinglState {
  const factory InSinglState.initial() = _Initial;
  const factory InSinglState.error(String error) = _Error;
  const factory InSinglState.success() = _Success;
}
