# SVJ Setup
SVJ model with CKKW-L or MLM jet merging


## Abstract
This repository is modifying and optimizing SVJ model and is my master project.


## 1. Scheme
These folders are the content of master thesis.

### 1-1. scheme_1
The comparison of CKKW-L and MLM merging.  
The comparison of with and without decays of 4900211/4900213.

<table>
    <tr>
        <th>Comparison</th>
        <th>s^(1/2)</th>
        <th>Merging Scale</th>
        <th>MadGraph5</th>
        <th>PYTHIA8</th>
    </tr>
    <tr>
        <th>CKKW-L & with</th>
        <td rowspan="0">13 TeV</td>
        <td rowspan="0">100</td>
        <td rowspan="2">20000/0.5555 +- 0.0007549 pb</td>
        <td>19306/0.5746 pb</td>
    </tr>
    <tr>
        <th>CKKW-L & without</th>
        <td>19373/0.5778 pb</td>
    </tr>
    <tr>
        <th>MLM & with</th>
        <td rowspan="2">20000/0.5895 +- 0.0009109 pb</td>
        <td>14736/0.4350 pb</td>
    </tr>
    <tr>
        <th>MLM & without</th>
        <td>14647/0.4317 pb</td>
    </tr>
</table>
Table: The last two columns are `number of events`/`cross-section`.

## 2. Test
These folders are test.

### 2-0. test_0
I test the new image by using the old setup cards, .txt and .cmnd:  
[[1] SVJ_CKKWL/s-channel_ckkwl-v2/.txt](https://github.com/YW-Hsiao/SVJ_CKKWL/blob/main/s-channel_ckkwl-v2/Zpxdxd.txt)  
[[2] SVJ_CKKWL/s-channel_ckkwl-v2/.cmnd](https://github.com/YW-Hsiao/SVJ_CKKWL/blob/main/s-channel_ckkwl-v2/hepmc/svj_ckkwl-4.cmnd)  

<table>
    <tr>
        <th>CKKW-L</th>
        <th>s^(1/2)</th>
        <th>nevents</th>
        <th>tms</th>
        <th>MadGraph5</th>
        <th>PYTHIA8</th>
    </tr>
    <tr>
        <th>1</th>
        <td>14 TeV</td>
        <td>10000</td>
        <td>20</td>
        <td>1.15 +- 0.002753 pb</td>
        <td>7306/1.140 pb</td>
    </tr>
    <tr>
        <th>2</th>
        <td>14 TeV</td>
        <td>20000</td>
        <td>20</td>
        <td>1.151 +- 0.001943 pb</td>
        <td>14684/1.145 pb</td>
    </tr>
    <tr>
        <th>3</th>
        <td>13 TeV</td>
        <td>20000</td>
        <td>20</td>
        <td>0.9345 +- 0.001647</td>
        <td>14912/0.9370 pb</td>
    </tr>
</table>

### 2-1. test_1









