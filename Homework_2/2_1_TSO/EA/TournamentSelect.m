function iSelected = TournamentSelect(fitness, pTournament, tournamentSize)
  populationSize = size(fitness,1);
  iTmp = zeros(1, tournamentSize);
  
  
  for i =  1:tournamentSize                       % Store the tournament participants
     iTmp(1,i) = 1 + fix(rand*populationSize);    % in an array
  end
  
  done = false;
  i = 1;
  saveContestant =1;
  
  while ~done

 r = rand;
 
 if (fitness(iTmp(1, saveContestant)) >= fitness(iTmp(1, i+1))) % Compare the fitness of the winner from last stage
 if (r < pTournament)                                           % with the next "contester"
 iSelected = iTmp(1, saveContestant);
 done = true;
 else
   
    saveContestant = i+1;
    
    if i == tournamentSize-1    % if last man standing, select winner
        iSelected = iTmp(1, i+1);
        done = true;
    end
    
     i = i + 1;
 end
 
 
 elseif (fitness(iTmp(1, saveContestant)) < fitness(iTmp(1, i+1)))% Compare the fitness of the winner from last stage
 if (r < pTournament)                                           % with the next "contester"
 iSelected = iTmp(1, i+1);
 done = true;
 else
    
    
    if i == tournamentSize-1   % if last man standing, select winner
        iSelected = iTmp(1, saveContestant);
        done = true;
    end
    
    i = i + 1;
 end
         
 end
  end