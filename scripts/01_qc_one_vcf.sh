#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
    echo "Usage: bash scripts/01_qc_one_vcf.sh /full/path/to/input.vcf.gz sample_label" >&2
    exit 1
fi

VCF="$1"
SAMPLE_LABEL="$2"
OUTDIR="02_qc"
REPORT="${OUTDIR}/${SAMPLE_LABEL}_qc.txt"

mkdir -p "$OUTDIR"

if [[ ! -f "$VCF" ]]; then
    echo "ERROR: VCF does not exist: $VCF" >&2
    exit 1
fi

if [[ ! -f "${VCF}.tbi" ]]; then
    echo "ERROR: Missing VCF index: ${VCF}.tbi" >&2
    exit 1
fi

{
    echo "pilot_sample_label: ${SAMPLE_LABEL}"
    echo "pilot_vcf: ${VCF}"
    echo "vcf_size:"
    ls -lh "$VCF" | awk '{print $5, $9}'
    echo

    echo "sample_header:"
    zgrep '^#CHROM' "$VCF"
    echo

    echo "total_variant_records:"
    zgrep -vc '^#' "$VCF"
    echo

    echo "PASS_records:"
    zgrep -v '^#' "$VCF" \
        | awk -F'\t' '$7 == "PASS"' \
        | wc -l
    echo

    echo "PASS_canonical_SBS_records:"
    zgrep -v '^#' "$VCF" \
        | awk -F'\t' '
            $7 == "PASS" &&
            length($4) == 1 &&
            length($5) == 1 &&
            $1 ~ /^chr([1-9]|1[0-9]|2[0-2]|X|Y)$/
        ' \
        | wc -l
    echo

    echo "FILTER_counts:"
    zgrep -v '^#' "$VCF" \
        | cut -f7 \
        | tr ";" "\n" \
        | sort \
        | uniq -c \
        | sort -nr
} > "$REPORT"

echo "QC completed successfully."
echo "Report written to: $REPORT"
