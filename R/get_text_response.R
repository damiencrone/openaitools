#' Get plain text OpenAI API Response with Retry Logic
#'
#' This function attempts to obtain a response from the OpenAI GPT-3 API with retry logic.
#'
#' @param api_key A character string representing the OpenAI API key for authentication.
#' @param prompt_list A list of messages forming the conversation prompt, where each message is a list with "role" (system, user, assistant) and "content" (message text).
#' @param model (Optional) A character string specifying the GPT-3 model to use. Defaults to the default model.
#' @param temp (Optional) A numeric value representing the temperature for sampling in the range (0, 1]. Defaults to 0.
#' @param max_tries (Optional) An integer specifying the maximum number of retry attempts. Defaults to 5.
#'
#' @return A parsed response if successful, otherwise NA.
#'
#' @examples
#' \dontrun{
#' # Example usage:
#' api_key <- "your_openai_api_key"
#' prompt_list <- list(list(role = "system", content = "You are a drop bear"),
#'                     list(role = "user", content = "What do you think of koalas?"))
#' response <- get_text_response(api_key, prompt_list)
#' }
#'
#' @seealso \code{\link{request_chat}}, \code{\link{parse_response}}, \code{\link{increment_attempt}}
#' @keywords openai api response retry logic
#'
#' @export
get_text_response = function(api_key, prompt_list, model=default_model(), temp=0, max_tries = 5) {
  attempt = 0
  result = NA
  while (attempt < max_tries) {
    resp = request_chat(api_key = api_key, prompt_list = prompt_list, model = model)
    result = parse_response(resp)
    if (!is.na(result)) {
      return(result)
    }
    attempt = increment_attempt(attempt, max_tries)
  }
  return(result)
}
