 function mutatedChromosome = Mutate(chromosome,mutationProbability)

 
   %swap to genes in a chromosome
 nGenes = size(chromosome,2);
 mutatedChromosome = chromosome;
 for j = 1:nGenes
    r = rand;
    if (r < mutationProbability)
        randomGene = 1 + fix(rand*nGenes);
        mutatedChromosome([j randomGene]) = mutatedChromosome([randomGene j]);
   end
 end

 end