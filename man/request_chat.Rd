% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/request_chat.R
\name{request_chat}
\alias{request_chat}
\title{Request Chat Completion from OpenAI API}
\usage{
request_chat(api_key, prompt_list, model = default_model(), temp = 0)
}
\arguments{
\item{api_key}{A character string representing the OpenAI API key for authentication.}

\item{prompt_list}{A list of messages forming the conversation prompt, where each message is a list with "role" (system, user, assistant) and "content" (message text).}

\item{model}{(Optional) A character string specifying the GPT model to use. Defaults to the model returned by default_model().}

\item{temp}{(Optional) A numeric value representing the temperature for sampling in the range (0, 1]. Defaults to 0.}
}
\value{
A response object from the API call.
}
\description{
This function sends a request to the OpenAI GPT-3 API for chat completion.
}
\examples{
\dontrun{
# Example usage:
api_key <- "your_openai_api_key"
prompt_list <- list(list(role = "system", content = "You are a drop bear"),
                    list(role = "human", content = "What do you think of koalas?"))
response <- request_chat(api_key, prompt_list)
}

}
\seealso{
\code{\link{add_headers}}, \code{\link[httr]{POST}}
}
\keyword{api}
\keyword{chat}
\keyword{completion}
\keyword{openai}
