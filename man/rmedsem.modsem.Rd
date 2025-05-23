% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rmedsem_modsem.R
\name{rmedsem.modsem}
\alias{rmedsem.modsem}
\title{Calculate a mediation analysis for an SEM based on a modsem model.}
\usage{
\method{rmedsem}{modsem}(
  mod,
  indep,
  med,
  dep,
  moderator = NULL,
  standardized = TRUE,
  mcreps = NULL,
  approach = c("bk", "zlc"),
  p.threshold = 0.05,
  effect.size = c("RIT", "RID"),
  ci.two.tailed = 0.95
)
}
\arguments{
\item{mod}{A fitted SEM model (modsem).}

\item{indep}{A string indicating the name of the independent variable in the model.}

\item{med}{A string indicating the name of the mediator variable in the model.}

\item{dep}{A string indicating the name of the dependent variable in the model.}

\item{moderator}{A string indicating the name of the moderator variable in the model.}

\item{standardized}{A boolean indicating whether the coefficients should be
standardized. The default value is F.}

\item{mcreps}{An integer determining the number of monte-carlo samples.}

\item{approach}{either 'bk' or 'zlc' or both c("bk", "zlc") (default)}

\item{p.threshold}{A double giving the p-value for determining whether a path
is significant or not}

\item{effect.size}{calculate different effect-sizes; one or more of "RIT", "RID"}
}
\value{
A \code{rmedsem} structure containing the results from the analysis
}
\description{
Calculate a mediation analysis for an SEM based on a modsem model.
}
\examples{
\dontrun{

m <- "
  OwnLook =~ smv_attr_face + smv_attr_body + smv_sexy
  SelfEst =~ ses_satis + ses_qualities + ses_able_todo
  MentWell =~ mwb_optimistic + mwb_useful + mwb_energy
  smv =~ smv_kind + smv_caring + smv_understanding +
    smv_make_laughh + smv_funny + smv_sociable
  SelfEst ~ OwnLook + smv + smv:OwnLook
  MentWell ~ OwnLook + SelfEst + smv + smv:OwnLook
"


est <- modsem(m, data = mchoice2, method="lms")

# mediated moderation
rmedsem(indep="smv:OwnLook", dep="MentWell", med="SelfEst", mod=est)

# moderated mediation
rmedsem(indep="OwnLook", dep="MentWell", med="SelfEst", mod=est, moderator="smv")

}

}
