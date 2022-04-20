# SVJ Setup
SVJ model with CKKW-L or MLM jet merging


## Abstract
This repository is modifying and optimizing SVJ model and is my master project.


## 1. Scheme
These folders are the content of master thesis.

### 1-1. `scheme_1`
1. The comparison of CKKW-L and MLM merging.  
2. The comparison of with and without decays of 4900211/4900213.

<table>
    <tr>
        <th>Comparison</th>
        <th>s^(1/2)</th>
        <th>Merging Scale</th>
        <th>MadGraph5</th>
        <th>PYTHIA8</th>
    </tr>
    <tr>
        <th>CKKW-L & with decay</th>
        <td rowspan="0">13 TeV</td>
        <td rowspan="0">100</td>
        <td rowspan="2">20000/0.5555 +- 0.0007549 pb</td>
        <td>19306/0.5746 pb</td>
    </tr>
    <tr>
        <th>CKKW-L & without decay</th>
        <td>19373/0.5778 pb</td>
    </tr>
    <tr>
        <th>MLM & with decay</th>
        <td rowspan="2">20000/0.5895 +- 0.0009109 pb</td>
        <td>14736/0.4350 pb</td>
    </tr>
    <tr>
        <th>MLM & without decay</th>
        <td>14647/0.4317 pb</td>
    </tr>
</table>

Table: The last two columns are `number of events`/`cross-section`.  
I use python script `analysis_script_1.py` to analyze these data.

#### Conclusion:
* In parton level, the cross-section of MLM case is larger than CKKW-L case.
* In truth level, the cross-section/number of events of CKKW-L case is larger than MLM case.
* However, for CKKW-L, the cross-section of truth level is larger than parton level one.
* It seems that CKKW-L reweight and MLM doesn't reweight the event weights.


## 2. Test
These folders are test.

### 2-0. `test_0`
1. I test the new image by using the old setup cards, .txt and .cmnd:  
    [[1] SVJ_CKKWL/s-channel_ckkwl-v2/.txt](https://github.com/YW-Hsiao/SVJ_CKKWL/blob/main/s-channel_ckkwl-v2/Zpxdxd.txt)  
    [[2] SVJ_CKKWL/s-channel_ckkwl-v2/.cmnd](https://github.com/YW-Hsiao/SVJ_CKKWL/blob/main/s-channel_ckkwl-v2/hepmc/svj_ckkwl-4.cmnd)  

<table>
    <tr>
        <th>CKKW-L without decay</th>
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

### 2-1. `test_1`
* I test different combination of TMS (10, 20, 30, 100) and xqcut.
* s^(1/2) = 13 TeV
* Number of events = 20000

<table>
    <tr>
        <th>Comparison</th>
        <th>TMS</th>
        <th>xqcut</th>
        <th>MadGraph5</th>
        <th>PYTHIA8</th>
    </tr>
    <tr>
        <th>1</th>
        <td rowspan="2">10</td>
        <td>0</td>
        <td>0.9545 +- 0.00168 pb</td>
        <td>14443/0.9325 pb</td>
    </tr>
    <tr>
        <th>2</th>
        <td>5</td>
        <td>1.258 +- 0.002358 pb</td>
        <td>11829/1.104 pb</td>
    </tr>
    <tr>
        <th>3</th>
        <td>20</td>
        <td>0.9288 +- 0.001794 pb</td>
        <td>10</td>
        <td>14815/0.9284 pb</td>
    </tr>
    <tr>
        <th>4</th>
        <td rowspan="2">30</td>
        <td>0</td>
        <td>0.7947 +- 0.001431 pb</td>
        <td>16399/0.8183 pb</td>
    </tr>
    <tr>
        <th>5</th>
        <td>20</td>
        <td>0.7856 +- 0.00142 pb</td>
        <td>16613/0.8200 pb</td>
    </tr>
    <tr>
        <th>6</th>
        <td rowspan="2">100</td>
        <td>10</td>
        <td>0.5557 +- 0.0007174 pb</td>
        <td>19287/0.5721 pb</td>
    </tr>
    <tr>
        <th>7</th>
        <td>30</td>
        <td>0.5556 +- 0.0007545 pb</td>
        <td>19326/0.5754 pb</td>
    </tr>
</table>

Table: The last two columns are `number of events`/`cross-section`.


## 3. Setup Cards and Analysis
These folders store the setup card and the analysis test.

### 3-1. Folder `setup_card`
1. It records the setup and the explanations of simplified DM model with s-channel mediator and hidden valley model.

### 3-2. Folder `test_analysis`
1. I test the analysis framework by using the SVJ with CKKW-L and without dacay data `<where>/scheme_1/root/ckkwl_wo.root`.

* `test_0_python.ipynb`: Test and review python functions.
* `test_1_basic.ipynb`: Test and review my analysis framework.
    * Import packages
    * Import .root file and load the data via class
        * Check the number of events for each branch
        * Define physical quantities
    * Analyze the dark quark pair in the parton and truth levels
    * Jet clustering
        * Select stable final state particle without/with filtering out dark sector
        * Let's do the jet clustering!!
* `test_2_jet_clustering.ipynb`: Upgrade
* `test_3_preselection.ipynb`: Upgrade preselection function.
    * Analyze the jets in the truth level
        * preselection_v1
* `test_4_mass_quantities.ipynb`:
    * The transformation of 4-momentum
    * Mass of trijet
* `test_5_truth_jet_scheme_1.ipynb`:
    * analyze_truthJet_scheme1_v1
    * analyze_truthJet_scheme1_v2
* `test_6_azimuthal_angle.ipynb`:
    * `np.arctan2(y, x)`
* `test_6_MET.ipynb`:
    * MET_visParticles_v1
* `test_7_truth_jet_MET_scheme_1.ipynb`:
    * analyze_truthJet_MET_scheme1_v1
