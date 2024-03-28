import 'package:fawry_app/features/onboarding/presentation/controlles/cubit.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onboarding_view extends StatefulWidget {
  const onboarding_view({super.key});

  @override
  State<onboarding_view> createState() => _onboarding_viewState();
}

class _onboarding_viewState extends State<onboarding_view> {
  var controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        PageView.builder(
          onPageChanged: (index) {
            if (index == OnBoardingCubit.get(context).boarding.length - 1) {
              setState(() {
                OnBoardingCubit.get(context).lastscreen = true;
              });
            } else {
              setState(() {
                OnBoardingCubit.get(context).lastscreen = false;
              });
            }
          },
          controller: controller,
          itemBuilder: (context, index) {
            // setState(() {
            index = index;
            // });
            return Image.network(
              OnBoardingCubit.get(context).boarding[index].image,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            );
          },
          itemCount: OnBoardingCubit.get(context).boarding.length,
        ),
        Positioned(
            right: 160,
            bottom: 100,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Text(
                        OnBoardingCubit.get(context)
                            .boarding[OnBoardingCubit.get(context).index]
                            .title,
                      ),
                      Text(
                        OnBoardingCubit.get(context)
                            .boarding[OnBoardingCubit.get(context).index]
                            .body,
                      ),
                    ]),
                  ),
                ),
                Row(
                  children: [
                    SmoothPageIndicator(
                        controller: controller,
                        effect: const SlideEffect(
                          dotColor: Colors.grey,
                          activeDotColor: Colors.deepOrange,
                          dotHeight: 10,
                          dotWidth: 10,
                        ),
                        count: OnBoardingCubit.get(context).boarding.length),
                  ],
                ),
              ],
            )),
        // boarding.length  == true
        //     ? TextButton(onPressed: () {}, child: const Text('تخطي'))
        //     :
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(onPressed: () {}, child: const Text('تخطي')),
            const SizedBox(
              width: 280,
            ),
            FloatingActionButton(
              onPressed: () {
                if (OnBoardingCubit.get(context).lastscreen) {
                } else {}
                controller.previousPage(
                    duration: const Duration(seconds: 1), curve: Curves.bounceIn);
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    ));
  }

// Widget OnBorading(Boarding model) =>
//     Stack(alignment: AlignmentDirectional.bottomCenter, children: [
//       Image.network(
//         model.image,
//         fit: BoxFit.cover,
//         height: double.infinity,
//         width: double.infinity,
//         alignment: Alignment.center,
//       ),
//       Positioned(
//           bottom: 180,
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: 450,
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Card(
//                     child: Column(mainAxisSize: MainAxisSize.min, children: [
//                       Text(
//                         model.title,
//                       ),
//                       Text(
//                         model.body,
//                       ),
//                     ]),
//                   ),
//                 ),
//               ),
//             ],
//           ))
//     ]);
}
// class OnBorading extends StatelessWidget {
//   final model;
//   OnBorading({ Key ? key, @required this.model}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(alignment: AlignmentDirectional.bottomCenter, children: [
//       Image.network(
//         model.image,
//         fit: BoxFit.cover,
//         height: double.infinity,
//         width: double.infinity,
//         alignment: Alignment.center,
//       ),
//       Positioned(
//           bottom: 180,
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 width: 450,
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Card(
//                     child: Column(mainAxisSize: MainAxisSize.min, children: [
//                       Text(
//                         model.title,
//                       ),
//                       Text(
//                         model.body,
//                       ),
//                     ]),
//                   ),
//                 ),
//               ),
//             ],
//           ))
//     ]);
//   }
// }
