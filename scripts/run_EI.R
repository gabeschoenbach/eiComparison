library('eiPack')
library(readr)
library(stringr)
library(RxCEcolInf)
library(sf)

mainDir <- '~/Desktop/mggg/eiComparison/'
resources <- 'resources/'
output <- 'EI_outputs/run_X/'
dir.create(file.path(mainDir, output))
elec_data <- data.frame(read_csv(paste(mainDir, resources, 'TX_cvap_for_EI.csv', sep="")))

elections <- c('12G_President')

elec_dict <- vector(mode="list")
elec_dict[['12G_President']] <- list(c('RomneyR_12G_President', 'ObamaD_12G_President', 'X12G_President_abstain'), c('BCVAP_2012', 'HCVAP_2012', 'WCVAP_2012', 'OCVAP_2012', 'X12G_President_CVAP'))

ntunes_val <- 10
tunedraws <- 100000
thin_mcmc <- 100
burnin_mcmc <- 100000

for (e in elections){

  form <- paste('cbind(',paste(elec_dict[[e]][[1]],collapse = ', '),') ~ cbind(',paste(elec_dict[[e]][[2]],collapse = ', '),')', sep = '')

  tune.nocov <- tuneMD(form, data = elec_data, ntunes = ntunes_val, totaldraws = tunedraws)
  out.nocov1 <- ei.MD.bayes(form,covariate = NULL, data = elec_data,tune.list = tune.nocov, ret.mcmc = TRUE, burnin = burnin_mcmc, thin = thin_mcmc)

  mcmc_df <- data.frame(as.matrix(out.nocov1$draws$Cell.counts))

  write.csv(mcmc_df,paste(mainDir,output,e,"_EISAMPLES.csv",sep = ""))

  mcmc_df_prec <- as.matrix(out.nocov1$draws$Beta)
  x <- colMeans(mcmc_df_prec)
  y <- apply(mcmc_df_prec, 2, sd)
  probs <- c(0:8/8)
  q_0 <- apply(mcmc_df_prec, MARGIN = 2, FUN = quantile, probs = probs)
  write.csv(t(q_0), paste(mainDir,output,e,"_prec_quants.csv",sep = ""))
  write.csv(x, paste(mainDir,output,e,"_prec_means.csv",sep = ""))
  write.csv(y, paste(mainDir,output,e,"_prec_sd.csv",sep = ""))
}
