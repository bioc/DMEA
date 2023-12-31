\name{as_gmt}

\alias{as_gmt}

\title{gmt formatting
}

\description{Formats sets into gmt object.
}

\usage{
as_gmt(data, element.names = "Drug", set.names = "moa", min.per.set = 6,
        sep = "[|]", exclusions = c("-666", "NA", "na", "NaN", "NULL"),
        descriptions = NULL)
}

\arguments{
  \item{data}{Data frame with set membership information for each element.
  }

  \item{element.names}{Column name in data containing the element names.
  Default: "Drug".
  }

  \item{set.names}{Column name in data containing the set names. Default: "moa".
  }

  \item{min.per.set}{The minimum number of elements required per set for the
  output. Default: 6.
  }

  \item{sep}{Character(s) to use for splitting set names. Default: "[|]".
  }

  \item{exclusions}{A vector of set names to be excluded from the output.
  Default: c("-666", "NA", "na", "NaN", "NULL").
  }

  \item{descriptions}{Optional: column name in data containing descriptions for
  each set. If not provided, set names will be used instead. Default: NULL.
  }
}

\value{gmt object containing list of elements (genesets), set names
(geneset.names), and set descriptions (geneset.descriptions).
}

\references{
Garana, B.B., Joly, J.H., Delfarah, A. et al. Drug mechanism enrichment analysis
improves prioritization of therapeutics for repurposing. BMC Bioinformatics 24,
215 (2023). https://doi.org/10.1186/s12859-023-05343-8
}

\author{Belinda B. Garana
}

\note{The output can be used for enrichment analysis in R or saved for future
use as an R object using: saveRDS(gmt, file)
}

\examples{
## Step 1: prepare input data frame
# Drug is our default for the element.names parameter
Drug <- paste0("Drug_", LETTERS[seq(from = 1, to = 18)])

# moa is our default for the set.names parameter
moa <- rep(paste("Set", LETTERS[seq(from = 1, to = 3)]), 6)

# this example input has 18 drugs and 3 sets
data <- as.data.frame(cbind(Drug, moa))

## Step 2: produce gmt object
gmt.test <- DMEA::as_gmt(data)
}
