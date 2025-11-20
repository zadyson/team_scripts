#!/usr/bin/env python3

"""
renumber_cds_trna.py

A command-line tool to renumber CDS, tRNA, and handle pseudogene features in a GenBank file.
Note: treats pseudogenes related to tRNA as tRNA for numbering purposes.

Usage:
    python renumber_cds_trna.py -i input.gbk -o output.gbk --prefix GENE_ --zeros 5
"""

import argparse
from Bio import SeqIO


def renumber_cds_trna(input_gbk, output_gbk, prefix="LOCUS_", zeros=5):
    record = SeqIO.read(input_gbk, "genbank")

    counter_cds = 1
    counter_trna = 1

    for feat in record.features:
        # CDS features
        if feat.type == "CDS":
            new_tag = f"{prefix}{counter_cds:0{zeros}d}"
            feat.qualifiers["locus_tag"] = [new_tag]
            feat.qualifiers["ID"] = [new_tag]
            counter_cds += 1

        # tRNA features
        elif feat.type == "tRNA":
            new_tag = f"tRNA{counter_trna:0{zeros}d}"
            feat.qualifiers["locus_tag"] = [new_tag]
            feat.qualifiers["ID"] = [new_tag]
            counter_trna += 1

        # Pseudogene features containing 'tRNA' in ID are renumbered as tRNA
        elif feat.type == "pseudogene" and "ID" in feat.qualifiers and any("tRNA" in val for val in feat.qualifiers["ID"]):
            new_tag = f"tRNA_{counter_trna:0{zeros}d}"
            feat.qualifiers["locus_tag"] = [new_tag]
            feat.qualifiers["ID"] = [new_tag]
            counter_trna += 1

    SeqIO.write(record, output_gbk, "genbank")
    print(f"Renumbered {counter_cds-1} CDS features and {counter_trna-1} tRNA features (including relevant pseudogenes).")
    print(f"Output written to: {output_gbk}")


def main():
    parser = argparse.ArgumentParser(description="Renumber CDS and tRNA locus_tags in a GenBank file, including pseudogenes with tRNA IDs.")
    parser.add_argument("-i", "--input", required=True, help="Input GenBank file")
    parser.add_argument("-o", "--output", required=True, help="Output GenBank file")
    parser.add_argument("--prefix", type=str, default="LOCUS_", help="Prefix for CDS locus_tags")
    parser.add_argument("--zeros", type=int, default=5, help="Number of leading zeros")
    args = parser.parse_args()
    renumber_cds_trna(args.input, args.output, args.prefix, args.zeros)


if __name__ == "__main__":
    main()
