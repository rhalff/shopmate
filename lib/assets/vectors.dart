import 'package:flutter/widgets.dart';

// Bug color white was translated to black
// paint.color = Color(0xffffffff);
// had to add ..fillType = PathFillType.evenOdd not sure what it changes though
class Vectors {
  static rocket(Canvas canvas, Size size, {Color fill = null}) {
    canvas.translate(0.0, 0.0);
    canvas.scale((size.width / 280.000000), (size.height / 251.000000));
    final paint = Paint();
    if (fill != null) {
      paint.color = fill;
    }
    if (fill == null) {
      paint.color = Color(0xffffffff);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(148.936000, 202.553000)
          ..cubicTo(192.806000, 202.553000, 228.369000, 166.990000, 228.369000,
              123.121000)
          ..cubicTo(228.369000, 79.251200, 192.806000, 43.688000, 148.936000,
              43.688000)
          ..cubicTo(105.067000, 43.688000, 69.503500, 79.251200, 69.503500,
              123.121000)
          ..cubicTo(69.503500, 166.990000, 105.067000, 202.553000, 148.936000,
              202.553000)
          ..close()),
        paint);
    if (fill == null) {
      paint.color = Color(0xffffffff);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(258.652000, 70.496600)
          ..lineTo(263.121000, 79.432800)
          ..lineTo(254.184000, 79.432800)
          ..lineTo(258.652000, 70.496600)
          ..close()),
        paint);
    if (fill == null) {
      paint.color = Color(0xffffffff);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(259.961000, 182.018000)
          ..lineTo(271.195000, 183.422000)
          ..lineTo(261.365000, 193.251000)
          ..lineTo(259.961000, 182.018000)
          ..close()),
        paint);
    if (fill == null) {
      paint.color = Color(0xffffffff);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(11.971900, 123.840000)
          ..lineTo(31.773000, 126.315000)
          ..lineTo(14.447100, 143.641000)
          ..lineTo(11.971900, 123.840000)
          ..close()),
        paint);
    if (fill == null) {
      paint.color = Color(0xffffffff);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(62.553200, 57.588700)
          ..cubicTo(
              58.714600, 57.588700, 55.602800, 54.476900, 55.602800, 50.638300)
          ..cubicTo(
              55.602800, 46.799800, 58.714600, 43.688000, 62.553200, 43.688000)
          ..cubicTo(
              66.391800, 43.688000, 69.503500, 46.799800, 69.503500, 50.638300)
          ..cubicTo(
              69.503500, 54.476900, 66.391800, 57.588700, 62.553200, 57.588700)
          ..close()),
        paint);
    if (fill == null) {
      paint.color = Color(0xffffffff);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(48.652500, 101.277000)
          ..cubicTo(
              45.910600, 101.277000, 43.687900, 99.054000, 43.687900, 96.312200)
          ..cubicTo(
              43.687900, 93.570400, 45.910600, 91.347700, 48.652500, 91.347700)
          ..cubicTo(
              51.394300, 91.347700, 53.617000, 93.570400, 53.617000, 96.312200)
          ..cubicTo(53.617000, 99.054000, 51.394300, 101.277000, 48.652500,
              101.277000)
          ..close()),
        paint);
    if (fill == null) {
      paint.color = Color(0xffffffff);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(31.773100, 176.738000)
          ..cubicTo(26.837700, 176.738000, 22.836900, 172.737000, 22.836900,
              167.801000)
          ..cubicTo(22.836900, 162.866000, 26.837700, 158.865000, 31.773100,
              158.865000)
          ..cubicTo(36.708400, 158.865000, 40.709200, 162.866000, 40.709200,
              167.801000)
          ..cubicTo(40.709200, 172.737000, 36.708400, 176.738000, 31.773100,
              176.738000)
          ..close()),
        paint);
    if (fill == null) {
      paint.color = Color(0xffffffff);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(244.255000, 111.206000)
          ..cubicTo(241.513000, 111.206000, 239.291000, 108.983000, 239.291000,
              106.241000)
          ..cubicTo(239.291000, 103.499000, 241.513000, 101.277000, 244.255000,
              101.277000)
          ..cubicTo(246.997000, 101.277000, 249.220000, 103.499000, 249.220000,
              106.241000)
          ..cubicTo(249.220000, 108.983000, 246.997000, 111.206000, 244.255000,
              111.206000)
          ..close()),
        paint);
    if (fill == null) {
      paint.color = Color(0xffffffff);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(234.326000, 176.738000)
          ..cubicTo(232.681000, 176.738000, 231.348000, 175.404000, 231.348000,
              173.759000)
          ..cubicTo(231.348000, 172.114000, 232.681000, 170.780000, 234.326000,
              170.780000)
          ..cubicTo(235.971000, 170.780000, 237.305000, 172.114000, 237.305000,
              173.759000)
          ..cubicTo(237.305000, 175.404000, 235.971000, 176.738000, 234.326000,
              176.738000)
          ..close()),
        paint);
    if (fill == null) {
      paint.color = Color(0xffffffff);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(249.220000, 153.901000)
          ..cubicTo(244.285000, 153.901000, 240.284000, 149.900000, 240.284000,
              144.964000)
          ..cubicTo(240.284000, 140.029000, 244.285000, 136.028000, 249.220000,
              136.028000)
          ..cubicTo(254.155000, 136.028000, 258.156000, 140.029000, 258.156000,
              144.964000)
          ..cubicTo(258.156000, 149.900000, 254.155000, 153.901000, 249.220000,
              153.901000)
          ..close()),
        paint);
    if (fill == null) {
      paint.color = Color(0xffffffff);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(8.936170, 100.284000)
          ..cubicTo(4.000860, 100.284000, 0.0, 96.282900, 0.0, 91.347500)
          ..cubicTo(0.0, 86.412200, 4.000860, 82.411400, 8.936170, 82.411400)
          ..cubicTo(
              13.871500, 82.411400, 17.872300, 86.412200, 17.872300, 91.347500)
          ..cubicTo(
              17.872300, 96.282900, 13.871500, 100.284000, 8.936170, 100.284000)
          ..close()),
        paint);
    if (fill == null) {
      paint.color = Color(0xffffffff).withOpacity(0.398466);
    }
    canvas.drawRect(
        (Rect.fromLTWH(270.071000, 101.277000, 9.929080, 9.929080)), paint);
    if (fill == null) {
      paint.color = Color(0xffffffff).withOpacity(0.398466);
    }
    canvas.drawRect(
        (Rect.fromLTWH(205.532000, 192.624000, 17.872300, 17.872300)), paint);
    if (fill == null) {
      paint.color = Color(0xffffffff).withOpacity(0.398466);
    }
    canvas.drawRect(
        (Rect.fromLTWH(48.652500, 143.972000, 13.900700, 13.900700)), paint);
    if (fill == null) {
      paint.color = Color(0xffffffff).withOpacity(0.398466);
    }
    canvas.drawRect(
        (Rect.fromLTWH(24.822700, 63.546100, 6.950350, 6.950350)), paint);
    if (fill == null) {
      paint.color = Color(0xffffffff).withOpacity(0.398466);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(99.946500, 183.246000)
          ..cubicTo(104.600000, 187.899000, 108.144000, 191.899000, 100.321000,
              199.722000)
          ..cubicTo(92.498300, 207.544000, 77.731600, 205.461000, 77.731600,
              205.461000)
          ..cubicTo(77.731600, 205.461000, 75.648100, 190.694000, 83.470800,
              182.872000)
          ..cubicTo(91.293600, 175.049000, 95.293500, 178.593000, 99.946500,
              183.246000)
          ..close()),
        paint);
    if (fill == null) {
      paint.color = Color(0xffffffff);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(121.263000, 148.677000)
          ..cubicTo(121.263000, 148.677000, 160.005000, 87.440300, 146.131000,
              73.566000)
          ..cubicTo(
              132.257000, 59.691700, 71.019700, 98.433900, 71.019700, 98.433900)
          ..lineTo(121.263000, 148.677000)
          ..close()),
        paint);

    // Border
    if (fill == null) {
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 4;
      paint.color = Color(0xff252529);
      paint.strokeCap = StrokeCap.round;
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(121.263000, 148.677000)
          ..cubicTo(121.263000, 148.677000, 160.005000, 87.440300, 146.131000,
              73.566000)
          ..cubicTo(
              132.257000, 59.691700, 71.019700, 98.433900, 71.019700, 98.433900)
          ..lineTo(121.263000, 148.677000)
          ..close()),
        paint);

    // reset
    paint.strokeCap = StrokeCap.butt; // << default
    paint.strokeWidth = 1;
    paint.style = PaintingStyle.fill;

    if (fill == null) {
      paint.color = Color(0xffffffff);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(121.570000, 148.985000)
          ..cubicTo(121.570000, 148.985000, 182.807000, 110.242000, 196.682000,
              124.117000)
          ..cubicTo(210.556000, 137.991000, 171.814000, 199.228000, 171.814000,
              199.228000)
          ..lineTo(121.570000, 148.985000)
          ..close()),
        paint);
    if (fill == null) {
      paint.color = Color(0xff6eb2fb);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(111.542000, 159.013000)
          ..cubicTo(162.739000, 214.136000, 147.408000, 192.654000, 185.602000,
              154.460000)
          ..cubicTo(223.796000, 116.266000, 239.198000, 69.744500, 220.004000,
              50.550600)
          ..cubicTo(200.810000, 31.356800, 154.288000, 46.759300, 116.095000,
              84.953200)
          ..cubicTo(77.900800, 123.147000, 60.344800, 103.890000, 111.542000,
              159.013000)
          ..close()),
        paint);
    if (fill == null) {
      paint.color = Color(0xffffffff);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(101.883000, 168.672000)
          ..cubicTo(107.433000, 174.223000, 111.661000, 178.994000, 102.330000,
              188.326000)
          ..cubicTo(92.997900, 197.657000, 75.382900, 195.172000, 75.382900,
              195.172000)
          ..cubicTo(75.382900, 195.172000, 72.897600, 177.557000, 82.229200,
              168.225000)
          ..cubicTo(91.560800, 158.894000, 96.332200, 163.122000, 101.883000,
              168.672000)
          ..close()),
        paint);
    if (fill == null) {
      paint.color = Color(0xffffffff);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(163.837000, 106.718000)
          ..cubicTo(171.592000, 114.473000, 184.165000, 114.473000, 191.921000,
              106.718000)
          ..cubicTo(199.676000, 98.962900, 199.676000, 86.389500, 191.921000,
              78.634400)
          ..cubicTo(184.165000, 70.879300, 171.592000, 70.879300, 163.837000,
              78.634400)
          ..cubicTo(156.082000, 86.389500, 156.082000, 98.962900, 163.837000,
              106.718000)
          ..close()),
        paint);
    if (fill == null) {
      paint.color = Color(0xffffffff);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(138.562000, 131.993000)
          ..cubicTo(142.439000, 135.871000, 148.726000, 135.871000, 152.603000,
              131.993000)
          ..cubicTo(156.481000, 128.116000, 156.481000, 121.829000, 152.603000,
              117.951000)
          ..cubicTo(148.726000, 114.074000, 142.439000, 114.074000, 138.562000,
              117.951000)
          ..cubicTo(134.684000, 121.829000, 134.684000, 128.116000, 138.562000,
              131.993000)
          ..close()),
        paint);
    if (fill == null) {
      paint.color = Color(0xffffffff);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(219.354000, 57.843800)
          ..cubicTo(203.844000, 42.333600, 175.853000, 45.177400, 156.835000,
              64.195600)
          ..cubicTo(147.513000, 73.517300, 187.755000, 51.417500, 219.354000,
              57.843800)
          ..close()),
        paint);
    if (fill == null) {
      paint.color = Color(0xffe9eeef);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(188.871000, 81.683500)
          ..cubicTo(183.055000, 75.867200, 172.351000, 77.140900, 164.964000,
              84.528400)
          ..cubicTo(161.343000, 88.149400, 176.852000, 79.442900, 188.871000,
              81.683500)
          ..close()),
        paint);
    if (fill == null) {
      paint.color = Color(0xffe9eeef);
    }
    canvas.drawPath(
        (Path()
          ..fillType = PathFillType.evenOdd
          ..moveTo(151.199000, 120.760000)
          ..cubicTo(148.097000, 117.658000, 143.367000, 117.359000, 140.634000,
              120.092000)
          ..cubicTo(139.294000, 121.432000, 145.588000, 118.766000, 151.199000,
              120.760000)
          ..close()),
        paint);
  }
}
