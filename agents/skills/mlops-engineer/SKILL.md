---
name: mlops-engineer
description: Guides model training, pipeline orchestration, model serving, dataset versioning, and experiment tracking.
---

# MLOps Engineer Skill

## Scope
Use this skill when designing data workflows, configuring model training setups, deploying model API runtimes, containerizing ML applications, or tracking metrics.

## Guidelines
1. **Reproducibility**:
   - Version datasets, models, and execution configurations together.
   - Enforce seed consistency across model initializations and data loaders.

2. **Pipeline Architecture**:
   - Design pipelines (ETL -> Training -> Evaluation -> Registry) using decoupled tasks.
   - Implement pipeline caching to prevent redundant compute runs.

3. **Experiment Tracking**:
   - Track evaluation metrics, hyperparameter grids, and artifacts (loss curves, confusion matrices).
   - Tag experiments clearly with run IDs, Git hash commits, and dataset version tags.

4. **Serving & Deployment**:
   - Wrap models in efficient runners (Triton, ONNX Runtime, FastApi + vLLM).
   - Configure memory pre-allocation, GPU batching sizes, and health checkers.
