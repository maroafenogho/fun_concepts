import 'package:bootcamp101/app/modules/auth/providers/auth_state_notifier.dart';
import 'package:bootcamp101/app/modules/house/providers/house_state.dart';
import 'package:bootcamp101/app/modules/house/providers/house_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homepage extends ConsumerWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Hello ${ref.watch(authNotifierProvider).users[0].name}\nTake a look at the following offers'),
            SizedBox(height: 30),
            const Text(
              'Houses',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Consumer(
              builder: ((context, ref, child) {
                final state = ref.watch(houseNotifierProvider);
                switch (state.status) {
                  case HouseStatus.initial:
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(100),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.3,
                            );
                          }),
                    );

                  case HouseStatus.loading:
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(100),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Colors.black12,
                              )),
                            );
                          }),
                    );

                  case HouseStatus.success:
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ListView.builder(
                          itemCount: state.houses.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    color: Colors.black.withAlpha(100),
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          state.houses[index].image),
                                    )),
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.3,
                                // child: Image.network(state.houses[index].image),
                              ),
                            );
                          }),
                    );

                  case HouseStatus.failed:
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(100),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.3,
                            );
                          }),
                    );
                }
              }),
            ),
            SizedBox(height: 30),
            const Text(
              'Vacant houses',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Consumer(
              builder: ((context, ref, child) {
                final state = ref.watch(houseNotifierProvider);
                switch (state.status) {
                  case HouseStatus.initial:
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(100),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              height: MediaQuery.of(context).size.height * 0.35,
                              width: MediaQuery.of(context).size.width * 0.45,
                            );
                          }),
                    );

                  case HouseStatus.loading:
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(100),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Colors.black12,
                              )),
                            );
                          }),
                    );

                  case HouseStatus.success:
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListView.builder(
                          itemCount: state.houses.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withAlpha(100),
                                      borderRadius: BorderRadius.circular(20.0),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            state.houses[index].image),
                                      )),
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 10,
                                        left: 10,
                                        child: Container(
                                          child: Text(
                                            state.houses[index].title,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            );
                          }),
                    );

                  case HouseStatus.failed:
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(100),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width * 0.5,
                            );
                          }),
                    );
                }
              }),
            ),

            SizedBox(height: 30),
            const Text(
              'Popular Addresses',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Consumer(
              builder: ((context, ref, child) {
                final state = ref.watch(houseNotifierProvider);
                switch (state.status) {
                  case HouseStatus.initial:
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(100),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.35,
                            );
                          }),
                    );

                  case HouseStatus.loading:
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(100),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Colors.black12,
                              )),
                            );
                          }),
                    );

                  case HouseStatus.success:
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: ListView.builder(
                          itemCount: state.houses.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(50),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: Center(
                                  child: Text(state.houses[index].location.area,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                            );
                          }),
                    );

                  case HouseStatus.failed:
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(100),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.35,
                            );
                          }),
                    );
                }
              }),
            ),
            // Image.network(ref.watch(houseNotifierProvider).houses[0].image),
          ],
        ),
      ),
    );
  }
}
