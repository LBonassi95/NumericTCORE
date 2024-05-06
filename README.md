# NumericTCORE

## Repository Structure

- `bin/`: the compiler's executable
- `benchmark/`: benchmarks instances
- `NumericTCORE/`: implementation of Numeric Tcore

## Installation

Numeric Tcore uses the following external libraries:
- unified-planning version 1.0.0.29.dev1
- click
- sympy

Use the following commands to install Numeric Tcore. We suggest starting with a fresh Python environment (we tested with Python 3.10).

1. Install dependencies:
```
pip install click sympy unified_planning==1.0.0.29.dev1 --no-cache-dir
```

2. From the "NumericTCORE" directory, install the package with:
```
pip install .
```

## Running the compilation

The main entry point of Numeric Tcore is "./bin/ntcore.py". Basic usage:
```
python ./bin/ntcore.py DOMAIN PROBLEM OUTPUT_PATH
```

- `DOMAIN` is the path to the pddl domain file.
- `PROBLEM` is the path to the pddl problem file.
- `OUTPUT` is the path to the folder (which must exist) that will contain the compiled domain and problem files.

To switch between the two variants of Numeric Tcore, use one of the following commands:
```
python ./bin/ntcore.py DOMAIN PROBLEM OUTPUT --naive_mode
python ./bin/ntcore.py DOMAIN PROBLEM OUTPUT --delta_mode
```

The option --naive_mode runs the basic version of ntcore, while --delta_mode runs ntcore^+.
The default is `--naive_mode`. For more informations, run ```python ./bin/ntcore.py --help```

## Limitations
The current version of Numeric Tcore has been thoroughly tested with trajectory constraints featuring formulas with only numeric conditions (those in the `benchmark/`).
In principle, Numeric Tcore supports propositional constraints, but in practice, such a feature has only been briefly tested.

# Example

While inside the NumericTCORE folder, to compile the first instance of counters with ntcore^+ you can run:

```python ./bin/ntcore.py benchmark/fn-counters/domain.pddl benchmark/fn-counters/instance_2.pddl . --delta_mode```

# Citation

```
@inproceedings{DBLP:conf/aaai/BonassiGS24,
  author       = {Luigi Bonassi and
                  Alfonso Emilio Gerevini and
                  Enrico Scala},
  title        = {Dealing with Numeric and Metric Time Constraints in {PDDL3} via Compilation
                  to Numeric Planning},
  booktitle    = {{AAAI}},
  pages        = {20036--20043},
  publisher    = {{AAAI} Press},
  year         = {2024}
}
```
