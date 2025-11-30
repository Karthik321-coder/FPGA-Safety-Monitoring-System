# FPGA-Based Transport Safety Monitoring System 🚗⚡

**An Advanced ML-Driven Anomaly Detection System with Self-Diagnosis (ISO 26262 ASIL-D Ready)**


## 📌 Project Overview
This project implements a high-speed, predictive vehicle safety controller on an **Artix-7 FPGA**. Unlike traditional ECUs that react to accidents, this system uses a **50-tree Random Forest model** to detect dangerous driving patterns (drift, erratic steering) *before* a collision occurs.

## 🏗️ System Architecture
The system follows a strict 7-stage parallel pipeline architecture, ensuring deterministic latency of **42ms**. The "Health Monitor" runs in parallel to the ML engine, providing a fail-safe mechanism compliant with **ISO 26262 ASIL-D**.

![System Flowchart](1764506915291.jpg)

## 📊 Technical Specifications
A summary of the key performance metrics achieved on the Artix-7 FPGA.

![Project Datasheet](1764506909066.jpg)

### 🚀 Key Features
*   **Ultra-Low Latency:** Deterministic **42ms** response time (4x faster than microcontrollers).
*   **Edge AI:** Custom **Q8.8 Fixed-Point** Inference Engine running directly on hardware.
*   **Fault Tolerance:** 5-Layer "Defense-in-Depth" architecture to detect stuck sensors and clock failures.
*   **Cost Effective:** BOM cost of **$118**, making advanced safety accessible for the Indian market.


## 🛠️ Technical Specs
| Metric | Value |
| :--- | :--- |
| **Target Device** | Xilinx Artix-7 (XC7A35T) |
| **Logic Utilization** | ~65% LUTs, 22% FFs |
| **Power Consumption** | 3.4W (Active) |
| **ML Model** | Random Forest (50 Trees, Depth 8) |
| **Safety Standard** | Designed for ISO 26262 ASIL-D |


## 👨‍💻 Team
*   **[KARTHIK M A]** - FPGA Architecture & ML Integration
