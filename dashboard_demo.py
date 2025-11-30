import matplotlib.pyplot as plt
import numpy as np
from matplotlib.animation import FuncAnimation

# ULTIMATE DASHBOARD SIMULATION
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(10, 8))
fig.suptitle('FPGA SAFETY MONITOR - LIVE', color='red', fontweight='bold')

x_data, y_accel, y_state = [], [], []

def update(frame):
    x_data.append(frame)

    # Simulate Scenario: Normal -> Spike -> Fault
    if frame < 50: 
        val = 0.5 + np.random.normal(0, 0.1)
        state = 0
    elif frame < 80:
        val = 3.0 + np.random.normal(0, 0.5) # CRASH
        state = 3
    else:
        val = 3.14 # Stuck
        state = 4

    y_accel.append(val)
    y_state.append(state)

    ax1.clear(); ax2.clear()
    ax1.plot(x_data, y_accel, 'g-'); ax1.set_title('Accelerometer (G)'); ax1.set_ylim(0, 5)
    ax1.axhline(1.85, color='r', linestyle='--')

    ax2.step(x_data, y_state, 'b-'); ax2.set_title('FSM State'); ax2.set_ylim(-0.5, 4.5)
    ax2.set_yticks([0,1,2,3,4])
    ax2.set_yticklabels(['IDLE','WARN','CRIT','EMG','FAIL'])

ani = FuncAnimation(fig, update, interval=50)
plt.show()
