FILE=/data-shared/vcf_examples/luscinia_vars_flags.vcf.gz   




< $FILE zcat | grep -v '^#' | grep -e 'chr1\s' -e 'chrZ\s' | cut -f1-6 > six-columns.vcf

< $FILE zcat | grep -v '^#' | grep -e 'chr1\s' -e 'chrZ\s' | egrep -o 'DP=[^;]*' | sed 's/DP=//' > DP-values.vcf

< $FILE zcat | grep -v '^#' | grep -e 'chr1\s' -e 'chrZ\s' | awk '{if($0 ~ /INDEL/) print "INDEL"; else print "SNP"}' > variant-types.vcf

wc -l *.vcf

paste six-columns.vcf DP-values.vcf variant-types.vcf > final-file.vcf

