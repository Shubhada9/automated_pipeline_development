process CUTADAPT {

    tag "$sample_id"

    input:
    tuple val(sample_id), path(reads)

    output:
    tuple val(sample_id), path("trimmed_${reads.name}")

    script:
    """
    cutadapt -q 20 -o trimmed_${reads} ${reads}
    """
}
