# Computational Biology Lab  

This repository contains practical assignments and projects completed as part of the **Computational Biology Lab** course. The work is divided into three parts: A, B, and C, covering topics from protein analysis and molecular dynamics to modeling and transcriptome data analysis.

---

## Part A: Protein Analysis and Structure-Based Drug Design  

### 1. **Discrimination of α-helical and β-barrel Membrane Proteins using Amino Acid Composition**  
- **Objective**: Differentiate between α-helical and β-barrel membrane proteins based on amino acid composition.  
- **Tools**: PDBTM database, custom Python scripts.  
- **Key Steps**:  
  - Processed FASTA files to calculate amino acid compositions.  
  - Identified significant amino acids for discrimination using the Fisher Discriminant Ratio.  
  - Evaluated **sensitivity**, **specificity**, and **accuracy** by analyzing composition deviation for helix and β-barrel membrane proteins.  

### 2. **Discrimination of α-helical and β-barrel Membrane Proteins using Machine Learning Techniques**  
- **Objective**: Use machine learning to classify membrane proteins and assess amino acid importance.  
- **Tools**: WEKA.  
- **Machine Learning Techniques Used**:  
  - Naive Bayes  
  - Logistic Regression  
  - Multilayer Perceptrons  
  - KStar  
  - Random Forest  
  - Bagging  

### 3. **Structure-Based Drug Design: Identifying Hit Compounds for a Kinase Protein**  
- **Target Protein**: PDB ID: `1IEP` (kinase protein).  
- **Docking Tool**: AutoDock and AutoDock Vina.  
- **Key Details**:  
  - **Active site residues**: Lys271, Thr315, Glu286.  
  - Grid box dimensions:  
    - size_x = 60, size_y = 46, size_z = 44.  
    - Offset: x = -11.278, y = 18.056, z = 6.944.  
    - Spacing: 0.375 Å.  
    - center_x = 7.025, center_y = 93.837, center_z = 61.323.  
  - Performed **flexible docking** with flexible residues GLU64, ALA65, ASP159, PHE160, GLY161.  
- **Ligands Screened**:  
  - ZINC126204226, ZINC1283491630, ZINC49895016, ZINC118332804, ZINC31233162, ZINC235987838, ZINC295506072.  
- **Analysis**: Tabulated interactions using LigPlus.

---

## Part B: Molecular Dynamics Simulations  

### 1. **VMD Tutorial**  
- **System**: PDB ID: `2XNI` (Protein-ligand complex of a novel macrocyclic HCV NS3 protease inhibitor derived from amino cyclic boronates).  

### 2. **GROMACS Tutorial**  
- **System**: PDB ID: `1UBQ` (Ubiquitin).  
- **Workflow**:  
  - Energy minimization (50023 steps).  
  - NVT equilibration at 310K.  
  - NPT equilibration at 310K and 1 bar pressure.  
  - Production MD simulation for 1 ns.  
- **Analysis**: Temperature, pressure, and energy variations over time.  

### 3. **MD Trajectory Analysis using GROMACS**  
- Metrics calculated:  
  - Root Mean Square Deviation (RMSD).  
  - Root Mean Square Fluctuation (RMSF).  
  - Radius of Gyration (Rg).  
  - Average hydrogen bonds per time frame.  
  - Distance between specific atoms over time.  

---

## Part C: Modeling and Data Analysis  

### 1. **Constraint-Based Modeling**  
- **Tool**: MATLAB.  
- **System**: Oryza sativa metabolic model.  
- **Objective**: Reproduce results from the paper:  
  *"Elucidating Rice Cell Metabolism under Flooding and Drought Stresses Using Flux-Based Modeling and Analysis"*.  
- **Techniques**: Flux Balance Analysis (FBA) and Flux Variability Analysis (FVA).  

### 2. **Dynamic Modeling**  
- **Objective**: Solve differential equations for dynamic modeling of the TCA cycle.  
- **Tools**: MATLAB and COPASI.  
- **Methods Used**:  
  - Runge-Kutta method.  
  - Euler method.  

### 3. **Transcriptome Data Analysis**  
- **Tasks**:  
  - Principal Component Analysis (PCA).  
  - Differential Gene Expression Analysis.  
  - Functional Enrichment Analysis (KEGG Pathway).  
- **Data**: Provided transcriptome dataset.  
