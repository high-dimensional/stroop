clear
clc

%bayes_reg tests
%J Ruffle j.ruffle@ucl.ac.uk

%%
%configure paths
addpath('/home/jruffle/Documents/MATLAB/bayesreg');
addpath('/home/jruffle/Documents/MATLAB/bayesreg/examples');

nsamples = 1e5;
burnin = 1e5;
prior = 'ridge';
%{'g','ridge','lasso','horseshoe','horseshoe+','logt'}

dist = 'gaussian';
 %{'gaussian','laplace','t','binomial','poisson','geometric'}

counter=1;
model_results = table;

%% cingulate parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_cingulate.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);

model_results.model(counter,:) = 'df_cin_bin';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter=counter+1;

%% stroop parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_stroop.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_str_bin';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_all_bin';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% cingulate parcellation volume
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_volume_cingulate.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_cin_vol';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_volume_stroop.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_str_vol';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_volume.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_all_vol';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% cingulate parcellation volume
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_prop_cingulate.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_cin_pro';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_prop_stroop.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_str_pro';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_prop.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_all_pro';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

% change prior
prior = 'g'

%% cingulate parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_cingulate.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_cin_bin';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter=counter+1;

%% stroop parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_stroop.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_str_bin';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_all_bin';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% cingulate parcellation volume
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_volume_cingulate.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_cin_vol';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_volume_stroop.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_str_vol';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_volume.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_all_vol';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% cingulate parcellation volume
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_prop_cingulate.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_cin_pro';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_prop_stroop.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_str_pro';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_prop.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_all_pro';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% change prior
prior = 'hs'

%% cingulate parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_cingulate.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_cin_bin';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter=counter+1;

%% stroop parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_stroop.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_str_bin';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_all_bin';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% cingulate parcellation volume
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_volume_cingulate.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_cin_vol';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_volume_stroop.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_str_vol';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_volume.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_all_vol';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% cingulate parcellation volume
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_prop_cingulate.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_cin_pro';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_prop_stroop.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_str_pro';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_prop.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_all_pro';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;


%% change prior
prior = 'hs+'

%% cingulate parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_cingulate.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_cin_bin';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter=counter+1;

%% stroop parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_stroop.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_str_bin';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_all_bin';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% cingulate parcellation volume
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_volume_cingulate.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_cin_vol';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_volume_stroop.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_str_vol';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_volume.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_all_vol';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% cingulate parcellation volume
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_prop_cingulate.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_cin_pro';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_prop_stroop.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_str_pro';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_prop.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_all_pro';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;


%% change prior
prior = 'lasso'

%% cingulate parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_cingulate.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_cin_bin';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter=counter+1;

%% stroop parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_stroop.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_str_bin';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_all_bin';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% cingulate parcellation volume
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_volume_cingulate.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_cin_vol';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_volume_stroop.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_str_vol';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% all parcellation
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_volume.csv','ReadVariableNames',true,'ReadRowNames',false);
df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);
model_results.model(counter,:) = 'df_all_vol';
model_results.prior(counter,1:length(prior)) = prior;
model_results.r2(counter,:) = retval.modelstats.r2;
model_results.waic(counter,:) = retval.modelstats.waic;
counter = counter+1;

%% save results
writetable(model_results,'/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/bayes_reg.csv');
model_results


%% final full model with coefficents
prior = 'g';
%dist = 'geometric';
dist = 'gaussian';

%proportionate
%df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_prop.csv','ReadVariableNames',true,'ReadRowNames',false);

%with categoricals
%binary only
%df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df.csv','ReadVariableNames',true,'ReadRowNames',false);

%volumetric
df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_volume.csv','ReadVariableNames',true,'ReadRowNames',false);

%volumetric just l frontal
%df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_volume_stroop.csv','ReadVariableNames',true,'ReadRowNames',false);

%volumetric just l frontal
%df = readtable('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/df_volume_cingulate.csv','ReadVariableNames',true,'ReadRowNames',false);



df = removevars(df,{'Var1'});

y = df(:,["Stroop_words_correct"]);

X = removevars(df,{'Stroop_words_correct'});
varnames = X.Properties.VariableNames;
catvars = 1:width(X);

X = table2array(X);
y = table2array(y);

%no categoricals
[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'sortrank',true);

%with categoricals
%[beta, beta0, retval] = bayesreg(X,y,dist,prior,'nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',catvars,'sortrank',true);


diary on
diary('/home/jruffle/OneDrive/PhD/Stroop_GLDM/11_CORTEX_PAPER_analysis/results/bayes_reg_posteriors.txt')
br_summary(beta,beta0,retval);
diary off

% mean_coeff = retval.muB;
% coef_names = retval.Xstats.varnames(1:length(retval.Xstats.varnames)-1);
% tstats = retval.tStat;
% ranks = retval.varranks;