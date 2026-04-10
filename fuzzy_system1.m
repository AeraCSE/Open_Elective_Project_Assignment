fis = mamfis('Name','WashingMachine');
fis = addInput(fis,[0 10],'Name','Dirt');
fis = addMF(fis,'Dirt','trimf',[0 0 5],'Name','Low');
fis = addMF(fis,'Dirt','trimf',[2 5 8],'Name','Medium');
fis = addMF(fis,'Dirt','trimf',[5 10 10],'Name','High');
fis = addInput(fis,[0 10],'Name','Load');
fis = addMF(fis,'Load','trimf',[0 0 5],'Name','Small');
fis = addMF(fis,'Load','trimf',[2 5 8],'Name','Medium');
fis = addMF(fis,'Load','trimf',[5 10 10],'Name','Large');
fis = addOutput(fis,[0 60],'Name','Time');
fis = addMF(fis,'Time','trimf',[0 0 30],'Name','Short');
fis = addMF(fis,'Time','trimf',[15 30 45],'Name','Medium');
fis = addMF(fis,'Time','trimf',[30 60 60],'Name','Long');
rules = [
1 1 1 1 1;  % Low & Small -> Short
1 2 2 1 1;  % Low & Medium -> Medium
1 3 2 1 1;  % Low & Large -> Medium
2 1 2 1 1;  % Medium & Small -> Medium
2 3 3 1 1;  % Medium & Large -> Long
3 1 2 1 1;  % High & Small -> Medium
3 2 3 1 1;  % High & Medium -> Long
3 3 3 1 1;  % High & Large -> Long
];
fis = addRule(fis,rules);
figure;
ruleview(fis)      
figure;
gensurf(fis)       
writeFIS(fis,'washing_machine.fis');
