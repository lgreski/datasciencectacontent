## Practical Machine Learning: Required Model Accuracy for Course project

As students complete the course project for _Practical Machine Learning_, they tend to raise questions about the accuracy required to correctly predict all 20 cases in the test data set.

Going back to the probability theory concepts that were covered in *Statistical Inference*, each observation in the test data set is independent of the others. If *a* represents the accuracy of a machine learning model, then the probability of correctly predicting 20 out of 20 test cases with the model in question is *a^20*, because the probability of the total is equal to the product of the independent probabilities.

The following table illustrates the probability of predicting all 20 test cases, given a particular model accuracy.

<table>
<tr><th><br><br>Model<br>Accuracy</th><th>Probability<br>of Predicting <br>20 out of 20<br>Correctly</th>
</tr>
<tr><td align=right>0.800</td><td align=right>0.0115</td></tr>
<tr><td align=right>0.850</td><td align=right>0.0388</td></tr>
<tr><td align=right>0.900</td><td align=right>0.1216</td></tr>
<tr><td align=right>0.950</td><td align=right>0.3585</td></tr>
<tr><td align=right>0.990</td><td align=right>0.8179</td></tr>
<tr><td align=right>0.991</td><td align=right>0.8346</td></tr>
<tr><td align=right>0.992</td><td align=right>0.8516</td></tr>
<tr><td align=right>0.993</td><td align=right>0.8689</td></tr>
<tr><td align=right>0.994</td><td align=right>0.8866</td></tr>
<tr><td align=right>0.995</td><td align=right>0.9046</td></tr>
</table>

<strong>Bottom Line:</strong> Submit your test cases for grading only after you've achieved a model accuracy of at least .99 on the training data set.

# Appendix: Accuracy Required for 95% Confidence Across 20 Tests

In January 2018 a student posted an [issue](http://bit.ly/2mv5Dr4) on my github site, suggesting that a better way to calculate the required accuracy would be to use the formula `(1-.05)^(1/20)`. This approach leverages the concept of familywise error rates across multiple comparisons of means in the week 4 lectures from the *Statistical Inference* course. This specific calculation is known as the [Šidák correction for multiple tests](http://bit.ly/2DuPwlq).

When we compare the two approaches we find that they produce the same result within .001. To have 95% confidence that all 20 predictions will be accurate, we need a familywise accuracy rate of .9974386, as illustrated below.

      > mdlAccuracy <- c(.8,.85,.9,.95,.99,.995,.996,.997,.9974,0.9974386,.9975)
      > predAccuracy <- mdlAccuracy^20
      > data.frame(mdlAccuracy,predAccuracy)
         mdlAccuracy predAccuracy
      1    0.8000000   0.01152922
      2    0.8500000   0.03875953
      3    0.9000000   0.12157665
      4    0.9500000   0.35848592
      5    0.9900000   0.81790694
      6    0.9950000   0.90461048
      7    0.9960000   0.92296826
      8    0.9970000   0.94167961
      9    0.9974000   0.94926458
      10   0.9974386   0.94999960
      11   0.9975000   0.95116988
      >
      > # alternate approach: Šidák's correction of multiple tests
      > # generate 95% confidence familywise accuracy needed across 20 tests
      > (1 - .05)^(1/20)
      [1] 0.9974386
      >
