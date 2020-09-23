library('eiPack')
library(readr)
library(stringr)
library(RxCEcolInf)

elec_data <- data.frame(read_csv('~/work/Jenner/VRA/Texas/TX_cvap_for_EI.csv'))

elections <- c('12G_President', '12G_US_Sen', '12P_US_Sen', '12R_US_Sen', '14G_Ag_Comm', '14G_Governor', '14G_US_Sen', '14P_Ag_Comm', '14P_Governor', '14P_US_Sen', '14R_Ag_Comm', '14R_US_Sen', '16G_President', '16P_President', '18G_Comptroller', '18G_Governor', '18G_Land_Comm', '18G_Lt_Governor', '18G_US_Sen', '18P_Comptroller', '18P_Governor', '18P_Land_Comm', '18P_Lt_Governor', '18P_US_Sen', '18R_Governor', '18G_RR_Comm_1', '18P_RR_Comm_1', '16G_RR_Comm_1', '16R_RR_Comm_1', '16P_RR_Comm_1', '14G_RR_Comm_3', '14P_RR_Comm_3', '12P_President')

elec_dict <- vector(mode="list")
elec_dict[['12G_President']] <- list(c('RomneyR_12G_President', 'ObamaD_12G_President', 'X12G_President_abstain'), c('BCVAP_2012', 'HCVAP_2012', 'WCVAP_2012', 'OCVAP_2012', 'X12G_President_CVAP'))
elec_dict[['12G_US_Sen']] <- list(c('CruzR_12G_US_Sen', 'SadlerD_12G_US_Sen', 'X12G_US_Sen_abstain'), c('BCVAP_2012', 'HCVAP_2012', 'WCVAP_2012', 'OCVAP_2012', 'X12G_US_Sen_CVAP'))
elec_dict[['12P_US_Sen']] <- list(c('AllenD_12P_US_Sen', 'HubbardD_12P_US_Sen', 'SadlerD_12P_US_Sen', 'YarbroughD_12P_US_Sen', 'X12P_US_Sen_abstain'), c('BCVAP_2012', 'HCVAP_2012', 'WCVAP_2012', 'OCVAP_2012', 'X12P_US_Sen_CVAP'))
elec_dict[['12R_US_Sen']] <- list(c('SadlerD_12R_US_Sen', 'YarbroughD_12R_US_Sen', 'X12R_US_Sen_abstain'), c('BCVAP_2012', 'HCVAP_2012', 'WCVAP_2012', 'OCVAP_2012', 'X12R_US_Sen_CVAP'))
elec_dict[['14G_Ag_Comm']] <- list(c('MillerR_14G_Ag_Comm', 'HoganD_14G_Ag_Comm', 'X14G_Ag_Comm_abstain'), c('BCVAP_2014', 'HCVAP_2014', 'WCVAP_2014', 'OCVAP_2014', 'X14G_Ag_Comm_CVAP'))
elec_dict[['14G_Governor']] <- list(c('AbbottR_14G_Governor', 'DavisD_14G_Governor', 'X14G_Governor_abstain'), c('BCVAP_2014', 'HCVAP_2014', 'WCVAP_2014', 'OCVAP_2014', 'X14G_Governor_CVAP'))
elec_dict[['14G_US_Sen']] <- list(c('CornynR_14G_US_Sen', 'AlameelD_14G_US_Sen', 'X14G_US_Sen_abstain'), c('BCVAP_2014', 'HCVAP_2014', 'WCVAP_2014', 'OCVAP_2014', 'X14G_US_Sen_CVAP'))
elec_dict[['14P_Ag_Comm']] <- list(c('FitzsimonsD_14P_Ag_Comm', 'HoganD_14P_Ag_Comm', 'FriedmanD_14P_Ag_Comm', 'X14P_Ag_Comm_abstain'), c('BCVAP_2014', 'HCVAP_2014', 'WCVAP_2014', 'OCVAP_2014', 'X14P_Ag_Comm_CVAP'))
elec_dict[['14P_Governor']] <- list(c('MadrigalD_14P_Governor', 'DavisD_14P_Governor', 'X14P_Governor_abstain'), c('BCVAP_2014', 'HCVAP_2014', 'WCVAP_2014', 'OCVAP_2014', 'X14P_Governor_CVAP'))
elec_dict[['14P_US_Sen']] <- list(c('AlameelD_14P_US_Sen', 'KimD_14P_US_Sen', 'RogersD_14P_US_Sen', 'ScherrD_14P_US_Sen', 'FjetlandD_14P_US_Sen', 'X14P_US_Sen_abstain'), c('BCVAP_2014', 'HCVAP_2014', 'WCVAP_2014', 'OCVAP_2014', 'X14P_US_Sen_CVAP'))
elec_dict[['14R_Ag_Comm']] <- list(c('FriedmanD_14R_Ag_Comm', 'HoganD_14R_Ag_Comm', 'X14R_Ag_Comm_abstain'), c('BCVAP_2014', 'HCVAP_2014', 'WCVAP_2014', 'OCVAP_2014', 'X14R_Ag_Comm_CVAP'))
elec_dict[['14R_US_Sen']] <- list(c('AlameelD_14R_US_Sen', 'RogersD_14R_US_Sen', 'X14R_US_Sen_abstain'), c('BCVAP_2014', 'HCVAP_2014', 'WCVAP_2014', 'OCVAP_2014', 'X14R_US_Sen_CVAP'))
elec_dict[['16G_President']] <- list(c('ClintonD_16G_President', 'TrumpR_16G_President', 'X16G_President_abstain'), c('BCVAP_2016', 'HCVAP_2016', 'WCVAP_2016', 'OCVAP_2016', 'X16G_President_CVAP'))
elec_dict[['16P_President']] <- list(c('JuddD_16P_President', 'De_La_FuenteD_16P_President', 'ClintonD_16P_President', 'LockeD_16P_President', 'OMalleyD_16P_President', 'SandersD_16P_President', 'WIlsonD_16P_President', 'HawesD_16P_President', 'X16P_President_abstain'), c('BCVAP_2016', 'HCVAP_2016', 'WCVAP_2016', 'OCVAP_2016', 'X16P_President_CVAP'))
elec_dict[['18G_Comptroller']] <- list(c('HegarR_18G_Comptroller', 'ChevalierD_18G_Comptroller', 'X18G_Comptroller_abstain'), c('BCVAP_2018', 'HCVAP_2018', 'WCVAP_2018', 'OCVAP_2018', 'X18G_Comptroller_CVAP'))
elec_dict[['18G_Governor']] <- list(c('AbbottR_18G_Governor', 'ValdezD_18G_Governor', 'X18G_Governor_abstain'), c('BCVAP_2018', 'HCVAP_2018', 'WCVAP_2018', 'OCVAP_2018', 'X18G_Governor_CVAP'))
elec_dict[['18G_Land_Comm']] <- list(c('BushR_18G_Land_Comm', 'SuazoD_18G_Land_Comm', 'X18G_Land_Comm_abstain'), c('BCVAP_2018', 'HCVAP_2018', 'WCVAP_2018', 'OCVAP_2018', 'X18G_Land_Comm_CVAP'))
elec_dict[['18G_Lt_Governor']] <- list(c('PatrickR_18G_Lt_Governor', 'CollierD_18G_Lt_Governor', 'X18G_Lt_Governor_abstain'), c('BCVAP_2018', 'HCVAP_2018', 'WCVAP_2018', 'OCVAP_2018', 'X18G_Lt_Governor_CVAP'))
elec_dict[['18G_US_Sen']] <- list(c('CruzR_18G_US_Sen', 'ORourkeD_18G_US_Sen', 'X18G_US_Sen_abstain'), c('BCVAP_2018', 'HCVAP_2018', 'WCVAP_2018', 'OCVAP_2018', 'X18G_US_Sen_CVAP'))
elec_dict[['18P_Comptroller']] <- list(c('MahoneyD_18P_Comptroller', 'ChevalierD_18P_Comptroller', 'X18P_Comptroller_abstain'), c('BCVAP_2018', 'HCVAP_2018', 'WCVAP_2018', 'OCVAP_2018', 'X18P_Comptroller_CVAP'))
elec_dict[['18P_Governor']] <- list(c('WakelyD_18P_Governor', 'ClarkD_18P_Governor', 'PayneD_18P_Governor', 'YarbroughD_18P_Governor', 'DavisD_18P_Governor', 'OceguedaD_18P_Governor', 'ValdezD_18P_Governor', 'WhiteD_18P_Governor', 'MumbachD_18P_Governor', 'X18P_Governor_abstain'), c('BCVAP_2018', 'HCVAP_2018', 'WCVAP_2018', 'OCVAP_2018', 'X18P_Governor_CVAP'))
elec_dict[['18P_Land_Comm']] <- list(c('SuazoD_18P_Land_Comm', 'MorganD_18P_Land_Comm', 'X18P_Land_Comm_abstain'), c('BCVAP_2018', 'HCVAP_2018', 'WCVAP_2018', 'OCVAP_2018', 'X18P_Land_Comm_CVAP'))
elec_dict[['18P_Lt_Governor']] <- list(c('CooperD_18P_Lt_Governor', 'CollierD_18P_Lt_Governor', 'X18P_Lt_Governor_abstain'), c('BCVAP_2018', 'HCVAP_2018', 'WCVAP_2018', 'OCVAP_2018', 'X18P_Lt_Governor_CVAP'))
elec_dict[['18P_US_Sen']] <- list(c('KimbroughD_18P_US_Sen', 'HernandezD_18P_US_Sen', 'ORourkeD_18P_US_Sen', 'X18P_US_Sen_abstain'), c('BCVAP_2018', 'HCVAP_2018', 'WCVAP_2018', 'OCVAP_2018', 'X18P_US_Sen_CVAP'))
elec_dict[['18R_Governor']] <- list(c('ValdezD_18R_Governor', 'WhiteD_18R_Governor', 'X18R_Governor_abstain'), c('BCVAP_2018', 'HCVAP_2018', 'WCVAP_2018', 'OCVAP_2018', 'X18R_Governor_CVAP'))
elec_dict[['18G_RR_Comm_1']] <- list(c('CraddickR_18G_RR_Comm_1', 'McAllenD_18G_RR_Comm_1', 'X18G_RR_Comm_1_abstain'), c('BCVAP_2018', 'HCVAP_2018', 'WCVAP_2018', 'OCVAP_2018', 'X18G_RR_Comm_1_CVAP'))
elec_dict[['18P_RR_Comm_1']] <- list(c('McAllenD_18P_RR_Comm_1', 'SpellmonD_18P_RR_Comm_1', 'X18P_RR_Comm_1_abstain'), c('BCVAP_2018', 'HCVAP_2018', 'WCVAP_2018', 'OCVAP_2018', 'X18P_RR_Comm_1_CVAP'))
elec_dict[['16G_RR_Comm_1']] <- list(c('YarbroughD_16G_RR_Comm_1', 'ChristianR_16G_RR_Comm_1', 'X16G_RR_Comm_1_abstain'), c('BCVAP_2016', 'HCVAP_2016', 'WCVAP_2016', 'OCVAP_2016', 'X16G_RR_Comm_1_CVAP'))
elec_dict[['16R_RR_Comm_1']] <- list(c('GarrettD_16R_RR_Comm_1', 'YarbroughD_16R_RR_Comm_1', 'X16R_RR_Comm_1_abstain'), c('BCVAP_2016', 'HCVAP_2016', 'WCVAP_2016', 'OCVAP_2016', 'X16R_RR_Comm_1_CVAP'))
elec_dict[['16P_RR_Comm_1']] <- list(c('GarrettD_16P_RR_Comm_1', 'YarbroughD_16P_RR_Comm_1', 'BurnamD_16P_RR_Comm_1', 'X16P_RR_Comm_1_abstain'), c('BCVAP_2016', 'HCVAP_2016', 'WCVAP_2016', 'OCVAP_2016', 'X16P_RR_Comm_1_CVAP'))
elec_dict[['14G_RR_Comm_3']] <- list(c('SittonR_14G_RR_Comm_3', 'BrownD_14G_RR_Comm_3', 'X14G_RR_Comm_3_abstain'), c('BCVAP_2014', 'HCVAP_2014', 'WCVAP_2014', 'OCVAP_2014', 'X14G_RR_Comm_3_CVAP'))
elec_dict[['14P_RR_Comm_3']] <- list(c('HenryD_14P_RR_Comm_3', 'BrownD_14P_RR_Comm_3', 'X14P_RR_Comm_3_abstain'), c('BCVAP_2014', 'HCVAP_2014', 'WCVAP_2014', 'OCVAP_2014', 'X14P_RR_Comm_3_CVAP'))
elec_dict[['12P_President']] <- list(c('ElyD_12P_President', 'WolfeD_12P_President', 'RichardsonD_12P_President', 'ObamaD_12P_President', 'X12P_President_abstain'), c('BCVAP_2012', 'HCVAP_2012', 'WCVAP_2012', 'OCVAP_2012', 'X12P_President_CVAP'))

