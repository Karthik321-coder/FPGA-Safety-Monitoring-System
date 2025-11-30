# FPGA-Based Transport Safety Monitoring System 🚗⚡

**An Advanced ML-Driven Anomaly Detection System with Self-Diagnosis (ISO 26262 ASIL-D Ready)**

![Status](https://img.shields.io/badge/Status-Prototype_Ready-green)
![Platform](https://img.shields.io/badge/FPGA-Artix--7-blue)
![Latency](https://img.shields.io/badge/Latency-42ms-brightgreen)

## 📌 Project Overview
This project implements a high-speed, predictive vehicle safety controller on an **Artix-7 FPGA**. Unlike traditional ECUs that react to accidents, this system uses a **50-tree Random Forest model** to detect dangerous driving patterns (drift, erratic steering) *before* a collision occurs.

### 🚀 Key Features
*   **Ultra-Low Latency:** Deterministic **42ms** response time (4x faster than microcontrollers).
*   **Edge AI:** Custom **Q8.8 Fixed-Point** Inference Engine running directly on hardware.
*   **Fault Tolerance:** 5-Layer "Defense-in-Depth" architecture to detect stuck sensors and clock failures.
*   **Cost Effective:** BOM cost of **$118**, making advanced safety accessible for the Indian market.

## 📂 Repository Structure
*   `src/` - Verilog RTL source codes (Top module, FSM, Sensor Interface).
*   `tb/` - SystemVerilog testbenches for verification.
*   `python/` - Machine Learning training scripts and accuracy analysis.
*   `docs/` - Project Report and timing diagrams.

## 🛠️ Technical Specs
| Metric | Value |
| :--- | :--- |
| **Target Device** | Xilinx Artix-7 (XC7A35T) |
| **Logic Utilization** | ~65% LUTs, 22% FFs |
| **Power Consumption** | 3.4W (Active) |
| **ML Model** | Random Forest (50 Trees, Depth 8) |
| **Safety Standard** | Designed for ISO 26262 ASIL-D |

## 🎥 Simulation Demo
*(Add a link to your YouTube demo video here if available)*

## 👨‍💻 Team
*   **[Your Name]** - FPGA Architecture & ML Integration
*   [Teammate Name] - Hardware Design & Testing
