\name{VRangesList-class}
\docType{class}

% Class:
\alias{class:VRangesList}
\alias{VRangesList-class}
\alias{CompressedVRangesList-class}
\alias{class:CompressedVRangesList}
\alias{SimpleVRangesList-class}
\alias{class:SimpleVRangesList}

% Constructors:
\alias{VRangesList}

% Aggregation:
\alias{stackSamples}
\alias{stackSamples,VRangesList-method}

\title{VRangesList objects}

\description{
  VRangesList is a virtual class representing a list of
  \code{\linkS4class{VRanges}} objects and should behave much like any
  other derivative of \code{List}. It has both a simple and
  compressed implementation. VRangesList provides conveniences for
  manipulating sets of \code{VRanges} objects.
}

\section{Constructor}{
  \describe{
    \item{}{
      \code{VRangesList(...)}:
      Creates a VRangesList object from \code{VRanges} objects in \dots.
    }
  }
}

\section{Utilities}{
  \describe{
    \item{}{
      \code{stackSamples(x)}: Concentrates the elements in \code{x},
      using \code{names(x)} to appropriately fill \code{sampleNames} in
      the result.
    }
  }
}
 
\author{Michael Lawrence}

\examples{
## construction
vr <- VRanges(seqnames = c("chr1", "chr2"),
              ranges = IRanges(c(1, 10), c(5, 20)),
              ref = c("T", "A"), alt = c("C", "T"),
              refDepth = c(5, 10), altDepth = c(7, 6),
              totalDepth = c(12, 17), sampleNames = letters[1:2],
              hardFilters =
                FilterRules(list(coverage = function(x) totalDepth > 10)),
              softFilterMatrix =
                FilterMatrix(matrix = cbind(depth = c(TRUE, FALSE)),
                             FilterRules(depth = function(x) altDepth(x) > 6)),
              tumorSpecific = c(FALSE, TRUE))

vrl <- VRangesList(sampleA = vr, sampleB = vr)
stackSamples(vrl)
}
