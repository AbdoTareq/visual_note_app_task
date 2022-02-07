import '../../export.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  final Function() onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: child,
    ).backgroundColor(kPrimaryColor).box.make().cornerRadius(25).p8().centered();
  }
}
