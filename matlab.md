# MATLAB

## Arrays
```
Cellfun to replace loop
fileNames = {'f1.txt', 'f2.txt', 'f3.txt'};
```
  
## Cellfun
```
figure(1); hold on;
tb = cellfun( @(x) readtable(x, 'Delimiter', '\t', 'ReadVariableNames', true), fileNames, 'uniformoutput', false);
cellfun( @(x) plot(x.flowRate, x.pDrop, '-o'), tb, 'uniformoutput', false);
```

## for-loop
```
figure(2); hold on;
for j = 1:length(fileNames)
   x = readtable(fileNames{j}, 'Delimiter', '\t', 'ReadVariableNames', true);
   plot(x.flowRate, x.pDrop, '-o')
end
```

## Cell array of numbers to array
```
cellfun(@(x) sum(min(strfind(x, 'aaa'))), stringCell)
```
  
## Accumarray
```
tbCriteria = tbRaw(:, criteriaNames);
[tbUnique, ~, subs] = unique(tbCriteria, 'rows', 'sorted');
pDropMean = accumarray(subs, tbRaw.pDrop, [], @mean);
tbFinal = table(tbUnique, pDropMean);
% (NB: I made a function for this: “accumtable”)%% Show file lines
dbtype filename 1 - Shows first line of file
```

## Program dependencies
```
depFileList = matlab.codetools.requiredFilesAndProducts('MANUSCRIPT_MAIN.m')';
```

## Comparison of static string concatenation with column of numbers:
```
regexprep(cellstr(num2str(GC.fluid)), '(\d+)', ['fluid' '$1'])               % Fastest (0.3 s)
strcat(cellstr(repmat('fluid',height(GC),1)), cellstr(num2str(GC.fluid)))    % Slightly (0.4 s)
cellfun(@(x) strcat('fluid', x), cellstr(num2str(GC.fluid)), 'uni', 0)       % Very slow (1.4 s)
```

## READTABLE - EXCEL
```
tb = readtable('myfile.xlsx', 'ReadVariableNames', true, 'Basic', true);
```

## READTABLE - TEXT
```
tb = readtable('test.txt', 'Delimiter', '\t', 'ReadVariableNames', true);
Get table headers
tb.Properties.VariableNames
Delete table rows
x = [1 2 3 3]';
y = [2 3 4 8]';
M = table(x,y);

% M = 
%     x    y
%     _    _
%     1    2
%     2    3
%     3    4
%     3    8

M(M.x == 3, :) = [];

% M = 
%     x    y
%     _    _
%     1    2
%     2    3
```

## Remove item from cell string array
```
criteriaNames(strcmp(criteriaNames,'attFlag'))=[];      OR
criteriaNames(ismember(criteriaNames, 'attFlag'))=[];

```

## Referencing tables
```
tb{:, 'fluidFlag'} - SAME AS - tb.fluidFlag
tb{1, 'fluidFlag'} - SAME AS - tb.fluidFlag(1)
```
	
## Create empty table with headers
```
varNames = {'a' 'b' 'c'}; 
tb = cell2table(cell(0,length(varNames)), 'VariableNames', varNames);
```

## Append rows to table
```
for i = [2 3 5 6 9 10 11 12 13 14]
  for j = [5 10 15 30]
    for k = [1 2 3]
      tempRow = {i*j*k, i+j+k, i/j/k};   % CREATE NEW ROW:    USE {   }
      tb = [tb; tempRow];                     % APPEND TO TABLE:   USE [ ; ]
    end
  end
end
```

## Assigning values to table
```
PDropTable(r, varNames) = {ff, age, gen, qm3s, pDrop}; % FAST! 0.5 s
PDropTable{r, varNames} = [ff, age, gen, qm3s, pDrop]; % SLOW! 2.5 s
VERY SLOW:
PDropTable{r, varNames{1}} = ff;
PDropTable{r, varNames{2}} = age;
PDropTable{r, varNames{3}} = gen;
PDropTable{r, varNames{4}} = qm3s;
PDropTable{r, varNames{5}} = pDrop;             % SO SLOW! 5.5 s
```

## Doing a function to a whole table:
```
Element by element
    varfun(@(x) x ./ max(x), T);
Combine
    varfun(@mean, T);
Combine with grouping on a column
    B = varfun(func,A,'GroupingVariables','Var1')
```

## Summarize table
```
summary(T);
```

## Add units to table
```
T.Properties.VariableUnits = {‘mm’ ‘s’ ‘kg’};
```
  
## Unique vs. FindGroups
```
% Take a criteria table
y = DataTable(:, groupingVars);

[uniqueTable, ~,ii] = unique(y);
[ii, uniqueTable]  = findgroups(y);    % these two functions give the same results
