#!/usr/bin/env nextflow
nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc'
include { CUTADAPT_PE } from './modules/cutadapt_pe'

workflow {

    Channel
        .fromFilePairs("data/*_R{1,2}.fastq.gz", checkIfExists: true)
        .set { paired_ch }

    FASTQC(paired_ch)
    CUTADAPT_PE(paired_ch)
}
