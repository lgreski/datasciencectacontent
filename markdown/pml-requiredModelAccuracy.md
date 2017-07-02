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
