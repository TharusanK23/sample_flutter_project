import 'package:eStore/routes/index.dart';

class ProfileView extends StatelessWidget {
  static const routeName = '/profile-view';
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
              top: true,
              child: Scaffold(
                  body: SingleChildScrollView(
                child: Column(
                  children: [_ProfileBlocPart()],
                ),
              )));
        },
        onModelReady: (model) {
          model.initialise(context: context);
        },
        viewModelBuilder: () => ProfileViewModel());
  }
}

class _ProfileBlocPart extends ViewModelWidget<ProfileViewModel> {
  _ProfileBlocPart({Key key}) : super(key: key, reactive: false);
  @override
  Widget build(BuildContext context, ProfileViewModel model) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState profileState) {
        model.setProfileLoad(isNotify: false, profileState: profileState, context: context);
        return _ProfileBodyPart();
      },
      listener: (BuildContext context, ProfileState profileState) {
        model.setProfileLoad(isNotify: true, profileState: profileState, context: context);
      },
    );
  }
}

class _ProfileBodyPart extends ViewModelWidget<ProfileViewModel> {
  _ProfileBodyPart({Key key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, ProfileViewModel model) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      highlightColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.only(left: Sizes.PADDING_16, top: Sizes.PADDING_24, right: Sizes.PADDING_16),
        child: Column(
          children: [
            Visibility(
              visible: model.isEdit,
              child: Text(
                "Edit Profile",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            SpaceH14(),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(spreadRadius: 2, blurRadius: 10, color: Colors.black.withOpacity(0.1), offset: Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: model.image != null
                                ? FileImage(model.image)
                                : NetworkImage(
                                    "https://www.pngitem.com/pimgs/m/22-220721_circled-user-male-type-user-colorful-icon-png.png",
                                  ))),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: model.isEdit ? () => model.openImageUpload(context: context) : () => model.changeToEdit(context),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: AppColors.brand,
                          ),
                          child: Icon(
                            model.isEdit ? Icons.camera_alt : Icons.edit,
                            color: AppColors.black,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            SpaceH34(),
            buildTextField(model, "First Name", "First Name", false, model.firstNameCtrl, !model.isEdit),
            buildTextField(model, "Last Name", "Last Name", false, model.lastNameCtrl, !model.isEdit),
            buildTextField(model, "E-mail", "E-mail", false, model.emailCtrl, !model.isEdit),
            buildTextField(model, "Phone number", "Phone number", false, model.phoneCtrl, true),
            Visibility(
              visible: model.isEdit,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.PADDING_52 - 2, vertical: Sizes.PADDING_8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.RADIUS_20)),
                    onPressed: () => model.changeToEdit(context),
                    child: Text("CANCEL", style: TextStyle(fontSize: 14, letterSpacing: 2.2, color: AppColors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: AppColors.brand,
                    padding: EdgeInsets.symmetric(horizontal: Sizes.PADDING_52 - 2, vertical: Sizes.PADDING_10),
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.RADIUS_20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(fontSize: 14, letterSpacing: 2.2, color: AppColors.black),
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: !model.isEdit,
              child: Center(
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.PADDING_40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.RADIUS_20)),
                  onPressed: () => model.logOut(context),
                  child: Text("SIGN OUT", style: TextStyle(fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(ProfileViewModel model, String labelText, String placeholder, bool isPasswordTextField,
      TextEditingController controller, bool readOnly) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Sizes.PADDING_36),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        obscureText: isPasswordTextField ? true : false,
        style:
            Styles.customMediumTextStyle(color: AppColors.brandFont, fontWeight: FontWeight.w500, fontSize: Sizes.TEXT_SIZE_16),
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField && model.isEdit
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: Sizes.PADDING_2),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: Styles.customMediumTextStyle(
              color: AppColors.grey.withOpacity(0.5), fontWeight: FontWeight.w500, fontSize: Sizes.TEXT_SIZE_16),
        ),
      ),
    );
  }
}
