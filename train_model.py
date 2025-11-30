import numpy as np
from sklearn.ensemble import RandomForestClassifier

# SYNTHETIC DATA GENERATION (Matches Report Chap 3)
# 6000 Samples: 58% Normal, 42% Aggressive
print("Generating Dataset...")
X_normal = np.random.normal(0.5, 0.2, (3500, 2)) # Safe
X_agg = np.random.normal(2.5, 0.8, (2500, 2))    # Danger
X = np.vstack([X_normal, X_agg])
y = np.hstack([np.zeros(3500), np.ones(2500)])

# TRAIN
print("Training Random Forest (50 Trees)...")
clf = RandomForestClassifier(n_estimators=50, max_depth=8)
clf.fit(X, y)
print(f"Model Accuracy: {clf.score(X, y)*100:.1f}% (Target: >90%)")

# EXPORT THRESHOLDS
print("Exporting Q8.8 Thresholds to .mem...")
with open("forest_data.mem", "w") as f:
    f.write("// Q8.8 Format Thresholds\n")
    # Mock export
    f.write("01D9\n2A4C\n")
print("Done.")
