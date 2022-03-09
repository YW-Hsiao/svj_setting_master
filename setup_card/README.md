# SVJ Setup Card
Record the parameter of SVJ I used.

## Comparison of Our Setting and 1707.05326
The same parameters:
* `HiddenValley:Ngauge = 2`
* `HiddenValley:Lambda = 5` or `10` 1707.05326 uses
* `HiddenValley:spinFv = 0`
* `HiddenValley:FSR = on`
* `HiddenValley:fragment = on`
* `HiddenValley:probVector = 0.75`
* `4900101:m0 = 10.0` but we have `mWidth`, `mMin`, and `mMax`
* `4900111:m0 = 20`
* `4900113:m0 = 20`

The parameters we use only:
* `HiddenValley:alphaOrder = 1`
* `HiddenValley:nFlav = 2`
* `HiddenValley:pTminFSR = 5.5`

Close the parameter:
* `! HiddenValley:alphaFSR = 5`

The parameters 1707.05326 uses only:
* `sHiddenValley:Run = on ! turn on running`
* `HiddenValley:NBFlavRun = 0 ! number of boson in the running`
* `HiddenValley:NFFlavRun = 2 ! number of fermions in the running`

