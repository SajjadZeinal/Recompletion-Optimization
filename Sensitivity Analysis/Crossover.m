function [ Crossed_Fitness ] = Crossover( Fitness )
Population_number = 6;
VariableNumber = 2;
Crossover_rate=[1,0.7,0.6,0.5,0.4,0.3];
    temp=1;
    Fitness_Crossed=Fitness;
    Cross_Assistant=Fitness_Crossed;
    Individual = Cross_Assistant(1,:);
    Individual2 = Cross_Assistant(1,:);
    Individual3 = Cross_Assistant(1,:);
    Individual4 = Cross_Assistant(1,:);
    Individual5 = Cross_Assistant(1,:);
for ii=1:Population_number
    random_Crossover(ii)=rand();
    if random_Crossover(ii) < Crossover_rate(ii)
        CrossoverChoromosome(temp) = ii;
        temp=temp+1;
    end
end
cross_count=Population_number;
if temp > 2
    if temp > 3
        temp = 4;
    end
    if temp == 3
       Crossover_Point = 1;
       Individual = [Fitness_Crossed(CrossoverChoromosome(1),1:Crossover_Point) , Fitness_Crossed(CrossoverChoromosome(2),Crossover_Point+1:VariableNumber)];
       Individual2 = [Fitness_Crossed(CrossoverChoromosome(2),1:Crossover_Point) , Fitness_Crossed(CrossoverChoromosome(1),Crossover_Point+1:VariableNumber)];
           Cross_Assistant(cross_count,:) = Individual;
           cross_count=cross_count-1;
    
           Cross_Assistant(cross_count,:) = Individual2;
           cross_count=cross_count-1;
           
       elseif temp == 4
        for ii=1:2
       Crossover_Point = 1;
       Individual3 = [Fitness_Crossed(CrossoverChoromosome(ii),1:Crossover_Point) , Fitness_Crossed(CrossoverChoromosome(ii+1),Crossover_Point+1:VariableNumber)];
       Individual4 = [Fitness_Crossed(CrossoverChoromosome(ii+1),1:Crossover_Point) , Fitness_Crossed(CrossoverChoromosome(ii),Crossover_Point+1:VariableNumber)];
  
           Cross_Assistant(cross_count,:) = Individual3;
           cross_count=cross_count-1;
      
           Cross_Assistant(cross_count,:) = Individual4;
           cross_count=cross_count-1;
 
       if ii == 2
           Crossover_Point = 1;
       Individual5 = [Fitness_Crossed(CrossoverChoromosome(ii+1),1:Crossover_Point) , Fitness_Crossed(CrossoverChoromosome(1),Crossover_Point+1:VariableNumber)];
       
           Cross_Assistant(cross_count,:) = Individual5;
           cross_count=cross_count-1;
       
       end   
       end
    end
           
           
    clear CrossoverChoromosome;
end
Crossed_Fitness = Cross_Assistant;
end

