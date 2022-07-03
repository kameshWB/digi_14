import 'dart:developer';

import 'package:digi_14/core/utils/constants/constants.dart';
import 'package:digi_14/core/utils/navigation/route_argument_classes.dart';
import 'package:digi_14/core/utils/styling/alignment_extensions.dart';
import 'package:digi_14/core/utils/styling/padding_extensions.dart';
import 'package:digi_14/core/utils/styling/app_measurements.dart';
import 'package:digi_14/core/utils/utils.dart';
import 'package:digi_14/features/events/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:separated_column/separated_column.dart';
import '../../../core/presentation/widgets/app_image.dart';
import '../../../core/utils/constants/app_typography.dart';
import '../../../core/utils/constants/assets.dart';
import '../../../core/utils/navigation/routes.dart';
import '../../../core/utils/styling/spacing_widgets.dart';
import '../bloc/events_home/events_home_bloc.dart';
import '../widgets/event_card.dart';
import '../widgets/event_slider.dart';
import '../widgets/section_title.dart';

class EventsHomeView extends StatefulWidget {
  const EventsHomeView({Key? key}) : super(key: key);

  @override
  State<EventsHomeView> createState() => _EventsHomeViewState();
}

class _EventsHomeViewState extends State<EventsHomeView> {
  late EventsHomeBloc _bloc;
  bool showLoading = true;
  bool showSearchSuggestions = false;
  List<EventModel> events = [];
  List<EventModel> searchResultEvents = [];

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchNode = FocusNode();

