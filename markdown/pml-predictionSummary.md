## Practical Machine Learning: Summary of Validation Data

Students in the Practical Machine Learning course who are having problems debugging their prediction algorithms need to confirm that they have read the validation data set correctly. The following code snippet uses the `YaleToolkit::whatis()` function to summarize the data from the course [Project Data File](https://d396qusza40orc.cloudfront.net/predmachlearn/) `pml-testing.csv` file.


    library(YaleToolkit)
    > whatis(validation)
                variable.name      type missing distinct.values precision              min
    1                           numeric       0              20     1e+00                1
    2               user_name character       0               6        NA           adelmo
    3    raw_timestamp_part_1   numeric       0              20     1e+00       1322489635
    4    raw_timestamp_part_2   numeric       0              20     1e+00            36553
    5          cvtd_timestamp character       0              11        NA 02/12/2011 13:33
    6              new_window character       0               1        NA               no
    7              num_window   numeric       0              20     1e+00               48
    8               roll_belt   numeric       0              18     1e-02             0.43
    9              pitch_belt   numeric       0              20     1e-02             1.59
    10               yaw_belt   numeric       0              18     1e-02             1.84
    11       total_accel_belt   numeric       0               9     1e+00                2
    12     kurtosis_roll_belt   numeric      20               0        NA             <NA>
    13    kurtosis_picth_belt   numeric      20               0        NA             <NA>
    14      kurtosis_yaw_belt   numeric      20               0        NA             <NA>
    15     skewness_roll_belt   numeric      20               0        NA             <NA>
    16   skewness_roll_belt.1   numeric      20               0        NA             <NA>
    17      skewness_yaw_belt   numeric      20               0        NA             <NA>
    18          max_roll_belt   numeric      20               0        NA             <NA>
    19         max_picth_belt   numeric      20               0        NA             <NA>
    20           max_yaw_belt   numeric      20               0        NA             <NA>
    21          min_roll_belt   numeric      20               0        NA             <NA>
    22         min_pitch_belt   numeric      20               0        NA             <NA>
    23           min_yaw_belt   numeric      20               0        NA             <NA>
    24    amplitude_roll_belt   numeric      20               0        NA             <NA>
    25   amplitude_pitch_belt   numeric      20               0        NA             <NA>
    26     amplitude_yaw_belt   numeric      20               0        NA             <NA>
    27   var_total_accel_belt   numeric      20               0        NA             <NA>
    28          avg_roll_belt   numeric      20               0        NA             <NA>
    29       stddev_roll_belt   numeric      20               0        NA             <NA>
    30          var_roll_belt   numeric      20               0        NA             <NA>
    31         avg_pitch_belt   numeric      20               0        NA             <NA>
    32      stddev_pitch_belt   numeric      20               0        NA             <NA>
    33         var_pitch_belt   numeric      20               0        NA             <NA>
    34           avg_yaw_belt   numeric      20               0        NA             <NA>
    35        stddev_yaw_belt   numeric      20               0        NA             <NA>
    36           var_yaw_belt   numeric      20               0        NA             <NA>
    37           gyros_belt_x   numeric       0              11     1e-02             0.02
    38           gyros_belt_y   numeric       0               4     1e-02                0
    39           gyros_belt_z   numeric       0              10     1e-02                0
    40           accel_belt_x   numeric       0              16     1e+00                1
    41           accel_belt_y   numeric       0              13     1e+00                1
    42           accel_belt_z   numeric       0              17     1e+00               20
    43          magnet_belt_x   numeric       0              19     1e+00                0
    44          magnet_belt_y   numeric       0              16     1e+00              566
    45          magnet_belt_z   numeric       0              16     1e+00              291
    46               roll_arm   numeric       0              13     1e-02                0
    47              pitch_arm   numeric       0              13     1e-02                0
    48                yaw_arm   numeric       0              13     1e-01                0
    49        total_accel_arm   numeric       0              17     1e+00                3
    50          var_accel_arm   numeric      20               0        NA             <NA>
    51           avg_roll_arm   numeric      20               0        NA             <NA>
    52        stddev_roll_arm   numeric      20               0        NA             <NA>
    53           var_roll_arm   numeric      20               0        NA             <NA>
    54          avg_pitch_arm   numeric      20               0        NA             <NA>
    55       stddev_pitch_arm   numeric      20               0        NA             <NA>
    56          var_pitch_arm   numeric      20               0        NA             <NA>
    57            avg_yaw_arm   numeric      20               0        NA             <NA>
    58         stddev_yaw_arm   numeric      20               0        NA             <NA>
    59            var_yaw_arm   numeric      20               0        NA             <NA>
    60            gyros_arm_x   numeric       0              18     1e-02             0.02
    61            gyros_arm_y   numeric       0              18     1e-02             0.02
    62            gyros_arm_z   numeric       0              17     1e-02                0
    63            accel_arm_x   numeric       0              19     1e+00                2
    64            accel_arm_y   numeric       0              19     1e+00                9
    65            accel_arm_z   numeric       0              20     1e+00                6
    66           magnet_arm_x   numeric       0              20     1e+00              170
    67           magnet_arm_y   numeric       0              19     1e+00               15
    68           magnet_arm_z   numeric       0              20     1e+00               58
    69      kurtosis_roll_arm   numeric      20               0        NA             <NA>
    70     kurtosis_picth_arm   numeric      20               0        NA             <NA>
    71       kurtosis_yaw_arm   numeric      20               0        NA             <NA>
    72      skewness_roll_arm   numeric      20               0        NA             <NA>
    73     skewness_pitch_arm   numeric      20               0        NA             <NA>
    74       skewness_yaw_arm   numeric      20               0        NA             <NA>
    75           max_roll_arm   numeric      20               0        NA             <NA>
    76          max_picth_arm   numeric      20               0        NA             <NA>
    77            max_yaw_arm   numeric      20               0        NA             <NA>
    78           min_roll_arm   numeric      20               0        NA             <NA>
    79          min_pitch_arm   numeric      20               0        NA             <NA>
    80            min_yaw_arm   numeric      20               0        NA             <NA>
    81     amplitude_roll_arm   numeric      20               0        NA             <NA>
    82    amplitude_pitch_arm   numeric      20               0        NA             <NA>
    83      amplitude_yaw_arm   numeric      20               0        NA             <NA>
    84          roll_dumbbell   numeric       0              20     1e-09      7.463022277
    85         pitch_dumbbell   numeric       0              20     1e-08                0
    86           yaw_dumbbell   numeric       0              20     1e-09      2.377137314
    87  kurtosis_roll_dumbbe&   numeric      20               0        NA             <NA>
    88  kurtosis_picth_dumbb&   numeric      20               0        NA             <NA>
    89  kurtosis_yaw_dumbbel&   numeric      20               0        NA             <NA>
    90  skewness_roll_dumbbe&   numeric      20               0        NA             <NA>
    91  skewness_pitch_dumbb&   numeric      20               0        NA             <NA>
    92  skewness_yaw_dumbbel&   numeric      20               0        NA             <NA>
    93      max_roll_dumbbell   numeric      20               0        NA             <NA>
    94     max_picth_dumbbell   numeric      20               0        NA             <NA>
    95       max_yaw_dumbbell   numeric      20               0        NA             <NA>
    96      min_roll_dumbbell   numeric      20               0        NA             <NA>
    97     min_pitch_dumbbell   numeric      20               0        NA             <NA>
    98       min_yaw_dumbbell   numeric      20               0        NA             <NA>
    99  amplitude_roll_dumbb&   numeric      20               0        NA             <NA>
    100 amplitude_pitch_dumb&   numeric      20               0        NA             <NA>
    101 amplitude_yaw_dumbbe&   numeric      20               0        NA             <NA>
    102  total_accel_dumbbell   numeric       0              14     1e+00                1
    103    var_accel_dumbbell   numeric      20               0        NA             <NA>
    104     avg_roll_dumbbell   numeric      20               0        NA             <NA>
    105  stddev_roll_dumbbell   numeric      20               0        NA             <NA>
    106     var_roll_dumbbell   numeric      20               0        NA             <NA>
    107    avg_pitch_dumbbell   numeric      20               0        NA             <NA>
    108 stddev_pitch_dumbbel&   numeric      20               0        NA             <NA>
    109    var_pitch_dumbbell   numeric      20               0        NA             <NA>
    110      avg_yaw_dumbbell   numeric      20               0        NA             <NA>
    111   stddev_yaw_dumbbell   numeric      20               0        NA             <NA>
    112      var_yaw_dumbbell   numeric      20               0        NA             <NA>
    113      gyros_dumbbell_x   numeric       0              17     1e-02             0.03
    114      gyros_dumbbell_y   numeric       0              15     1e-02             0.02
    115      gyros_dumbbell_z   numeric       0              17     1e-02             0.03
    116      accel_dumbbell_x   numeric       0              20     1e+00                0
    117      accel_dumbbell_y   numeric       0              18     1e+00                7
    118      accel_dumbbell_z   numeric       0              18     1e+00                1
    119     magnet_dumbbell_x   numeric       0              18     1e+00              272
    120     magnet_dumbbell_y   numeric       0              20     1e+00              238
    121     magnet_dumbbell_z   numeric       0              19     1e+00               19
    122          roll_forearm   numeric       0              17     1e-01                0
    123         pitch_forearm   numeric       0              20     1e-02                0
    124           yaw_forearm   numeric       0              20     1e-01                0
    125 kurtosis_roll_forear&   numeric      20               0        NA             <NA>
    126 kurtosis_picth_forea&   numeric      20               0        NA             <NA>
    127  kurtosis_yaw_forearm   numeric      20               0        NA             <NA>
    128 skewness_roll_forear&   numeric      20               0        NA             <NA>
    129 skewness_pitch_forea&   numeric      20               0        NA             <NA>
    130  skewness_yaw_forearm   numeric      20               0        NA             <NA>
    131      max_roll_forearm   numeric      20               0        NA             <NA>
    132     max_picth_forearm   numeric      20               0        NA             <NA>
    133       max_yaw_forearm   numeric      20               0        NA             <NA>
    134      min_roll_forearm   numeric      20               0        NA             <NA>
    135     min_pitch_forearm   numeric      20               0        NA             <NA>
    136       min_yaw_forearm   numeric      20               0        NA             <NA>
    137 amplitude_roll_forea&   numeric      20               0        NA             <NA>
    138 amplitude_pitch_fore&   numeric      20               0        NA             <NA>
    139 amplitude_yaw_forear&   numeric      20               0        NA             <NA>
    140   total_accel_forearm   numeric       0              13     1e+00               21
    141     var_accel_forearm   numeric      20               0        NA             <NA>
    142      avg_roll_forearm   numeric      20               0        NA             <NA>
    143   stddev_roll_forearm   numeric      20               0        NA             <NA>
    144      var_roll_forearm   numeric      20               0        NA             <NA>
    145     avg_pitch_forearm   numeric      20               0        NA             <NA>
    146  stddev_pitch_forearm   numeric      20               0        NA             <NA>
    147     var_pitch_forearm   numeric      20               0        NA             <NA>
    148       avg_yaw_forearm   numeric      20               0        NA             <NA>
    149    stddev_yaw_forearm   numeric      20               0        NA             <NA>
    150       var_yaw_forearm   numeric      20               0        NA             <NA>
    151       gyros_forearm_x   numeric       0              17     1e-02                0
    152       gyros_forearm_y   numeric       0              20     1e-02                0
    153       gyros_forearm_z   numeric       0              18     1e-02             0.02
    154       accel_forearm_x   numeric       0              19     1e+00                3
    155       accel_forearm_y   numeric       0              20     1e+00               21
    156       accel_forearm_z   numeric       0              19     1e+00                7
    157      magnet_forearm_x   numeric       0              20     1e+00                0
    158      magnet_forearm_y   numeric       0              20     1e+00               46
    159      magnet_forearm_z   numeric       0              20     1e+00               29
    160            problem_id character       0              20        NA                1
                     max
    1                 20
    2              pedro
    3         1323095002
    4             920315
    5   30/11/2011 17:12
    6                 no
    7                859
    8                129
    9               41.6
    10               162
    11                21
    12              <NA>
    13              <NA>
    14              <NA>
    15              <NA>
    16              <NA>
    17              <NA>
    18              <NA>
    19              <NA>
    20              <NA>
    21              <NA>
    22              <NA>
    23              <NA>
    24              <NA>
    25              <NA>
    26              <NA>
    27              <NA>
    28              <NA>
    29              <NA>
    30              <NA>
    31              <NA>
    32              <NA>
    33              <NA>
    34              <NA>
    35              <NA>
    36              <NA>
    37               0.5
    38              0.11
    39              0.48
    40                48
    41                72
    42               187
    43               169
    44               638
    45               426
    46               152
    47              63.8
    48               178
    49                44
    50              <NA>
    51              <NA>
    52              <NA>
    53              <NA>
    54              <NA>
    55              <NA>
    56              <NA>
    57              <NA>
    58              <NA>
    59              <NA>
    60              3.71
    61              2.09
    62              1.13
    63               341
    64               245
    65               404
    66               750
    67               474
    68               633
    69              <NA>
    70              <NA>
    71              <NA>
    72              <NA>
    73              <NA>
    74              <NA>
    75              <NA>
    76              <NA>
    77              <NA>
    78              <NA>
    79              <NA>
    80              <NA>
    81              <NA>
    82              <NA>
    83              <NA>
    84       123.9841439
    85       96.86772811
    86       132.2337396
    87              <NA>
    88              <NA>
    89              <NA>
    90              <NA>
    91              <NA>
    92              <NA>
    93              <NA>
    94              <NA>
    95              <NA>
    96              <NA>
    97              <NA>
    98              <NA>
    99              <NA>
    100             <NA>
    101             <NA>
    102               31
    103             <NA>
    104             <NA>
    105             <NA>
    106             <NA>
    107             <NA>
    108             <NA>
    109             <NA>
    110             <NA>
    111             <NA>
    112             <NA>
    113             1.06
    114             1.91
    115             1.18
    116              185
    117              166
    118              221
    119              576
    120              558
    121              368
    122              176
    123             63.5
    124              168
    125             <NA>
    126             <NA>
    127             <NA>
    128             <NA>
    129             <NA>
    130             <NA>
    131             <NA>
    132             <NA>
    133             <NA>
    134             <NA>
    135             <NA>
    136             <NA>
    137             <NA>
    138             <NA>
    139             <NA>
    140               47
    141             <NA>
    142             <NA>
    143             <NA>
    144             <NA>
    145             <NA>
    146             <NA>
    147             <NA>
    148             <NA>
    149             <NA>
    150             <NA>
    151             1.38
    152             5.97
    153              1.8
    154              232
    155              406
    156              282
    157              714
    158              800
    159              884
    160                9
    >

end of summary.
