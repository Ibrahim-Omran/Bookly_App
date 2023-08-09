import 'package:bookly_app/Features/splash/persentation/views/widget/sliding_text.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}
                                                        // بيهندل تغير القيم بتاعة الانميشسن
class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin
{


  // late يعني اديله قيمه بس كمان شوية
  late AnimationController animationController ;
  late Animation<Offset> slidingAnimation ;


  @override
  void initState() {
    super.initState();

    initSlidingAnimation();
    navigateToHome();
  }
//**************************************
  @override
  void dispose() {
    super.dispose();
    // اي controller لازم نعملهdispose   عشان ميحجزش ميموري في الذاكرة
    animationController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // عاوزها تاخد العرض كله
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 4,
        ),
        // استخدمنا الAnimatedBuilder عشان منعملش بيناء للاسكرين من الاول
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }


//**************************************************
  // الانميشن بتعنا
  void initSlidingAnimation() {

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation = Tween<Offset>(
        begin: const Offset(0,5),
        end: Offset.zero ).animate(animationController);

    animationController.forward();

    //*********************************************
    // كنا هنستخدم دي لو مسخدمناش AnimatedBuilder
    //*********************************************

    // // خليك مستمع لو القيمة اتغيرت نفز
    // slidingAnimation.addListener(() {
    //   setState(() {});
    // });


  }

//***************************************************

  // عشان ننتقل للهوم بعد وقت معين
  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2),(){
      // استخدمنا الGoRouter بدل الجيت عشان عملية اكتر
      GoRouter.of(context).push(AppRouter.kHomeView);

      // هنستخدم بديل للجيت عشان هنشتغل عملي اكتر
      // // بنستخدم الجيت في الانتقال عشان سهل فيها نعمل انميشن وحنا بننتقل
      // Get.to(()=>const HomeView(),
      //     transition: Transition.fade,
      //     duration: kTabScrollDuration);

    });
  }

//***************************************************
}





