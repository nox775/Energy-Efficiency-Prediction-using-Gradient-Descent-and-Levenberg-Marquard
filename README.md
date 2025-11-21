# Neural Network Optimization: Gradient Descent vs. Levenberg-Marquardt

This project implements and compares two fundamental optimization algorithms for training an Artificial Neural Network (ANN) "from scratch" in MATLAB: **Gradient Descent (GD)** and the **Levenberg-Marquardt (LM)** algorithm.

The network is designed to predict the **Heating Load (HL)** of buildings using the *Energy Efficiency (ENB2012)* dataset. The implementation focuses on the mathematical mechanics of training, manually calculating gradients and Jacobians without relying on high-level black-box toolboxes (like `trainlm`).

## 📂 Dataset

The project uses the `ENB2012_data.xlsx` dataset (available from the UCI Machine Learning Repository).

* **Features (Inputs - Columns 1-8):** Relative Compactness, Surface Area, Wall Area, Roof Area, Overall Height, Orientation, Glazing Area, Glazing Area Distribution.
* **Target (Output - Column 9):** Heating Load (HL).
* **Preprocessing:**
    * **Normalization:** Zero mean, unit variance (Z-score).
    * **Bias:** A bias term (column of 1s) is added to the inputs.
    * **Split:** 80% Training / 20% Testing.

## 🧠 Network Architecture

* **Type:** Single Hidden Layer Feed-forward Network.
* **Input Layer:** $n$ features + bias.
* **Hidden Layer:** 16 neurons (using `siglin` activation).
* **Output Layer:** 1 neuron (Linear activation).
* **Initialization:** Weights are initialized with random values from a normal distribution.

## ⚙️ Implemented Algorithms

### 1. Gradient Descent (GD)
A standard first-order iterative optimization algorithm.
* **Parameters:** Fixed learning rate ($\alpha = 0.01$).
* **Logic:** Updates weights in the opposite direction of the cost function's gradient.
* **Stopping Criteria:** Maximum iterations or gradient norm threshold.

### 2. Levenberg-Marquardt (LM)
A robust second-order algorithm (Hessian approximation), typically much faster for regression problems.
* **Adaptive Parameters:** Dynamically adjusts the damping factor ($\beta$) and step size ($\alpha$).
* **Logic:** Interpolates between the Gauss-Newton algorithm and Gradient Descent. If the loss increases, the step is retracted and the damping factor is increased.
* **Calculation:** Uses Jacobians to approximate the curvature of the error surface.

## 📊 Visualizations & Results

The script generates 4 comparative figures to analyze performance:

1.  **Error vs. Iterations:** Comparing the convergence speed of the gradient norms.
2.  **Error vs. Time:** Real-time efficiency comparison.
3.  **Loss vs. Iterations:** How fast the cost function decreases per epoch.
4.  **Loss vs. Time:** The overall training efficiency.

Finally, the script calculates the **$R^2$ (Coefficient of Determination)** on the test set for both methods to evaluate generalization.

## 🚀 Usage

### Prerequisites
* MATLAB (Any recent version).
* The `ENB2012_data.xlsx` file in the root directory.

### Dependencies
Ensure the following custom functions are present in your MATLAB path (these are called within the main script):
* `gradient_x_big.m` & `gradient_x.m` (Gradient calculations)
* `jacobian.m` (Jacobian matrix calculation for LM)
* `siglin.m` (Activation function)
* `loss.m` (Cost function, likely MSE/SSE)
* `R2.m` (Performance metric)

### Execution
Run the main script:

```matlab
>> main_script_name
