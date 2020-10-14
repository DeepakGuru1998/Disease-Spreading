beta = 0.1;
gamma = 0.003;
d = 0.8;

for i = 1:1000
    for j = 1:2
        axis(i,j) = randi(100); randi(100);
    end
end

population = ones(1000,1);
infected = [];
infectedLength = [];
susceptible = [];
susceptibleLength = [];
recoveredLength=[];

for i=1:1000
    if rand < 0.05
        population(i) =2;
        infected = [infected;i];
    else
        susceptible = [susceptible;i];
    end
end
susceptibleLength1 = size(susceptible,1);
infectedLength1 = size(infected,1);

for iter = 1:1000
    for j=1:1000
        temp_axis = axis(j,:);
        if rand < d
            initial=0;
            
            while initial==0
                r={'up','down','left','right'};
                out = r(randi(numel(r)));
                out = char(out);
                switch out
                    case {'left'}
                        if axis(j,1) == 0
                            break;
                        else
                            axis(j,:) = axis(j,:) - [1 0];
                        end
                        break;
                    case {'right'}
                        if axis(j,1) == 100
                            break;
                        else
                            axis(j,:) = axis(j,:) + [1 0];
                        end
                        break;
                    case {'up'}
                        if axis(j,2) == 100
                            break;
                        else
                            axis(j,:) = axis(j,:) + [0 1];
                        end
                        break;
                    case {'down'}
                        if axis(j,2) == 0
                            break;
                        else
                            axis(j,:) = axis(j,:) - [0 1];
                        end
                        break;
                end
                if temp_axis ~= axis(j,:)
                    initial=1;
                end
            end
        end
    end
        
        for i = 1:size(infected,1)
            for j = 1:size(susceptible,1)
                if axis(infected(i),:) == axis(susceptible(j),1)
                    if rand < beta
                        population(susceptible(j))=2;
                    end
                end
            end
        end
        
        infected = [];
        susceptible = [];
        for i=1:1000
            if population(i) ==2
                infected = [infected;i];
            end
            if population(i)==1
                susceptible = [susceptible;i];
            end
        end
        
        for i =1:size(infected,1)
            if rand<gamma
                population(infected(i))=3;
            end
        end
        infected = [];
        susceptible = [];
        recovered = [];
        for i=1:1000
            if population(i) == 2
                infected = [infected;i];
            end
            if population(i) == 1
                susceptible = [susceptible;i];
            end
            if population(i) == 3
                recovered = [recovered;i];
            end
        end
        
        
        x1=[];
        x2=[];
        x3=[];
        y1=[];
        y2=[];
        y3=[];
        for i = 1: size(susceptible,1)
            x1 = [x1 ; axis(susceptible(i),1)];
            y1 = [y1 ; axis(susceptible(i),2)];
        end
        for i = 1: size(infected,1)
            x2 = [x2 ; axis(infected(i),1)];
            y2 = [y2 ; axis(infected(i),2)];
        end
        for i = 1: size(recovered,1)
            x3 = [x3 ; axis(recovered(i),1)];
            y3 = [y3 ; axis(recovered(i),2)];
        end
        figure(1)
        plot(x1,y1,'.b','Markersize',20);
        hold on
        plot(x2,y2,'.r','Markersize',20);
        hold on
        plot(x3,y3,'.g','Markersize',20);
        hold off
        xlabel('X axis');
        ylabel('Y axis');
        title('Random walk for 1000 agents');
       
        
        susceptibleLength = [susceptibleLength; size(susceptible,1)];
        infectedLength = [infectedLength; size(infected,1)];
        recoveredLength = [recoveredLength; size(recovered,1)];
    end

    susceptibleLength = [susceptibleLength1;susceptibleLength];
    infectedLength = [infectedLength1;infectedLength];
    recoveredLength = [0;recoveredLength];
    figure(2)
    time = 0:1:1000;
    plot(time,susceptibleLength,'b',time,infectedLength,'r',time,recoveredLength,'g');
    xlabel('Time steps');
    ylabel('Number of agents');
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
