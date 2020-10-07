function x = DecodeChromosome(chromosome, numberOfGenes, variableRange)

    m = size(chromosome, 2);
    k=m/numberOfGenes;
    
    x(1) = 0.0;
    for j = 1:k
        x(1) = x(1) + chromosome(j)*2^(-j);
    end
    x(1) = -variableRange + 2*variableRange*x(1)/(1-2^(-k));
    
    x(2) = 0.0;
    for j = 1:k
        x(2) = x(2) + chromosome(j+k)*2^(-j);
    end
    x(2) = -variableRange + 2*variableRange*x(2)/(1 -2^(-k));

end