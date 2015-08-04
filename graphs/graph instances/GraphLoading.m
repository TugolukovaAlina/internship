classdef GraphLoading 
    %GRAPHLOADING Summary of this class goes here
    %   Detailed explanation goes here
    

   
    properties
        %graphMap = containers.Map();
        mapObj = containers.Map();
        graphTypes = cell(1, 1);
        workingDir = '/user/atuholuk/home/Documents/MATLAB/RW/graphs/graph instances/';
    end
    
    methods
        
        function GL = GraphLoading             
            GL.graphTypes = {'RGG200', 'RGG200new'};
        end
        function graph = getGraph(obj, key)
            if isKey(obj.mapObj, key)
                graph = obj.mapObj(key);
            end
            
            if ~isempty(find(strcmp(obj.graphTypes, key), 1))
                graph = graphFromCSV();
            else
                fprintf('No such graph\n');
            end
        end
    end
    
end

