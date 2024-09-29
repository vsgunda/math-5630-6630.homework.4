# Author: Your Name / your_email
# Date: 2024-09-01
# Assignment Name: hw04


import numpy as np

def p1(data, eval_pts):
    """
    Implement the divided difference method to interpolate the data points, 
    then evaluate the polynomial at the given point.

    @param data: a list of tuples [(x0, y0), (x1, y1), ..., (xn, yn)]
    @param eval_pts: a list of x values to evaluate the interpolating polynomial

    @return: a list of y values evaluated at the eval_pts

    """
    y = np.zeros(len(eval_pts))

    # Write your code here.

    return y


def p2(data, eval_pts):
    """
    For 6630 ONLY

    Implement the divided difference method to interpolate the data points, 
    then evaluate the polynomial at the given point.

    @param data: a list of tuples [(x0, y0, y0_1, y0_2, ..., y0_m1), 
                                   (x1, y1, y1_1, y1_2, ..., y1_m2),
                                    ..., 
                                   (xn, yn, yn_1, yn_2, ..., yn_mn)] 

                where x0, x1, ..., xn are the x values and the subsequent 
                values in the tuple are the derivatives of the function at the x values. 

                For example, 

                y0 = f(x0),
                y0_1 = f'(x0),
                y0_2 = f''(x0),
                ... ,
                y0_m1 = f^(m1)(x0)

    @param eval_pts: a list of x values to evaluate the interpolating polynomial

    @return: a list of y values evaluated at the eval_pts
    """
    y = np.zeros(len(eval_pts))

    # Write your code here.

    return y
