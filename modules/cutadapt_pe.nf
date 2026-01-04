process CUTADAPT_PE {

    tag "$sample_id"

    publishDir "results/cutadapt", mode: 'copy'

    input:
    tuple val(sample_id), path(reads)

    output:
    tuple val(sample_id),
          path("trimmed_${sample_id}_R1.fastq.gz"),
          path("trimmed_${sample_id}_R2.fastq.gz")

    script:
    """
    cutadapt \
        -q 20 \
        -o trimmed_${sample_id}_R1.fastq.gz \
        -p trimmed_${sample_id}_R2.fastq.gz \
        ${reads[0]} ${reads[1]}
    """
}
