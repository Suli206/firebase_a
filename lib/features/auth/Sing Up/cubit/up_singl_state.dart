part of 'up_singl_cubit.dart';

@freezed
class UpSinglState with _$UpSinglState {
  const factory UpSinglState.initial() = _Initial;
  const factory UpSinglState.error(String error) = _Error;
  const factory UpSinglState.success() = _Success;
}
