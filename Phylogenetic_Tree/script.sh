cd ./Phylogenetic_Tree
muscle -align Mevalonate_kinase.fasta -output Mevalonate_kinase_muscle.afa
trimal -in Mevalonate_kinase_muscle.afa -out Mevalonate_kinase_trim.fasta -automated1
iqtree3 -s Mevalonate_kinase_trim.fasta -m MFP -bb 1000 -bnni --prefix SC5D -redo -nt AUTO