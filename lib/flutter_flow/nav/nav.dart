import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomeWidget() : WelcomePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeWidget() : WelcomePageWidget(),
        ),
        FFRoute(
          name: Auth2Widget.routeName,
          path: Auth2Widget.routePath,
          builder: (context, params) => Auth2Widget(),
        ),
        FFRoute(
          name: Survy2Widget.routeName,
          path: Survy2Widget.routePath,
          builder: (context, params) => Survy2Widget(),
        ),
        FFRoute(
          name: CreatCommunity1Widget.routeName,
          path: CreatCommunity1Widget.routePath,
          builder: (context, params) => CreatCommunity1Widget(),
        ),
        FFRoute(
          name: CraetCommunity3Widget.routeName,
          path: CraetCommunity3Widget.routePath,
          asyncParams: {
            'doc': getDoc(['Community'], CommunityRecord.fromSnapshot),
          },
          builder: (context, params) => CraetCommunity3Widget(
            communityStatus: params.getParam(
              'communityStatus',
              ParamType.String,
            ),
            doc: params.getParam(
              'doc',
              ParamType.Document,
            ),
            refrence: params.getParam(
              'refrence',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Community'],
            ),
            passStatus: params.getParam(
              'passStatus',
              ParamType.String,
            ),
            passGoal: params.getParam(
              'passGoal',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: Survy3Widget.routeName,
          path: Survy3Widget.routePath,
          builder: (context, params) => Survy3Widget(),
        ),
        FFRoute(
          name: Survy4Widget.routeName,
          path: Survy4Widget.routePath,
          builder: (context, params) => Survy4Widget(),
        ),
        FFRoute(
          name: Survy1Widget.routeName,
          path: Survy1Widget.routePath,
          builder: (context, params) => Survy1Widget(),
        ),
        FFRoute(
          name: MyCommunitiesWidget.routeName,
          path: MyCommunitiesWidget.routePath,
          builder: (context, params) => MyCommunitiesWidget(
            initialTabIndex: params.getParam(
              'initialTabIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: WelcomePageWidget.routeName,
          path: WelcomePageWidget.routePath,
          builder: (context, params) => WelcomePageWidget(),
        ),
        FFRoute(
          name: CommunityPageWidget.routeName,
          path: CommunityPageWidget.routePath,
          builder: (context, params) => CommunityPageWidget(
            communityname: params.getParam(
              'communityname',
              ParamType.String,
            ),
            currentCommunityRef: params.getParam(
              'currentCommunityRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Community'],
            ),
            communityImage: params.getParam(
              'communityImage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ForgotPassword02Widget.routeName,
          path: ForgotPassword02Widget.routePath,
          builder: (context, params) => ForgotPassword02Widget(),
        ),
        FFRoute(
          name: NotificationsWidget.routeName,
          path: NotificationsWidget.routePath,
          builder: (context, params) => NotificationsWidget(),
        ),
        FFRoute(
          name: RequstWidget.routeName,
          path: RequstWidget.routePath,
          builder: (context, params) => RequstWidget(
            communityRef: params.getParam(
              'communityRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Community'],
            ),
          ),
        ),
        FFRoute(
          name: EditProfileWidget.routeName,
          path: EditProfileWidget.routePath,
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: ChangePasswordWidget.routeName,
          path: ChangePasswordWidget.routePath,
          builder: (context, params) => ChangePasswordWidget(),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: EditCommWidget.routeName,
          path: EditCommWidget.routePath,
          builder: (context, params) => EditCommWidget(
            community: params.getParam(
              'community',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Community'],
            ),
            image: params.getParam(
              'image',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: JoinCommunitiesWidget.routeName,
          path: JoinCommunitiesWidget.routePath,
          builder: (context, params) => JoinCommunitiesWidget(),
        ),
        FFRoute(
          name: TryingWidget.routeName,
          path: TryingWidget.routePath,
          builder: (context, params) => TryingWidget(),
        ),
        FFRoute(
          name: C23Widget.routeName,
          path: C23Widget.routePath,
          builder: (context, params) => C23Widget(),
        ),
        FFRoute(
          name: ChangeEmailWidget.routeName,
          path: ChangeEmailWidget.routePath,
          builder: (context, params) => ChangeEmailWidget(),
        ),
        FFRoute(
          name: CommunitymemberWidget.routeName,
          path: CommunitymemberWidget.routePath,
          builder: (context, params) => CommunitymemberWidget(
            communityRef: params.getParam(
              'communityRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Community'],
            ),
          ),
        ),
        FFRoute(
          name: CreatePostWidget.routeName,
          path: CreatePostWidget.routePath,
          asyncParams: {
            'commentRef': getDoc(['comment'], CommentRecord.fromSnapshot),
          },
          builder: (context, params) => CreatePostWidget(
            community: params.getParam(
              'community',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Community'],
            ),
            commentRef: params.getParam(
              'commentRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CreatCommunity2Widget.routeName,
          path: CreatCommunity2Widget.routePath,
          builder: (context, params) => CreatCommunity2Widget(
            passStatus: params.getParam(
              'passStatus',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ChWidget.routeName,
          path: ChWidget.routePath,
          builder: (context, params) => ChWidget(),
        ),
        FFRoute(
          name: ChhhWidget.routeName,
          path: ChhhWidget.routePath,
          builder: (context, params) => ChhhWidget(),
        ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          builder: (context, params) => HomeWidget(),
        ),
        FFRoute(
          name: CommunityPageCopyWidget.routeName,
          path: CommunityPageCopyWidget.routePath,
          builder: (context, params) => CommunityPageCopyWidget(
            communityname: params.getParam(
              'communityname',
              ParamType.String,
            ),
            currentCommunityRef: params.getParam(
              'currentCommunityRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Community'],
            ),
            communityImage: params.getParam(
              'communityImage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: RedeemWidget.routeName,
          path: RedeemWidget.routePath,
          builder: (context, params) => RedeemWidget(),
        ),
        FFRoute(
          name: ReportWidget.routeName,
          path: ReportWidget.routePath,
          builder: (context, params) => ReportWidget(),
        ),
        FFRoute(
          name: ChPageWidget.routeName,
          path: ChPageWidget.routePath,
          builder: (context, params) => ChPageWidget(
            community: params.getParam(
              'community',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Community'],
            ),
          ),
        ),
        FFRoute(
          name: ChallengecompletedstatusWidget.routeName,
          path: ChallengecompletedstatusWidget.routePath,
          builder: (context, params) => ChallengecompletedstatusWidget(
            challengeRef: params.getParam(
              'challengeRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['challengeTemplates'],
            ),
          ),
        ),
        FFRoute(
          name: CitiesCopyWidget.routeName,
          path: CitiesCopyWidget.routePath,
          builder: (context, params) => CitiesCopyWidget(),
        ),
        FFRoute(
          name: PppWidget.routeName,
          path: PppWidget.routePath,
          builder: (context, params) => PppWidget(),
        ),
        FFRoute(
          name: CommunityPageCopyCopyWidget.routeName,
          path: CommunityPageCopyCopyWidget.routePath,
          builder: (context, params) => CommunityPageCopyCopyWidget(
            communityname: params.getParam(
              'communityname',
              ParamType.String,
            ),
            currentCommunityRef: params.getParam(
              'currentCommunityRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Community'],
            ),
            communityImage: params.getParam(
              'communityImage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ChatbotWidget.routeName,
          path: ChatbotWidget.routePath,
          builder: (context, params) => ChatbotWidget(),
        ),
        FFRoute(
          name: CommunitymemberCopy2Widget.routeName,
          path: CommunitymemberCopy2Widget.routePath,
          builder: (context, params) => CommunitymemberCopy2Widget(
            communityRef: params.getParam(
              'communityRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Community'],
            ),
          ),
        ),
        FFRoute(
          name: CityChallWidget.routeName,
          path: CityChallWidget.routePath,
          builder: (context, params) => CityChallWidget(),
        ),
        FFRoute(
          name: ConterWidget.routeName,
          path: ConterWidget.routePath,
          builder: (context, params) => ConterWidget(),
        ),
        FFRoute(
          name: ShareWidget.routeName,
          path: ShareWidget.routePath,
          builder: (context, params) => ShareWidget(),
        ),
        FFRoute(
          name: CreatePostCopy2Widget.routeName,
          path: CreatePostCopy2Widget.routePath,
          builder: (context, params) => CreatePostCopy2Widget(
            community: params.getParam(
              'community',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Community'],
            ),
          ),
        ),
        FFRoute(
          name: RiyadhWidget.routeName,
          path: RiyadhWidget.routePath,
          builder: (context, params) => RiyadhWidget(),
        ),
        FFRoute(
          name: LkkWidget.routeName,
          path: LkkWidget.routePath,
          builder: (context, params) => LkkWidget(),
        ),
        FFRoute(
          name: CreatePostCopyWidget.routeName,
          path: CreatePostCopyWidget.routePath,
          asyncParams: {
            'commentRef': getDoc(['comment'], CommentRecord.fromSnapshot),
          },
          builder: (context, params) => CreatePostCopyWidget(
            community: params.getParam(
              'community',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Community'],
            ),
            commentRef: params.getParam(
              'commentRef',
              ParamType.Document,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/welcomePage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Screenshot_2025-10-01_012831.png',
                    fit: BoxFit.cover,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
