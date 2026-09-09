from SigProfilerMatrixGenerator.scripts import SigProfilerMatrixGeneratorFunc as matGen

PROJECT = "two_vcf_pilot"
REFERENCE_GENOME = "GRCh38"
INPUT_DIRECTORY = "03_vcf_links/pilot_one_vcf"

matGen.SigProfilerMatrixGeneratorFunc(
    project=PROJECT,
    reference_genome=REFERENCE_GENOME,
    path_to_input_files=INPUT_DIRECTORY,
    exome=False,
    chrom_based=False,
    plot=True
)

