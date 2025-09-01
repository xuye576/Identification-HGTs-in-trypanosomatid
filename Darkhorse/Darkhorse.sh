
#The species Lotmaria passim is used as an example and the process for the remaining species is the same.


cd ./Darkhorse
#Run a BLAST query of all protein sequences in a genome (or metagenome) against the informative sequence set output from the installer program.
./diamond makedb --in DarkHorseHGT_informative_ref_seqs.fasta -d DarkHorseHGT
./diamond blastp -d DarkHorseHGT.dmnd -q Lotmaria_passim.fa -a Lotmaria_passim.daa -e 1e-5 -t . --max-target-seqs 100 -p 4
./diamond view -a Lotmaria_passim.daa -f tab  -o Lotmaria_passim.m8

#Create an exclude_list file to remove self-matches from blast search results, if necessary
./Darkhorse2-DarkHorse-2.0_rev09/bin/accessory_scripts/generate_dh_self_keywords.pl -i source_datafile -c config_template

#Running Darkhorse
./Darkhorse2-DarkHorse-2.0_rev09/bin/darkhorse2.pl -c config_template -t Lotmaria_passim.m8 -e Lotmaria_passim_exclude_list -g Lotmaria_passim.fa 
