<table>
<tr><th>Variable</th><th>Type</th><th>Description</th></tr>
<tr>
<td>PROPDMGEXP</td><td>Character</td><td>Exponential value used to adjust PROPDMG variable. Its values include:<br><br>
0 - 8: coding errors, multiply PROPDMG by 1<br>
H,h: hundreds, multiply PROPDMG by 100<br>
K,k: thousands, multiply PROPDMG by 1,000<br>
M,m: millions, multiply PROPDMG by 1,000,000<br>
B,b: billions, multiply PROPDMG by 1,000,000,000<br>
?: unknown, multiply PROPDMG by 0<br>
-: less than, multiply PROPDMG by 0<br>
+: greater than number estimated in PROPDMG, multiply PROPDMG by 1<br>
blank: not specified, multiply PROPDMG by 0</td>
</tr>
</table>
