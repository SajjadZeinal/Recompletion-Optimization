global attempt attempt2 
VariableNumber=2;
Population_number=6;
TIME_RECOMP_BOUND = [100,2600];
LENGTH_RECOMP_BOUND = [15000,15040];
Fitness=zeros(Population_number,VariableNumber+1);
Probability=zeros(Population_number,1);
Obj_cumulative_Probability=zeros(Population_number,1);
random_selection=zeros(Population_number,1);
NewChoromosome=zeros(Population_number,VariableNumber+1);
random_Crossover=zeros(Population_number,1);
%Initialization
attempt=1;
attempt2=1;
%{
Initial_Population= [100	            15039	   
                     1300	            15025
                     2600	            15008
                     1800	            15010
                     500                15030
                     1000               15020
];
%}
Initial_Population= [147.6960749	    15000.98726	   
                     1300	            15025
                     2600	            15008
                     1800	            15010
                     500                15030
                     1000               15020
];


for ii =1:Population_number
Fitness(ii,1)=Initial_Population(ii,1);
Fitness(ii,2)=Initial_Population(ii,2);
x=[Initial_Population(ii,1) , Initial_Population(ii,2) ];
Fitness(ii,3)=NPV_2_Var(x);
end
Best_Fitness(attempt,1)=max(Fitness(:,3));
Ave_Fitness(attempt,1)=mean(Fitness(:,3));
generation(Population_number*(attempt-1)+1:Population_number*attempt,:)=Fitness;
plot(attempt,Best_Fitness(attempt,1),'b.','markersize',5);
hold on;
plot(attempt,Ave_Fitness(attempt,1),'k.','markersize',5);
hold on;
title('NPV_Optimization (TIME & LENGTH)');
legend('Best','Ave');
xlabel('Generation');
ylabel('NPV[$]');
attempt=attempt+1;
% Stopping Criteria
max_iteration = 60;
Tol_Fitness=100;
while 1
    % Sorting
sorted_NPV=sort(Fitness(:,3),'descend');
for ii = 1:Population_number
    for jj = 1:Population_number
    if sorted_NPV(ii) == Fitness(jj,3)
        sorted_Fitness(ii,:) = Fitness(jj,:); 
    end
    end
end
Fitness=sorted_Fitness;
Fitness(Population_number,:)=Fitness(1,:);
    
% Selection (Roulette Wheel)
total=sum(Fitness(1:Population_number,3));
cumulative_Probability=0;
for ii=1:Population_number
   Probability(ii)=Fitness(ii,3)/total;
   cumulative_Probability=cumulative_Probability+Probability(ii);
   Obj_cumulative_Probability(ii)=cumulative_Probability;
   random_selection(ii)=rand();
end
random_selection(1)=-1;
for ii=1:Population_number
    for jj=1:Population_number-1
    if random_selection(ii) > Obj_cumulative_Probability(jj) && random_selection(ii) <= Obj_cumulative_Probability(jj+1)
        NewChoromosome(ii,:) = Fitness(jj+1,1:VariableNumber+1);
    elseif random_selection(ii) < Obj_cumulative_Probability(1)
         NewChoromosome(ii,:) = Fitness(1,1:VariableNumber+1);
    end
    end
end
Fitness=NewChoromosome;

    % Sorting Selected
sorted_NPV=sort(Fitness(:,3),'descend');
for ii = 1:Population_number
    for jj = 1:Population_number
    if sorted_NPV(ii) == Fitness(jj,3)
        sorted_Fitness(ii,:) = Fitness(jj,:); 
    end
    end
end
Fitness=sorted_Fitness(:,1:VariableNumber);


% Cross Over

Fitness = Crossover(Fitness);


% Mutation

Fitness = Mutation( Fitness );

Eval_Fitness=Fitness;
for ii = 1:Population_number
    x=[Eval_Fitness(ii,1),Eval_Fitness(ii,2)];
    Eval_Fitness(ii,3) = NPV_2_Var(x); 
end
Fitness=Eval_Fitness;
generation(Population_number*(attempt-1)+1:Population_number*attempt,:)=Eval_Fitness;
Best_Fitness(attempt,1)=max(Fitness(:,3));
Ave_Fitness(attempt,1)=mean(Fitness(:,3));
plot(attempt,Best_Fitness(attempt,1),'b.','markersize',5);
hold on;
plot(attempt,Ave_Fitness(attempt,1),'k.','markersize',5);
hold on;
title('NPV_Optimization (TIME & LENGTH)');
legend('Best','Ave');
xlabel('Generation');
ylabel('NPV[$]');
if attempt == 50
       stop_criteria = Best_Fitness(attempt,1);
end
    if attempt == max_iteration
    tolerance = abs(stop_criteria - Best_Fitness(length(Best_Fitness)-10:length(Best_Fitness)));
    Tol_Fitness=sum(tolerance);
    if Tol_Fitness < 1E-3
        break;
    else
        max_iteration=max_iteration+5;
        stop_criteria=Best_Fitness(max_iteration-5,1);
    end
    end
attempt=attempt+1;
fclose all;
end