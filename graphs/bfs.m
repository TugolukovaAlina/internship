function D=bfs(A)
%% Finds distances between all nodes using a breadth first search
% Used in MetaboNetworks
% A: adjacency matrix
% D: distance matrix

    n=size(A,1); % # nodes
    [ni,~]=find(A==1); % node index
    ei=[0;cumsum(sum(repmat((1:n)',1,length(ni))==repmat(ni',n,1),2))]+1; % edge index
    D=zeros(n,n);
    for k=1:n % no need to do parfor
        d=-1*ones(n,1);
        sp=zeros(n,1); % start the "hunt" here
        prey=1;
        hunter=0;
        sp(prey)=k; 
        d(k)=0;
        while prey>hunter % if they are at the same position the "hunter" has caught the "prey"
            hunter=hunter+1;
            nhs=sp(hunter); % new "hunting spot"
            for j=ei(nhs):(ei(nhs+1)-1)
                h=ni(j);
                if d(h)<0 % "hunter" catches "prey" if this does not happen
                    prey=prey+1;
                    sp(prey)=h; 
                    d(h)=d(nhs)+1;
                end
            end
        end
        D(:,k)=d;
    end
    D(D==-1)=Inf;

end