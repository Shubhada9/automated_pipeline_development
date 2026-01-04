#!/bin/bash -ue
cutadapt         -q 20         -o trimmed_sample_R1.fastq.gz         -p trimmed_sample_R2.fastq.gz         sample_R1.fastq.gz sample_R2.fastq.gz
