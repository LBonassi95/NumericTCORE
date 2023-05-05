# NumericTCORE

## Repository Structure

- `bin/`: the compiler's executable
- `benchmark/`: benchmarks instances
- `NumericTCORE/`: implementation of Numeric Tcore

## Installation

Metric Tcore uses the following external libraries:
- unified-planning version 0.5.0.179.dev1
- click
- sympy

Use the following commands to install Numeric Tcore. We suggest starting with a fresh python environment (we tested with python 3.10).

Install dependencies
```
pip install unified_planning==0.5.0.179.dev1
pip install click sympy
```
Switch to the "NumericTCORE" directory
```
cd PATH_TO_NumericTCORE
```
Once inside, install the numeric_tcore library with
```
pip install .
```

## Running the compilation

If installed correctly, Numeric Tcore can be used by launching "./bin/metcore.py". 
```
python ./bin/metcore.py DOMAIN PROBLEM OUTPUT_PATH
```
To switch between the three variants of Numeric Tcore us one of the following commands:
```
python ./bin/metcore.py DOMAIN PROBLEM OUTPUT_PATH --naive_mode
python ./bin/metcore.py DOMAIN PROBLEM OUTPUT_PATH --regression_mode
python ./bin/metcore.py DOMAIN PROBLEM OUTPUT_PATH --delta_mode
```

As the name suggest, --naive_mode runs metcore^N, --regression_mode runs metcore^R and --delta_mode runs metcore^\Delta.
