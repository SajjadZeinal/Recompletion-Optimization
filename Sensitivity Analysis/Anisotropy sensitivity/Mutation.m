function [ Muted_Fitness ] = Mutation( Fitness )
% Mutation
TIME_RECOMP_BOUND = [100,2600];
LENGTH_RECOMP_BOUND = [15000,15050];
VariableNumber = 2;
Population_number = 6;
Gen_Numbers=(Population_number-1)*VariableNumber;
Mutationrate=0.4;
count=1;
Mutationrandom=zeros(1,(Population_number-1)*VariableNumber);
for ii = 1:(Population_number-1)*VariableNumber
    Mutationrandom(ii) = rand();
    if Mutationrandom(ii) < Mutationrate 
        Muted_Choromosome(count) = ii;
        count = count + 1;
    end
end

    Fitness_Muted=Fitness(2:Population_number,:)';
for ii=1:count-1
    Variable_Selection = rem(Muted_Choromosome(ii),2);
    if Variable_Selection == 1
        Fitness_Muted(Muted_Choromosome(ii)) = (TIME_RECOMP_BOUND(2)-TIME_RECOMP_BOUND(1))*rand()+TIME_RECOMP_BOUND(1);
    elseif Variable_Selection == 0
        Fitness_Muted(Muted_Choromosome(ii)) = (LENGTH_RECOMP_BOUND(2)-LENGTH_RECOMP_BOUND(1))*rand()+LENGTH_RECOMP_BOUND(1);
    end
end
Fitness_Muted_2 = Fitness_Muted';
Muted_Fit = Fitness_Muted_2;
Fitness(2:Population_number,:) = Muted_Fit; 
Muted_Fitness = Fitness; 
clear Fitness_Muted Muted_Choromosome

end

