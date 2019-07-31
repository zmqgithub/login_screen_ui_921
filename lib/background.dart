import 'package:flutter/material.dart';

class Background extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var rect = new Offset(0.0, 0.0)&new Size(size.width, size.height);
    var paint = new Paint();
    paint..color = Colors.orange
      ..strokeWidth = 2.0
      ..shader = new LinearGradient(colors: [Colors.pink, Colors.redAccent],
          begin: Alignment.topRight, end: Alignment.bottomLeft, tileMode:
          TileMode.clamp).createShader(rect)
      ..style = PaintingStyle.fill;

    var firstControlPoint = Offset(size.width / 6, size.height/4);
    var firstEndPoint = Offset(size.width / 2.5, size.height/4 - 30.0);

    var secondControlPoint = Offset(size.width - (size.width / 3.25), size.height/4 - 75);
    var secondEndPoint = Offset(size.width, size.height/4 - 40);

    var path = new Path();
    path.lineTo(0.0, size.height/4 - 20);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height/4 - 40);
    path.lineTo(size.width, 0.0);
    canvas.drawPath(path, paint);

    var p1 = Offset(size.width / 4, size.height/4+0);
    var p2 = Offset(size.width / 1.8, size.height/4 + 10);

    var p3 = Offset(size.width - (size.width / 4), size.height/4+20);
    var p4 = Offset(size.width, size.height/4);


    var pathl = new Path();
    pathl.lineTo(0.0, size.height/4 - 10);
    pathl.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    pathl.quadraticBezierTo(p3.dx, p3.dy, p4.dx, p4.dy);
    pathl.lineTo(size.width, size.height/4 - 40);
    pathl.lineTo(size.width, 0.0);

    paint..shader = new LinearGradient(colors: [Colors.pink.withOpacity(0.4), Colors.orangeAccent],
        begin: Alignment.topRight, end: Alignment.bottomLeft, tileMode:
        TileMode.clamp).createShader(rect);
    canvas.drawPath(pathl, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}