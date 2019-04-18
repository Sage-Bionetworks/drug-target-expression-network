#!/usr/bin/env Rscript

require(optparse)
require(dten)

##run meta-network comparisons
suppressPackageStartupMessages(require(optparse))
suppressPackageStartupMessages(require(dten))

getArgs<-function(){
  
  option_list <- list(
    make_option(c("-i", "--input"), dest='input',help='Comma-delimited list of RDS files containing PCSF and enrichment output'),
    make_option(c("-o", "--output"), default="testprots.tsv", dest='output',help = "Prefix to add to output files")
  )
  
  args=parse_args(OptionParser(option_list = option_list))
  
  return(args)
}

main<-function(){
  
  args<-getArgs()
  all.nets<-lapply(unlist(strsplit(args$input,split=',')),readRDS)
  print(paste("Loaded",length(all.nets),'networks'))
  
  summary<-dten::getNetworkSummaries()
  
}

main()