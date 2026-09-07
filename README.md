# BIOF3001 — Discovering Unusual Mutational Signatures in Cancer Genomes

## Purpose

This repository documents a reproducible workflow for identifying unusual mutational-signature profiles in cancer whole-genome sequencing samples.

## Supervisor-directed aim

The primary tool to investigate first is SigProfilerExtractor for de novo mutational-signature extraction. The intended analysis is to run a validated workflow across the full cleaned cohort, expected to contain approximately 15,000 tumour samples after duplicate handling, then identify and investigate unusual signature profiles.

## Source data

Raw source VCFs are read-only and are not stored in this repository.

- TCGA WGS: `/storage5/jwlab/Jason/TCGA_WGS/`
- non-TCGA annotated: `/storage5/jwlab/Jason/nonTCGA_annotated/`

## Current stage

HPC access established. Environment, VCF structure, reference build, duplicate handling and pilot MatrixGenerator compatibility are being assessed before full-cohort extraction.

## Data protection

Never commit raw VCFs, VCF indexes, controlled metadata, patient-level information, passwords, SSH keys, API tokens, or large generated results.


