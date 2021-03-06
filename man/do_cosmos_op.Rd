% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/do_cosmos_op.R
\name{do_cosmos_op}
\alias{do_cosmos_op}
\alias{do_cosmos_op.cosmos_endpoint}
\alias{do_cosmos_op.cosmos_database}
\alias{do_cosmos_op.cosmos_container}
\alias{do_cosmos_op.cosmos_document}
\title{Carry out a Cosmos DB operation}
\usage{
do_cosmos_op(object, ...)

\method{do_cosmos_op}{cosmos_endpoint}(object, ...)

\method{do_cosmos_op}{cosmos_database}(object, path = "", resource_type = "dbs", resource_link = "", ...)

\method{do_cosmos_op}{cosmos_container}(
  object,
  path = "",
  resource_type = "colls",
  resource_link = "",
  ...
)

\method{do_cosmos_op}{cosmos_document}(
  object,
  path = "",
  resource_type = "docs",
  resource_link = "",
  headers = list(),
  ...
)
}
\arguments{
\item{object}{A Cosmos DB endpoint, database, container or document object.}

\item{...}{Arguments passed to lower-level functions.}

\item{path}{The (partial) URL path for the operation.}

\item{resource_type}{The type of resource. For most purposes, the default value should suffice.}

\item{resource_link}{The resource link for authorization. For most purposes, the default value should suffice.}

\item{headers}{Any optional HTTP headers to include in the API call.}
}
\value{
The result of \code{call_cosmos_endpoint}: either a httr response object, or a list of such objects. Call \code{process_cosmos_response} to extract the result of the call.
}
\description{
Carry out a Cosmos DB operation
}
\details{
\code{do_cosmos_op} provides a higher-level interface to the Cosmos DB REST API than \code{call_cosmos_endpoint}. In particular, it sets the \code{resource_type} and \code{resource_link} arguments to sensible defaults, and fills in the beginning of the URL path for the REST call.
}
\examples{
\dontrun{

endp <- cosmos_endpoint("https://myaccount.documents.azure.com:443/", key="mykey")

db <- get_cosmos_database(endp, "mydatabase")
do_cosmos_op(db) \%>\%
    process_cosmos_response()

cont <- get_cosmos_container(db, "mycontainer")
do_cosmos_op(cont) \%>\%
    process_cosmos_response()

}
}