  final Duration animatedDuration = const Duration(milliseconds: 100);

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<EventsHomeBloc>(context, listen: false);
    _bloc.add(const GetDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    AppMeasures.initiate(
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);
    return Scaffold(
      body: SafeArea(
        child: BlocListener<EventsHomeBloc, EventsHomeState>(
          listener: _blocListener,
          child: Container(
            height: AppMeasures.screenHeight,
            width: AppMeasures.screenWidth,
            decoration: BoxDecorations.scaffoldBackground,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Spacing.h24,
                      buildSearchTF(),
                      buildExplore()
                          .left
                          .paddingSymmetric(AppMeasures.pageMargin),
                      Spacing.h24,
                      buildCategories(),
                      const SectionTitle(
                        title: "Hot Events 🔥",
                      ).paddingSymmetric(AppMeasures.pageMargin),
                      buildEvents(),
                    ],
                  ),
                  buildSuggestions()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BlocBuilder<EventsHomeBloc, EventsHomeState> buildSuggestions() {
    return BlocBuilder<EventsHomeBloc, EventsHomeState>(
      buildWhen: (_, state) =>
          state is SearchResultLoadedEventsState || state is CrossClickedState,
      builder: (context, state) {
        if (searchResultEvents.isNotEmpty) {
          return Column(
            children: [
              Spacing.h36,
              Spacing.h40,
              Spacing.h10,
              Spacing.h10,
              Container(
                margin: EdgeInsets.only(
                  left: AppMeasures.pageMargin / 2,
                  right: AppMeasures.pageMargin / 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.9),
                ),
                height: AppMeasures.screenHeight - 150,
                width: AppMeasures.screenWidth,
                child: buildEventsMini(),
              ).center,
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget buildEvents() {
    return BlocBuilder<EventsHomeBloc, EventsHomeState>(
      buildWhen: (_, state) => state is EventsLoadedState,
      builder: (context, state) {
        return SeparatedColumn(
          children: events.reversed
              .map((event) => EventCard(
                    event,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.eventDetails,
                          arguments: EventDetailsArgs(event));
                    },
                  ))
              .toList(),
          includeOuterSeparators: true,
          separatorBuilder: (BuildContext context, int index) {
            return Spacing.h30;
          },
        );
      },
    );
  }

  Widget buildEventsMini() {
    return BlocBuilder<EventsHomeBloc, EventsHomeState>(
      buildWhen: (_, state) => state is EventsLoadedState,
      builder: (context, state) {
        return SingleChildScrollView(
          child: SeparatedColumn(
            children: searchResultEvents
                .map(
                  (event) => EventCard(
                    event,
                    isMini: true,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.eventDetails,
                          arguments: EventDetailsArgs(event));
                    },
                  ),
                )
                .toList(),
            includeOuterSeparators: true,
            separatorBuilder: (BuildContext context, int index) {
              return Spacing.h10;
            },
          ),
        );
      },
    );
  }

  Widget buildCategories() {
    return BlocBuilder<EventsHomeBloc, EventsHomeState>(
      buildWhen: (_, state) => state is EventsLoadedState,
      builder: (context, state) {
        return EventSlider(events: events);
      },
    );
  }

  Widget buildExplore() {
    return Text(
      "Explore Today's",
      style: AppTextStyles.pageTitleStyle,
    );
  }

  Widget buildSearchTF() {
    return BlocBuilder<EventsHomeBloc, EventsHomeState>(
      buildWhen: (_, state) =>
          state is SearchClickedState || state is CrossClickedState,
      builder: (context, state) {
        return SizedBox(
            width: AppMeasures.screenWidth,
            child: AnimatedCrossFade(
              firstChild: Row(
                children: [
                  buildWelcomeText(),
                  const Spacer(),
                  buildSearchIcon(),
                ],
              ),
              secondChild: Row(
                children: [
                  buildSearchField(),
                  buildCrossIcon(),
                ],
              ),
              crossFadeState: showSearchSuggestions
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: animatedDuration,
              firstCurve: Curves.bounceInOut,
              secondCurve: Curves.easeInCirc,
            ).paddingSymmetric(
              AppMeasures.pageMargin,
            ));
      },
    );
  }

  Widget buildSearchIcon() {
    return GestureDetector(
      onTap: () {
        _bloc.add(const SearchClickedEvent());
      },
      child: AppImage(
        AppImages.icons.search,
        height: 25,
        width: 25,
        color: const Color.fromRGBO(46, 58, 89, 1),
      ).paddingAll(),
    );
  }

  Widget buildCrossIcon() {
    return GestureDetector(
      onTap: () {
        _bloc.add(const CrossClickedEvent());
      },
      child: AppImage(
        AppImages.icons.cancel,
        height: 25,
        width: 25,
        color: const Color.fromRGBO(46, 58, 89, 1),
      ).paddingAll(),
    );
  }

  Widget buildSearchField() {
    return Expanded(
      child: Container(
        height: 40,
        padding: const EdgeInsets.only(right: 10),
        alignment: Alignment.centerLeft,
        child: TextFormField(
          controller: searchController,
          focusNode: searchNode,
          onFieldSubmitted: ((value) {}),
          decoration: InputDecoration(
            hintText: "Search for events",
            hintStyle: AppTextStyles.searchTextStyle,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(45, 67, 121, 1)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(45, 67, 121, 1)),
            ),
            contentPadding: const EdgeInsets.all(10),
          ),
          onChanged: (query) {
            log(query);
            _bloc.add(SearchQueryUpdatedEvent(query));
          },
        ),
      ),
    );
  }

  Widget buildWelcomeText() {
    return Container(
      height: 40,
      alignment: Alignment.centerLeft,
      child: Text(
        "Hello, User!",
        style: AppTextStyles.welcomeTextStyle,
      ),
    );
  }

  void _blocListener(context, state) {
    if (state is EventsLoadedState) {
      showLoading = false;
      events = state.events;
      return;
    }

    if (state is SearchResultLoadedEventsState) {
      searchResultEvents = state.events;
      return;
    }

    if (state is SearchClickedState) {
      showSearchSuggestions = true;
      searchNode.requestFocus();
      return;
    }

    if (state is CrossClickedState) {
      showSearchSuggestions = false;
      searchController.text = "";
      searchResultEvents = [];
      Utils.removeFocus(context);
      return;
    }

    if (state is ErrorState) {
      Navigator.pushNamed(
        context,
        Routes.error,
        arguments: ErrorViewArgs(
          callback: () {
            _bloc.add(const GetDataEvent());
          },
          message: state.msg,
        ),
      );
      return;
    }
  }
}
