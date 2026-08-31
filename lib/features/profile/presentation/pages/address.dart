import 'package:ema_store/core/widget/custom_elevate_btn.dart';
import 'package:ema_store/core/widget/custom_inside_app_bar.dart';
import 'package:ema_store/core/widget/custom_loading.dart';
import 'package:ema_store/features/profile/presentation/manager/profile_state.dart';
import 'package:ema_store/features/profile/presentation/widgets/address_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../manager/profile_cubit.dart';
import '../widgets/add_address_bottom_sheet.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomInsideAppBar(title: "My Address"),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // Get Addresses
          if (state is ProfileGetLoadingState) {
            CustomLoadingDialog.show(context);
          } else if (state is ProfileGetSuccessState) {
            CustomLoadingDialog.hide(context);
          } else if (state is ProfileGetErrorState) {
            CustomLoadingDialog.hide(context);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: ColorManager.primary,
                content: Text('Failed to load addresses: ${state.message}',style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.white,
                ),),
              ),
            );
          }
          // Remove Address
          else if (state is ProfileRemoveLoadingState) {
            CustomLoadingDialog.show(context);
          } else if (state is ProfileRemoveSuccessState) {
            CustomLoadingDialog.hide(context);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: ColorManager.primary,
                content: Text(
                  'Address deleted successfully',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.white,
                  ),
                ),
              ),
            );
          } else if (state is ProfileRemoveErrorState) {
            CustomLoadingDialog.hide(context);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: ColorManager.primary,
                content: Text(
                  'Failed to delete address: ${state.message}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.white,
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          final addresses = context.read<ProfileCubit>().addresses;

          if (addresses.isEmpty) {
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  20.verticalSpace,
                  Text(
                    "You don't have any addresses yet.",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.black,
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    "Add a new address to make your shopping experience easier.",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  30.verticalSpace,
                  CustomElevateBtn(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => BlocProvider.value(
                          value: context.read<ProfileCubit>(),
                          child: const AddAddressBottomSheet(),
                        ),
                      );
                    },
                    text: "Add New Address",
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: addresses.length,
            itemBuilder: (context, index) {
              final address = addresses[index];
              return AddressContainer(
                address: address,
                onDelete: () {
                  context.read<ProfileCubit>().removeAddress(
                    addressId: address.id!,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
