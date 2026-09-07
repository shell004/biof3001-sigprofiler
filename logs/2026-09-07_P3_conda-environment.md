# P3-2026-09-07: BIOF3001 Conda environment creation

## Objective

Create and verify a personal modern-Python environment for the BIOF3001 SigProfiler project.

## Environment

- Server: `biomed1`
- Project directory: `/home/shell95/BIOF3001_Sigprofiler`
- Conda environment: `sigprofiler-biof3001`
- Environment location: `/home/shell95/.conda/envs/sigprofiler-biof3001`
- Python executable: `/home/shell95/.conda/envs/sigprofiler-biof3001/bin/python`
- Python version: `3.10.21`
- Pip executable: `/home/shell95/.conda/envs/sigprofiler-biof3001/bin/pip`
- Pip version: `26.2.1`

## Result

The environment activated successfully. Python and pip both resolve to the project-specific Conda environment rather than the system Python 3.6.8 installation.

## Decision

All Python-based BIOF3001 work—including SigProfilerMatrixGenerator, SigProfilerExtractor, SigProfilerAssignment, VCF/QC scripts, plotting, and outlier analysis—will be run after:

```bash
conda activate sigprofiler-biof3001
```

## Next action

Install and verify the core SigProfiler packages. Reference-genome installation remains deferred until actual VCF headers confirm the genome build.
