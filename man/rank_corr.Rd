\name{rank_corr}

\alias{rank_corr}

\title{Correlations and linear regressions between a rank metric and a set of
2+ variables
}

\description{Runs correlations (Pearson & Spearman) and linear regressions
(value- & rank-based) between a rank metric and a set of 2+ variables as well
as statistical analysis. Outputs a data frame of results, as well as scatter
plots for the correlation type and FDR-cutoff specified.
}

\usage{
rank_corr(data, variable="Drug", value="AUC",type="pearson",
            min.per.corr=3, plots=TRUE, FDR=0.05, xlab=colnames(data)[2],
            ylab=value, position.x="mid", position.y="max", se=TRUE)
}

\arguments{
  \item{data}{Data frame with sample names in column 1, the rank metric in
  column 2, and the set of variables (e.g. drugs) as column names starting at
  column 3.
  }

  \item{variable}{Description of the column names starting at column 3.
  Default: "Drug".
  }

  \item{value}{Description of the values starting at column 3. Do not include
  spaces! Default: "AUC".
  }

  \item{type}{Correlation type for plots. Must be specified as "pearson" or
  "spearman". Default: "pearson".
  }

  \item{min.per.corr}{Minimum number of samples required to run each
  correlation. Default: 3.
  }

  \item{plots}{Logical operator describing whether or not to produce scatter
  plots for correlations. Default: TRUE.
  }

  \item{FDR}{False discovery rate cut-off value to produce scatter plots for
  significant correlations. Default: 0.05.
  }

  \item{xlab}{Text describing rank metric for x-axis label of scatter plots.
  Default: colnames(data)[2].
  }

  \item{ylab}{Text describing variable values for y-axis label of scatter
  plots. Default: value.
  }

  \item{position.x}{X-axis position of correlation estimate on scatter plots.
  Must be "min", "mid", "max", or numeric. Default: "mid".
  }

  \item{position.y}{Y-axis position of correlation estimate on scatter plots.
  Must be "min", "mid", "max", or numeric. Default: "max".
  }

  \item{se}{Logical operator describing whether or not to include the 95
  percent confidence interval limits of the regression line on the scatter
  plots. Default: TRUE.
  }
}

\value{
  \item{result }{Data frame with correlation and regression estimates, p-values,
  and FDR q-values (Benjamini-Hochberg method) for each variable item.}

  \item{scatter.plots }{ggplot object with a scatter plot for each significant
  correlation on each page.}
}

\references{
Garana, B.B., Joly, J.H., Delfarah, A. et al. Drug mechanism enrichment analysis
improves prioritization of therapeutics for repurposing. BMC Bioinformatics 24,
215 (2023). https://doi.org/10.1186/s12859-023-05343-8
}

\author{Belinda B. Garana
}

\note{Scatter plots can be saved collectively to 1 file using:
ggsave(filename, rank.corr$scatter.plots)
}

\section{Warning}{For this function to work, you need 2 or more variables
in your data set.

Do not name your variable as "variable.name" or your value as "value.name".
Do not include spaces in "value" variable.
}

\examples{
## Step 1: prepare data frame with variables to correlate
# create list of sample names
Sample_ID <- seq(from = 1, to = 21)

# sample names must be in column 1
expression <- as.data.frame(Sample_ID)

# create list of gene symbols
Gene <- paste0("Gene_", seq(from = 1, to = 50))
for(i in 1:length(Gene)){
  expression[,c(Gene[i])] <- rnorm(length(Sample_ID), sd = 0.5)
}

## Step 2: run correlations between the rank metric and each variable's values
# sample names are in column 1, the rank metric is in column 2,
# and the variables are the rest of the columns
corr.test <- DMEA::rank_corr(expression)
}
