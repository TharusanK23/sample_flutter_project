import 'package:eStore/routes/index.dart';

class ProfileViewModel extends BaseViewModel {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameCtrl = new TextEditingController();
  TextEditingController _lastNameCtrl = new TextEditingController();
  TextEditingController _emailCtrl = new TextEditingController();
  TextEditingController _phoneCtrl = new TextEditingController();
  ApiHandleModel _apiHandler = new ApiHandleModel(isEmpty: false, isError: false, isLoaded: false);
  ErrorModel errorModel;
  Customer _customer;
  bool _isEdit = false;
  File _image;

  GlobalKey get formKey => _formKey;
  TextEditingController get firstNameCtrl => _firstNameCtrl;
  TextEditingController get lastNameCtrl => _lastNameCtrl;
  TextEditingController get emailCtrl => _emailCtrl;
  TextEditingController get phoneCtrl => _phoneCtrl;
  ApiHandleModel get apiHandler => _apiHandler;
  Customer get customer => _customer;
  bool get isEdit => _isEdit;
  File get image => _image;

// Screen initialise
  Future<void> initialise({@required BuildContext context}) async {
    _firstNameCtrl.text = "Loading...";
    _lastNameCtrl.text = "Loading...";
    _emailCtrl.text = "Loading...";
    _phoneCtrl.text = "Loading...";
    String customerId = await UserData.getCustomerId();
    BlocProvider.of<ProfileBloc>(context).add(FetchProfile(context, customerId));
  }

// Set progile data from bloc
  void setProfileLoad({
    @required bool isNotify,
    @required ProfileState profileState,
    @required BuildContext context,
  }) {
    if (profileState is ProfileLoaded) {
      _customer = profileState.customer;
      _firstNameCtrl.text = _customer.firstName;
      _lastNameCtrl.text = _customer.lastName;
      _emailCtrl.text = _customer.email;
      _phoneCtrl.text = _customer.phoneNumber;
      _apiHandler = ApiHandleModel(isEmpty: false, isError: false, isLoaded: true);
      if (isNotify) {
        notifyListeners();
      } else if (profileState is ProfileError) {
        if (isNotify) {
          notifyListeners();
        }
        _apiHandler = ApiHandleModel(isEmpty: false, isError: true, isLoaded: true);
        errorModel = ErrorModel(
            detail: 'orderState.servieOptionWithIndustry.message', title: "getAllServiceOptionAndIndustry", isError: true);
      } else {
        if (isNotify) {
          notifyListeners();
        }
      }
    }
  }

// Change to edit
  void changeToEdit(BuildContext context) {
    FocusScope.of(context).unfocus();
    _isEdit = !_isEdit;
    notifyListeners();
  }

// Upload image
  void openImageUpload({@required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return UploadImage(
            onCameraTap: () {
              _selectImage(context, ImageSource.camera);
            },
            onGalleryTap: () {
              _selectImage(context, ImageSource.gallery);
            },
          );
        });
    notifyListeners();
  }

// Select image
  void _selectImage(BuildContext context, ImageSource source) async {
    App.backScreenOnce(context);
    int quality = 20;
    final tmpDir = (await _getTemporaryDirectory()).path;
    final target = "$tmpDir/${DateTime.now().millisecondsSinceEpoch}-$quality.jpg";
    // ignore: deprecated_member_use
    var image = await ImagePicker().getImage(source: source);

    //Cropping the image
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Crop your image',
          toolbarColor: AppColors.black,
          toolbarWidgetColor: Colors.white,
          lockAspectRatio: false),
    );

    if (croppedFile.lengthSync() > 500000) {
      quality = 50000000 ~/ croppedFile.lengthSync();
    }
    File result =
        await FlutterImageCompress.compressAndGetFile(croppedFile.path, target, quality: quality, format: CompressFormat.jpeg);
    print(result);
    _image = File(result.path);
    notifyListeners();
  }

  Future<Directory> _getTemporaryDirectory() async {
    return Directory.systemTemp;
  }

// User logout
  void logOut(BuildContext context) {
    CommonPop.customeDialog(
        context,
        ConfirmPops(
          message: "Logout?",
          discription: "Are you sure want to logout?",
        )).then((value) async {
      if (value) {
        await RemoveData.removeToken();
        await RemoveData.removeTwoFactor();
        AppRouter.navigator.pushNamedAndRemoveUntil(
          AppRouter.welcomeScreen,
          (Route<dynamic> route) => false,
        );
      }
    });
  }
}
