#!/usr/bin/env bash
set -euo pipefail

# Usage:
# bash scripts/02_make_pass_sbs_vcf.sh input.vcf.gz output.vcf


if [[ $# -ne 2 ]]; then
    echo "Usage: bash scripts/02_filter_pass_sbs_vcf.sh input.vcf.gz output.vcf" >&2
    exit 1
fi

INPUT_VCF="$1"
OUTPUT_VCF="$2"

if [[ ! -f "$INPUT_VCF" ]]; then
    echo "ERROR: Input VCF does not exist: $INPUT_VCF" >&2
    exit 1
fi

mkdir -p "$(dirname "$OUTPUT_VCF")"

zgrep '^#' "$INPUT_VCF" > "$OUTPUT_VCF"

zgrep -v '^#' "$INPUT_VCF" \
  | awk -F'\t' '
      $7 == "PASS" &&
      length($4) == 1 &&
      length($5) == 1 &&
      $1 ~ /^chr([1-9]|1[0-9]|2[0-2]|X|Y)$/
    ' \
  >> "$OUTPUT_VCF"

echo "Filtered VCF written: $OUTPUT_VCF"
echo "Retained records: $(grep -vc '^#' "$OUTPUT_VCF")"

