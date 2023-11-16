#' Get JSON Response from OpenAI API with Retry Logic
#'
#' This function attempts to obtain a valid JSON response from the OpenAI API with retry logic.
#'
#' @param api_key A character string representing the OpenAI API key for authentication.
#' @param prompt_list A list of messages forming the conversation prompt, where each message is a list with "role" (system, user, assistant) and "content" (message text).
#' @param model (Optional) A character string specifying the GPT model to use. Defaults to the model returned by default_model().
#' @param temp (Optional) A numeric value representing the temperature for sampling in the range [0, 1]. Defaults to 0.
#' @param max_tries (Optional) An integer specifying the maximum number of retry attempts. Defaults to 5.
#'
#' @return A parsed JSON response if successful, otherwise NA.
#'
#' @seealso \code{\link{request_chat}}, \code{\link{parse_response}}, \code{\link{validate_json_response}}, \code{\link{increment_attempt}}
#' @keywords openai api json response retry logic
#' @import rjson
#'
#' @export
get_json_response = function(api_key, prompt_list, model=default_model(), temp=0, max_tries = 5) {
  attempt = 0
  result = NA
  while (attempt < max_tries) {
    resp = request_chat(api_key = api_key, prompt_list = prompt_list, model = model)
    parsed_response = parse_response(resp)
    parsed_response = strip_json_tags(parsed_response)
    is_valid = validate_json_response(parsed_response)
    if (is_valid) {
      result = rjson::fromJSON(parsed_response)
      return(result)
    }
    attempt = increment_attempt(attempt, max_tries)
  }
  return(result)
}
