import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _selectedCommunityRef = prefs.getString('ff_selectedCommunityRef')?.ref ??
          _selectedCommunityRef;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _selectGoal = '';
  String get selectGoal => _selectGoal;
  set selectGoal(String value) {
    _selectGoal = value;
  }

  String _rating = '';
  String get rating => _rating;
  set rating(String value) {
    _rating = value;
  }

  DocumentReference? _ref = FirebaseFirestore.instance.doc('/users/{uid}\n');
  DocumentReference? get ref => _ref;
  set ref(DocumentReference? value) {
    _ref = value;
  }

  String _selectGeneder = '';
  String get selectGeneder => _selectGeneder;
  set selectGeneder(String value) {
    _selectGeneder = value;
  }

  int _selectAge = 0;
  int get selectAge => _selectAge;
  set selectAge(int value) {
    _selectAge = value;
  }

  String _username = '';
  String get username => _username;
  set username(String value) {
    _username = value;
  }

  bool _isPrivateSelected = false;
  bool get isPrivateSelected => _isPrivateSelected;
  set isPrivateSelected(bool value) {
    _isPrivateSelected = value;
  }

  bool _isPublicSelected = false;
  bool get isPublicSelected => _isPublicSelected;
  set isPublicSelected(bool value) {
    _isPublicSelected = value;
  }

  bool _isLengthValid = false;
  bool get isLengthValid => _isLengthValid;
  set isLengthValid(bool value) {
    _isLengthValid = value;
  }

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? value) {
    _selectedDate = value;
  }

  String _defualtImage =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/yaqadaa-4jdyps/assets/gt1x9wlmy1i5/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg';
  String get defualtImage => _defualtImage;
  set defualtImage(String value) {
    _defualtImage = value;
  }

  bool _isRead = false;
  bool get isRead => _isRead;
  set isRead(bool value) {
    _isRead = value;
  }

  bool _searchisactive = false;
  bool get searchisactive => _searchisactive;
  set searchisactive(bool value) {
    _searchisactive = value;
  }

  int _currentHour = 0;
  int get currentHour => _currentHour;
  set currentHour(int value) {
    _currentHour = value;
  }

  int _mystep = 0;
  int get mystep => _mystep;
  set mystep(int value) {
    _mystep = value;
  }

  String _token = '';
  String get token => _token;
  set token(String value) {
    _token = value;
  }

  bool _isImageChanaged = false;
  bool get isImageChanaged => _isImageChanaged;
  set isImageChanaged(bool value) {
    _isImageChanaged = value;
  }

  String _newProfilePic = '';
  String get newProfilePic => _newProfilePic;
  set newProfilePic(String value) {
    _newProfilePic = value;
  }

  DocumentReference? _refDanah =
      FirebaseFirestore.instance.doc('/users/{GTdAkrUYeuRA8oiN8lSLTRwGvfq1}');
  DocumentReference? get refDanah => _refDanah;
  set refDanah(DocumentReference? value) {
    _refDanah = value;
  }

  DocumentReference? _currentMemberRef;
  DocumentReference? get currentMemberRef => _currentMemberRef;
  set currentMemberRef(DocumentReference? value) {
    _currentMemberRef = value;
  }

  DocumentReference? _currentPinnedPostRef;
  DocumentReference? get currentPinnedPostRef => _currentPinnedPostRef;
  set currentPinnedPostRef(DocumentReference? value) {
    _currentPinnedPostRef = value;
  }

  bool _iscompleted1 = false;
  bool get iscompleted1 => _iscompleted1;
  set iscompleted1(bool value) {
    _iscompleted1 = value;
  }

  bool _iscompleted2 = false;
  bool get iscompleted2 => _iscompleted2;
  set iscompleted2(bool value) {
    _iscompleted2 = value;
  }

  bool _iscompleted3 = false;
  bool get iscompleted3 => _iscompleted3;
  set iscompleted3(bool value) {
    _iscompleted3 = value;
  }

  bool _iscompleted4 = false;
  bool get iscompleted4 => _iscompleted4;
  set iscompleted4(bool value) {
    _iscompleted4 = value;
  }

  DocumentReference? _commentRef;
  DocumentReference? get commentRef => _commentRef;
  set commentRef(DocumentReference? value) {
    _commentRef = value;
  }

  String _countdownDisplay = '';
  String get countdownDisplay => _countdownDisplay;
  set countdownDisplay(String value) {
    _countdownDisplay = value;
  }

  int _activeChall = 0;
  int get activeChall => _activeChall;
  set activeChall(int value) {
    _activeChall = value;
  }

  int _allChall = 0;
  int get allChall => _allChall;
  set allChall(int value) {
    _allChall = value;
  }

  int _completedChall = 0;
  int get completedChall => _completedChall;
  set completedChall(int value) {
    _completedChall = value;
  }

  /// communtiy
  bool _isStepsChallenge = false;
  bool get isStepsChallenge => _isStepsChallenge;
  set isStepsChallenge(bool value) {
    _isStepsChallenge = value;
  }

  /// communtiy
  bool _isSetChall = false;
  bool get isSetChall => _isSetChall;
  set isSetChall(bool value) {
    _isSetChall = value;
  }

  List<ChatMessageStruct> _chatbot = [];
  List<ChatMessageStruct> get chatbot => _chatbot;
  set chatbot(List<ChatMessageStruct> value) {
    _chatbot = value;
  }

  void addToChatbot(ChatMessageStruct value) {
    chatbot.add(value);
  }

  void removeFromChatbot(ChatMessageStruct value) {
    chatbot.remove(value);
  }

  void removeAtIndexFromChatbot(int index) {
    chatbot.removeAt(index);
  }

  void updateChatbotAtIndex(
    int index,
    ChatMessageStruct Function(ChatMessageStruct) updateFn,
  ) {
    chatbot[index] = updateFn(_chatbot[index]);
  }

  void insertAtIndexInChatbot(int index, ChatMessageStruct value) {
    chatbot.insert(index, value);
  }

  DocumentReference? _selectedCommunityRef;
  DocumentReference? get selectedCommunityRef => _selectedCommunityRef;
  set selectedCommunityRef(DocumentReference? value) {
    _selectedCommunityRef = value;
    value != null
        ? prefs.setString('ff_selectedCommunityRef', value.path)
        : prefs.remove('ff_selectedCommunityRef');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
