package com.mehmetalp.justdance;

public class PointCalculation {
    private final double flosspoint = 3704;

    public double CalculationFloss (double Point) {
        if(Point < 0 || Point == 0) {
          return 0;
        }

        double result = Point/flosspoint*100;
        return result;
    }
}
