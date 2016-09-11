## Capstone n-grams: how much processing power is required?

Students in the Johns Hopkins University Data Science Specialization Capstone course typically struggle with the course project because of the amount of memory consumed by the objects needed to analyze text. To help reduce the guesswork in the memory utilization, here is a table that illustrates the amount of RAM consumed by objects required to analyze the files for the Swift Key sponsored capstone: predicting text.

For the purposes of this analysis, all code was run on an HP Omen laptop with the following specifications. 

<table>
    <tr>
        <th>Computer</th>
        <th>Configuration</th>
    </tr>
<tr>
   <td valign=top>HP Omen laptop</td>
   <td>
       <ul>
           <li>Operating system: Microsoft Windows 10, 64bit</li>
           <li>Processor: Intel i7-4710HQ at 2.5Ghz, turbo up to 3.5Ghz, four cores</li>
           <li>Memory: 16 gigabytes</li>
           <li>Disk: 512 gigabytes, solid state drive</li>
           <li>Date built: December 2013</li>
       </ul>
   </td>
</tr>
</table>

Note that due to the size of the objects, a machine with a minimum of 16Gb of RAM is required to process the entire data set, and one must be judicious about deleting objects not needed before progressing to subsequent steps in order to avoid running out of memory on the machine.

All text processing was completed with the <strong>quanteda</strong> package. 

<table>
<tr><th>Activity</th><th>Memory Used</th><th>Processing Time</th></tr>
<tr><td>Load data from the three raw data files into a corpus</td><td align="right">1.0Gb</td><td align="right">37 seconds</td></tr>
<tr><td>Tokenize corpus into sentences, using <code>quanteda::tokenize()</code></td><td align="right">1.3Gb</td><td align="right">509 seconds</td></tr>
<tr><td>Convert sentences into a character vector to be reprocessed by <code>quanteda::corpus()</code> and <code>quanteda::tokenize()</code></td><td align="right">6 seconds</td><td align="right">N/A</td></tr>
<tr><td>Build corpus with text data organized into single sentences</td><td align="right">5.9Gb</td><td align="right">180 seconds</td></tr>
<tr><td>Build 2-grams</td><td align="right">6.3Gbs</td><td align="right">619 seconds</td></tr>
<tr><td>Build 3-grams</td><td align="right">6.5Gbs</td><td align="right">894 seconds</td></tr>
<tr><td>Build 4-grams</td><td align="right">6.5Gbs</td><td align="right">925 seconds</td></tr>
<tr><td>Build 5-grams</td><td align="right">6.3Gbs</td><td align="right">930 seconds</td></tr>
<tr><td>Build 6-grams</td><td align="right">6.1Gbs</td><td align="right">1,007 seconds</td></tr>
</table>