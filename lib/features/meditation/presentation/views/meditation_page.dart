import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/core/theme/app_theme.dart';
import 'package:mental_health/features/meditation/presentation/bloc/daily_quote/daily_quote_bloc.dart';
import 'package:mental_health/features/meditation/presentation/bloc/mood_message/mood_message_bloc.dart';
import 'package:mental_health/features/meditation/presentation/widgets/feeling_button.dart';
import 'package:mental_health/features/meditation/presentation/widgets/task_card.dart';

class MeditationPage extends StatelessWidget {
  const MeditationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Image.asset("assets/images/menu_burger.png"),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile.png"),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back, Sabrina!",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 32),
              Text(
                "How are you feeling today ?",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FeelingButton(
                    onPressed: () {
                      context
                          .read<MoodMessageBloc>()
                          .add(FetchMoodMessageEvent("Today I am happy"));
                    },
                    label: "Happy",
                    color: DefaultColors.pink,
                    image: "assets/images/happy.png",
                  ),
                  FeelingButton(
                    onPressed: () {
                      context
                          .read<MoodMessageBloc>()
                          .add(FetchMoodMessageEvent("Today I am calm"));
                    },
                    label: "Calm",
                    color: DefaultColors.purple,
                    image: "assets/images/calm.png",
                  ),
                  FeelingButton(
                    onPressed: () {
                      context
                          .read<MoodMessageBloc>()
                          .add(FetchMoodMessageEvent("Today I am relax"));
                    },
                    label: "Relax",
                    color: DefaultColors.orange,
                    image: "assets/images/relax.png",
                  ),
                  FeelingButton(
                    onPressed: () {
                      context.read<MoodMessageBloc>().add(
                            FetchMoodMessageEvent("Today I need to be focus"),
                          );
                    },
                    label: "Focus",
                    color: DefaultColors.lightteal,
                    image: "assets/images/focus.png",
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                "Today's Task",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              BlocBuilder<DailyQuoteBloc, DailyQuoteState>(
                builder: (context, state) {
                  if (state is DailyQuoteLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is DailyQuoteLoaded) {
                    return Column(
                      children: [
                        TaskCard(
                          title: "Morning",
                          description: state.dailyQuote.morningQuote,
                          color: DefaultColors.task1,
                        ),
                        const SizedBox(height: 16),
                        TaskCard(
                          title: "Noon",
                          description: state.dailyQuote.noonQuote,
                          color: DefaultColors.task2,
                        ),
                        const SizedBox(height: 16),
                        TaskCard(
                          title: "Evening",
                          description: state.dailyQuote.eveningQuote,
                          color: DefaultColors.task3,
                        ),
                      ],
                    );
                  } else if (state is DailyQuoteError) {
                    return Center(
                      child: Text(
                        state.failure.message,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        'No data found',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    );
                  }
                },
              ),
              BlocListener<MoodMessageBloc, MoodMessageState>(
                listener: (context, state) {
                  if (state is MoodMessageLoaded) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          "My message for you : ",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        content: Text(
                          state.moodMessage.text,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Ok",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
