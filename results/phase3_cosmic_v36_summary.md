# Phase 3 — COSMIC v3.6 SBS assignment

First trial
- Tool: SigProfilerAssignment 1.1.5
- Input: cohort SBS96 matrix
- Samples fitted: 15,691
- COSMIC SBS reference signatures: 101
- Total SBS mutations: 374,518,698
- Activity/burden reconciliation: 15,691 / 15,691 samples matched exactly
- Median reconstruction cosine similarity: 0.976
- 5th percentile cosine similarity: 0.918
- Samples with cosine < 0.90: 543
- Low-burden (<100 SBS) among these: 26
- Adequate-burden poor-fit candidates: 517

Interpretation: COSMIC v3.6 reconstructs most cohort SBS96 profiles well.
The 517 adequate-burden samples below cosine 0.90 are prioritised for
QC, residual inspection, and downstream outlier analysis; they are not
claimed to represent novel signatures without further validation.
