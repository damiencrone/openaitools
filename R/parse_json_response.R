#' Parse OpenAI API JSON Response
#'
#' This function parses the response received from the OpenAI GPT-3 API.
#'
#' @param resp A response object obtained from the OpenAI API call.
#'
#' @return Parsed content from the response if successful, otherwise NA.
#'
#' @seealso \code{\link{strip_json_tags}}, \code{\link[httr]{content}}
#' @keywords openai api response parsing
#' @import httr
#'
#' @export
parse_json_response = function(resp) {
  parsed_response = parse_response(resp)
  if (!is.na(parsed_response)) {
    parsed_response = strip_json_tags(parsed_response)
  }
  return(parsed_response)
}
