#!/usr/bin/env python3

"""
renumber_cds.py

A command-line tool to renumber CDS locus_tags and update their ID qualifiers in a GenBank genome file.

Usage:
    python renumber_cds.py -i input.gbk -o output.gbk --prefix CDS_ --zeros 5
"""

import argparse
from Bio import SeqIO
from Bio.SeqFeature import SeqFeature

def renumber_cds_locus_tags(input_gbk, output_gbk, prefix="CDS_", zeros=5):
    record = SeqIO.read(input_gbk, "genbank")
    counter = 1

    for feat in record.features:
        if feat.type == "CDS":
            new_tag = f"{prefix}{counter:0{zeros}d}"
            feat.qualifiers["locus_tag"] = [new_tag]
            # Update the ID qualifier to match the new locus_tag
            feat.qualifiers["ID"] = [new_tag]
            counter += 1

    SeqIO.write(record, output_gbk, "genbank")
    print(f"Renumbered {counter-1} CDS features and updated IDs.")
    print(f"Output written to: {output_gbk}")


def main():
    parser = argparse.ArgumentParser(
        description="Renumber CDS locus_tags and update IDs in a GenBank file with a specified prefix and number of leading zeros."
    )

    parser.add_argument("-i", "--input", required=True, help="Input GenBank file")
    parser.add_argument("-o", "--output", required=True, help="Output GenBank file")
    parser.add_argument("--prefix", type=str, default="LOCUS_", help="Prefix for renumbering CDS locus_tags")
    parser.add_argument("--zeros", type=int, default=5, help="Number of leading zeros in locus_tag & ID numbering")

    args = parser.parse_args()
    renumber_cds_locus_tags(args.input, args.output, args.prefix, args.zeros)


if __name__ == "__main__":
    main()
