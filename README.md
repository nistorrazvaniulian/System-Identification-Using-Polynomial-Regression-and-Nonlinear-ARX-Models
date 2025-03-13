# System Identification Using Polynomial Regression and Nonlinear ARX Models

## Overview
This project focuses on **system identification**, a process of developing mathematical models to represent the behavior of dynamic systems. The goal is to create accurate models that can predict system responses based on input data. Two main approaches were used:
1. **Polynomial Regression** for approximating system behavior.
2. **Nonlinear AutoRegressive with eXogenous inputs (ARX)** for capturing dynamic and nonlinear system characteristics.

The models were validated using real datasets, optimized for accuracy, and refined to minimize prediction errors. This project demonstrates the application of advanced mathematical and computational techniques in system modeling and simulation.

---

## Table of Contents
1. [Project Goals](#project-goals)
2. [Methodology](#methodology)
   - [Polynomial Regression Model](#polynomial-regression-model)
   - [Nonlinear ARX Model](#nonlinear-arx-model)
   - [Validation and Optimization](#validation-and-optimization)
3. [Results](#results)
4. [Applications](#applications)
5. [How to Use](#how-to-use)
6. [Dependencies](#dependencies)

---

## Project Goals
- Develop accurate mathematical models to represent dynamic systems.
- Use **polynomial regression** and **nonlinear ARX models** to approximate and predict system behavior.
- Validate models using real datasets and optimize them for minimal prediction errors.
- Demonstrate the practical applications of system identification in fields like automation, robotics, and industrial processes.

---

## Methodology

### Polynomial Regression Model
- A polynomial regression model was developed to approximate the behavior of complex systems.
- The model was optimized using the **Least Squares Method**, which minimizes the error between predicted and actual system outputs.
- This approach provides a simplified yet effective representation of system dynamics, making it easier to analyze and interpret.

### Nonlinear ARX Model
- A **Nonlinear AutoRegressive with eXogenous inputs (ARX)** model was designed to capture the dynamic behavior of systems with nonlinear characteristics.
- The model was fine-tuned to improve prediction accuracy, making it suitable for complex and real-world scenarios.
- Nonlinear ARX models are particularly effective in identifying patterns and trends that linear models cannot capture.

### Validation and Optimization
- Both models were validated using **real datasets** to ensure their reliability and applicability.
- The **Akaike Information Criterion (AIC)** was used to optimize the model structure, balancing complexity and accuracy.
- Iterative refinement was performed to minimize errors, resulting in highly accurate simulations that closely match real system behavior.

---

## Results
- The polynomial regression model successfully approximated system behavior with minimal error.
- The nonlinear ARX model demonstrated superior accuracy in capturing dynamic and nonlinear system characteristics.
- Both models were validated on real datasets, showing high prediction accuracy and reliability.
- The optimized models can be used for system simulation, control design, and performance optimization in various fields.

---

## Applications
The models developed in this project have practical applications in:
- **Automation:** Simulating and controlling industrial processes.
- **Robotics:** Modeling robotic systems for improved performance.
- **Control Systems:** Designing controllers for dynamic systems.
- **Industrial Processes:** Optimizing system performance and reducing operational costs.

---

## How to Use
1. Clone the repository:
   ```bash
   git clone https://github.com/nistorrazvaniulian/System-Identification-Using-Polynomial-Regression-and-Nonlinear-ARX-Models.git

2. Navigate to the project directory:
   ```bash
   cd System-Identification-Using-Polynomial-Regression-and-Nonlinear-ARX-Models

3. Run the scripts in the scripts/ folder using MATLAB or Python, depending on the implementation.

4. Modify the datasets in the data/ folder to test the models with your own data.

---

## Dependencies
To run this project, you will need the following software and toolboxes:
- **MATLAB** (version R2020a or later recommended).
- **Toolboxes:**
  - **System Identification Toolbox**: Used for developing and validating the polynomial regression and nonlinear ARX models.
  - **Optimization Toolbox**: Used for optimizing model parameters and minimizing errors.
