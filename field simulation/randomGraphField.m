function [graph, field, points] = randomGraphField(properties, param, graphName, numberOfVertices, varargin)
% creates random graph and field on top of it
graph = [];
points = [];

fprintf(graphName);
switch graphName
    case 'er'
        % if it argument is greater than 1 I suppose that it s number of
        % edges
        if varargin{1} > 1
            numberOfEdges = varargin{1};
            [graph, points] = randomGraph(numberOfVertices, 0, numberOfEdges);
            fprintf(', numberOfEdges - %i', numberOfEdges);
        else
            p = varargin{1};
            [graph, points] = randomGraph(numberOfVertices, p);
            fprintf(', p - %i', p);
        end
    case 'rgg'
        radius = varargin{1};
        [graph, points] = randomGeometricGraph(numberOfVertices, radius);
        fprintf(', radius - %i', radius);
    case 'chain'
        numberOfVertices = varargin{1};
        [graph, points] = chainGraph(numberOfVertices);
    case 'torus'
        [graph, points] = gridOnTorusGraph(numberOfVertices);
    case 'grid'
        n = varargin{1};
        m = varargin{2};
        [graph, points] = gridGraph(n, m);
    case 'pa'
        edgesAdd = varargin{1};
        [graph, points] = graphPA(numberOfVertices, edgesAdd);
    case 'complete'
        [graph, points] = completeGraph(numberOfVertices);
end

if ~isConnected(graph)
    fprintf('oh no, graph is not connected \n');
end

if param < 0
    p = param;
    temperature = findTemperature(p, graph, properties);
else
    temperature = param;
end

field = createField(graph, properties, temperature, 20);


fprintf(', N - %i, degree - %i, maxValues - %i \n', numberOfVertices, averageDegree(graph), max(properties));

end

