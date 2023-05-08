# NumericTCORE

## Repository Structure

- `bin/`: the compiler's executable
- `benchmark/`: benchmarks instances
- `NumericTCORE/`: implementation of Numeric Tcore

## Installation

Numeric Tcore uses the following external libraries:
- unified-planning version 0.5.0.179.dev1
- click
- sympy

Use the following commands to install Numeric Tcore. We suggest starting with a fresh python environment (we tested with python 3.10).

1. Install dependencies:
```
pip install unified_planning==0.5.0.179.dev1
pip install click sympy
```

2. From the "NumericTCORE" directory, install the package with:
```
pip install .
```

## Running the compilation

The main entrypoint of Numeric Tcore is "./bin/ntcore.py". Basic usage:
```
python ./bin/ntcore.py DOMAIN PROBLEM OUTPUT_PATH
```

- `DOMAIN` is the path to the pddl domain file.
- `PROBLEM` is the path to the pddl problem file.
- `OUTPUT_PATH` is the path to the folder (which must exist) that will contain the compiled domain problem files.

To switch between the three variants of Numeric Tcore, use one of the following commands:
```
python ./bin/metcore.py DOMAIN PROBLEM OUTPUT_PATH --naive_mode
python ./bin/metcore.py DOMAIN PROBLEM OUTPUT_PATH --regression_mode
python ./bin/metcore.py DOMAIN PROBLEM OUTPUT_PATH --delta_mode
```

As the name suggest, --naive_mode runs ntcore^N, --regression_mode runs ntcore^R and --delta_mode runs ntcore^\Delta.
The default strategy is `--regression_mode`. For more infos, run ```python ./bin/ntcore.py --help```

# Example

While inside the NumericTCORE folder, to compile the first instance of counters with ntcore^\Delta you can run:

```python ./bin/ntcore.py benchmark/fn-counters/domain.pddl benchmark/fn-counters/instance_2.pddl . --delta_mode```



