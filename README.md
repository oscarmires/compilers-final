# Final project

Please create a compiler that reads human sentences and generate pandas queries that search over the F1 files from https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020

## Download and execute instructions

Requirements:
- YACC and FLEX
- a C compiler (preferably `gcc`)
- (recommended) a Unix-like OS

1. Clone the repo:
```bash
git clone https://github.com/oscarmires/compilers-final.git
```
2. Go to the `query-analyzer` directory and make the scripts executable:
```
chmod 744 compile.sh
chmod 744 run.sh
```
3. Compile the lexer and parser files:
```
./compile.sh
```
4. Run the demo (an empty prompt will appear).
```
./run.sh
```
5. Write your query or paste the example found at `input.txt`. Then press enter.

You can find the generated Python code in `output/out.py`.