ntunes_val <- 10
tunedraws <- 100000
thin_mcmc <- 100
burnin_mcmc <- 100000
for (e in elections){
  
  form <- paste('cbind(',paste(elec_dict[[e]][[1]],collapse = ', '),') ~ cbind(',paste(elec_dict[[e]][[2]],collapse = ', '),')', sep = '')
  
  tune.nocov <- tuneMD(form, data = elec_data, ntunes = ntunes_val, totaldraws = tunedraws)
  out.nocov1 <- ei.MD.bayes(form,covariate = NULL, data = elec_data,tune.list = tune.nocov, ret.mcmc = TRUE, burnin = burnin_mcmc, thin = thin_mcmc)
  
  mcmc_df <- data.frame(as.matrix(out.nocov1$draws$Cell.counts))
  write.csv(mcmc_df,paste("outputs/",e,"_EISAMPLES.csv",sep = ""))
  
  mcmc_df_prec <- as.matrix(out.nocov1$draws$Beta)
  x <- colMeans(mcmc_df_prec)
  y <- apply(mcmc_df_prec, 2, sd)
  probs <- c(0:8/8)
  q_0 <- apply(mcmc_df_prec, MARGIN = 2, FUN = quantile, probs = probs)
  write.csv(t(q_0), paste("outputs/",e,"_prec_quants.csv",sep = "")) 
  write.csv(x, paste("outputs/",e,"_prec_means.csv",sep = "")) 
  write.csv(y, paste("outputs/",e,"_prec_sd.csv",sep = "")) 
}
