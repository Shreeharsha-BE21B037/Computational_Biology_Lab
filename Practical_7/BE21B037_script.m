model = readCbModel('o_sativa_core.mat');
[Exc, Upt] = findExcRxns(model); 
Up_rxns = model.rxns(find(Upt)); 
Exc_rxns = model.rxns(find(Exc));
Secretory_rxns = Exc_rxns(~ismember(Exc_rxns,Up_rxns));
obj_idx = find(model.c);
Obj = model.rxns(obj_idx);
disp(Obj);


% Set oxygen uptake rate for aerobic condition
model_aerobic1 = changeRxnBounds(model, 'Ex_O2', -1, 'b');
sol1 = optimizeCbModel(model_aerobic1);
disp("For oxygen uptake rate of -1 units (Aerobic)")
disp(sol1);

model_aerobic2 = changeRxnBounds(model, 'Ex_O2', -2, 'b');
sol2 = optimizeCbModel(model_aerobic2);
disp("For oxygen uptake rate of -2 units (Aerobic)")
disp(sol2);

model_aerobic3 = changeRxnBounds(model, 'Ex_O2', -3, 'b');
sol3 = optimizeCbModel(model_aerobic3);
disp("For oxygen uptake rate of -3 units (Aerobic)")
disp(sol3);

model_aerobic4 = changeRxnBounds(model, 'Ex_O2', -3.35, 'b');
sol4 = optimizeCbModel(model_aerobic4);
disp("For oxygen uptake rate of -3.35 units (Aerobic)")
disp(sol4);

model_aerobic5 = changeRxnBounds(model, 'Ex_O2', -4, 'b');
sol5 = optimizeCbModel(model_aerobic5);
disp("For oxygen uptake rate of -4 units (Aerobic)")
disp(sol5);

% Set oxygen uptake rate for anaerobic condition
model_anaerobic1 = changeRxnBounds(model, 'Ex_O2', 0, 'b');
sol6 = optimizeCbModel(model_anaerobic1);
disp("For oxygen uptake rate of 0 units (Anaerobic)")
disp(sol6);


% Sucrose and Glucose Batch Culture
% Simulating the 4 different conditions
model_sucrose_aerobic = changeRxnBounds(model, "Ex_O2", -3.35, 'b');
model_sucrose_aerobic = changeRxnBounds(model_sucrose_aerobic, 'Ex_Sucrose', -1.5, 'b');
sol7 = optimizeCbModel(model_sucrose_aerobic);
disp("For Sucrose Aerobic");
disp(sol7);

model_glucose_aerobic = changeRxnBounds(model, "Ex_O2", -3.35, 'b');
model_glucose_aerobic = changeRxnBounds(model_glucose_aerobic, 'Ex_Glucose', -2, 'b');
sol8 = optimizeCbModel(model_glucose_aerobic);
disp("For Glucose Aerobic");
disp(sol8);

model_sucrose_anaerobic = changeRxnBounds(model, "Ex_O2", 0, 'b');
model_sucrose_anaerobic = changeRxnBounds(model_sucrose_anaerobic, 'Ex_Sucrose', -1.25, 'b');
sol9 = optimizeCbModel(model_sucrose_anaerobic);
disp("For Sucrose Anaerobic");
disp(sol9);

model_glucose_anaerobic = changeRxnBounds(model, "Ex_O2", 0, 'b');
model_glucose_anaerobic = changeRxnBounds(model_glucose_anaerobic, 'Ex_Glucose', -1.75, 'b');
sol10 = optimizeCbModel(model_glucose_anaerobic);
disp("For Glucose Anaerobic");
disp(sol10);

% Photorespiring Rice Leaf Cells for maximizing Straw Biomass
model_photo = changeObjective(model,{'Straw_Biomass'});
obj_idx = find(model_photo.c);
Obj = model_photo.rxns(obj_idx);
disp(Obj);

