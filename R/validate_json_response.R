#' Validate JSON Response
#'
#' This function validates whether a parsed JSON response meets the expected requirements.
#'
#' @param parsed_response A character string representing the parsed JSON response.
#' @param verbose (Optional) A logical value indicating whether to print messages for validation results. Defaults to TRUE.
#'
#' @return A logical value indicating whether the response is valid (TRUE) or not (FALSE).
#'
#' @keywords json response validation error handling
#' @import rjson
#'
#' @export
validate_json_response = function(parsed_response, verbose=TRUE) {
  is_valid = FALSE
  # Check that response content matches requirements
  tryCatch({
    json_resp = rjson::fromJSON(parsed_response)
    is_valid = TRUE
    if (verbose) message("Valid response returned")
  }, error = function(e) {
    if (verbose) print(e)
  })
  return(is_valid)
}
