# Calculating Area for a Point on the Normal Curve

Since <img src='./images/statinf-areaOfPointOnNormalCurve000.png'> the area under any specific point on the normal curve is 0. However, one can use the mean and standard deviation of a distribution along with a specific value to associate it with a quantile, as Professor Caffo defined on slide 21 of the Probability lecture.

Since you referenced the height of an adult population in your post, I've obtained data from the United States Centers for Disease Control's summary of the [National Health and Nutrition Index Survey - Anthropometric Reference Data for Children and Adults 2011 - 2014](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwi2_LOLxbzVAhXDPFAKHYTvDWEQFggmMAA&url=https%3A%2F%2Fwww.cdc.gov%2Fnchs%2Fdata%2Fseries%2Fsr_03%2Fsr03_039.pdf&usg=AFQjCNG_oCKDQ3G4PDZJPfhgDjT2ZXQZZw).

<img src='./images/statinf-areaOfPointOnNormalCurve01.png'>

I selected the table that includes average height (in centimeters) and percentiles for varying age categories of adult males. We can calculate the standard deviation for height manipulating the formula for a Z score at the 5th percentile to solve for the sample standard deviation *s*, where <img src='./images/statinf-areaOfPointOnNormalCurve00.png'>

For the purpose of this exercise, we will assume that height of males in the U.S. is normally distributed. Given the assumption of a normal distribution we can calculate where a height of 170 centimeters (1.7 meters) is on a normal curve (the Z distribution) as follows.

<img src='./images/statinf-areaOfPointOnNormalCurve02.png'>

The resulting probability value (i.e proportion of the normal curve) means that approximately 22% of people are 170 cm or shorter, and 78% are taller than 170 cm. In other words, a height of 170 cm is at the 22nd percentile of the height distribution if height is distributed normally.

The closest we can get to an exact probability for a height of 170 cm is to use the [Reimann integral](https://en.wikipedia.org/wiki/Riemann_integral) technique to calculate the area under the curve between 169.95 and 170.05 cm, which is about 0.004.

<img src='./images/statinf-areaOfPointOnNormalCurve03.png'>