% Set oxygen uptake rate for aerobic condition
model_aerobic6 = changeRxnBounds(model_photo, 'Ex_O2', -1, 'b');
model_aerobic6 = changeRxnBounds(model_aerobic6, 'Ex_CO2', -1, 'b');
sol11 = optimizeCbModel(model_aerobic6);
disp("For O2 uptake of -1 units and CO2 uptake of -1 units (Aerobic)")
disp(sol11);

model_aerobic7 = changeRxnBounds(model_photo, 'Ex_O2', -1, 'b');
model_aerobic7 = changeRxnBounds(model_aerobic7, 'Ex_CO2', -2, 'b');
sol12 = optimizeCbModel(model_aerobic7);
disp("For O2 uptake of -1 units and CO2 uptake of -2 units (Aerobic)")
disp(sol12);

model_aerobic8 = changeRxnBounds(model_photo, 'Ex_O2', -1, 'b');
model_aerobic8 = changeRxnBounds(model_aerobic8, 'Ex_CO2', -4, 'b');
sol13 = optimizeCbModel(model_aerobic8);
disp("For O2 uptake of -1 units and CO2 uptake of -4 units (Aerobic)")
disp(sol13);

model_aerobic9 = changeRxnBounds(model_photo, 'Ex_O2', -1, 'b');
model_aerobic9 = changeRxnBounds(model_aerobic9, 'Ex_CO2', -6, 'b');
sol14 = optimizeCbModel(model_aerobic9);
disp("For O2 uptake of -1 units and CO2 uptake of -6 units (Aerobic)")
disp(sol14);

model_aerobic10 = changeRxnBounds(model_photo, 'Ex_O2', -1, 'b');
model_aerobic10 = changeRxnBounds(model_aerobic10, 'Ex_CO2', -8, 'b');
sol15 = optimizeCbModel(model_aerobic10);
disp("For O2 uptake of -1 units and CO2 uptake of -8 units (Aerobic)")
disp(sol15);

model_aerobic11 = changeRxnBounds(model_photo, 'Ex_O2', -1, 'b');
model_aerobic11 = changeRxnBounds(model_aerobic11, 'Ex_CO2', -10, 'b');
sol16 = optimizeCbModel(model_aerobic11);
disp("For O2 uptake of -1 units and CO2 uptake of -10 units (Aerobic)")
disp(sol16);

% Set oxygen uptake rate for anaerobic condition
model_anaerobic2 = changeRxnBounds(model_photo, 'Ex_O2', 0, 'b');
model_anaerobic2 = changeRxnBounds(model_anaerobic2, 'Ex_CO2', -1, 'b');
sol17 = optimizeCbModel(model_anaerobic2);
disp("For O2 uptake of 0 units and CO2 uptake of -1 units (Anaerobic)")
disp(sol17);


% Flux Variability Analysis
model_growth1 = changeRxnBounds(model, 'Coleoptile_Biomass', 0.3750, 'b');
[minFlux1, maxFlux1] = fluxVariability(model_growth1, 100);  % For 100% of optimal growth
results1 = table(model_growth1.rxns, minFlux1, maxFlux1, 'VariableNames', {'Reaction', 'MinFlux', 'MaxFlux'});
disp(results1)

model_growth2 = changeRxnBounds(model, 'Coleoptile_Biomass', 0.1133, 'b');
model_growth2 = changeRxnBounds(model_growth2, 'Ex_O2', 0, 'b');
[minFlux2, maxFlux2] = fluxVariability(model_growth2, 100);  % For 100% of optimal growth
results2 = table(model_growth2.rxns, minFlux2, maxFlux2, 'VariableNames', {'Reaction', 'MinFlux', 'MaxFlux'});
disp(results2)

model_growth3 = changeRxnBounds(model_photo, 'Straw_Biomass', 0.174, 'b');
[minFlux3, maxFlux3] = fluxVariability(model_growth3, 100);  % For 100% of optimal growth
results3 = table(model_growth3.rxns, minFlux3, maxFlux3, 'VariableNames', {'Reaction', 'MinFlux', 'MaxFlux'});
disp(results3)