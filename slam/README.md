# SLAM Notebooks

This folder contains a theory-first, self-contained learning track for probabilistic robotics and SLAM implemented in pure Python Jupyter notebooks.

---

## Notebooks

### How to use the notebooks

Each notebook is **self-contained**: it imports only the standard scientific Python stack (`numpy`, `scipy`, `matplotlib`) and defines every helper function inline. No ROS 2 installation is required to run them.

**Prerequisites**
Create you own Python environment (e.g. with `venv` or `conda`) or use the global Python 

```bash
# Create a virtual environment (optional but recommended)
python -m venv slam-env
source slam-env/bin/activate

# On Windows:
slam-env\Scripts\activate

# If you have conda, you can create an environment with:
conda create -n slam-env python=3.10
conda activate slam-env

# If you prefer using pip without virtual environments, you can skip the above steps and install dependencies globally.

```

Once you have your Python environment ready or simply from your global Python environment, install the required dependencies:
```bash
pip install -r slam/requirements.txt   # numpy, scipy, matplotlib, jupyterlab
```

**Jupyter usage**
We recommend using the VScode Jupyter extension for an integrated experience, but you can also run the notebooks with JupyterLab or Jupyter Notebook.

---

### Notebooks overview

The notebooks are organised in four modules with a pedagogical progression.

```
notebooks/
├── 0_introduction/
├── 1_kalman_filters/
├── 2_particle_filters/
├── 3_graph_based/
├── figures/             ← shared assets used by all notebooks
```

