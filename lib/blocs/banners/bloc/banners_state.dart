// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'banners_bloc.dart';

@immutable
abstract class BannersState {}

final class BannersInitial extends BannersState {}
final class LoadingBannersState extends BannersState {


}
final class LoadedBannersState extends BannersState{
  List<BannerModel> banners ;
  LoadedBannersState({
    required this.banners,
  });


}

final class ErrorBannersState extends BannersState{}

