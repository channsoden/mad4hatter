
import sys
print(sys.argv)

allele_table = sys.argv[1]
infh = open(allele_table, 'r')
infh.readline() # Trash the header

variants = {}
for line in infh:
    sampleID, locus, asv, reads, pseudocigar, pool = line.strip().split()
    reads = float(reads)
    try:
        variants[locus][asv] += reads
        print('old asv')
    except KeyError:
        try:
            variants[locus][asv] = reads
        except KeyError:
            variants[locus] = {asv: reads}

outfh = open('exercise_data.tsv', 'w')
print('\t'.join(['Locus', 'ASV', 'Freq']), file=outfh) # Header

for locus, asvs in variants.items():
    total = float(sum(asvs.values()))
    for asv, freq in asvs.items():
        freq = str(freq / total)
        print('\t'.join([locus, asv, freq]), file=outfh)

        

