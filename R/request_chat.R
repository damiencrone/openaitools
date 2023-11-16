#' Request Chat Completion from OpenAI API
#'
#' This function sends a request to the OpenAI GPT-3 API for chat completion.
#'
#' @param api_key A character string representing the OpenAI API key for authentication.
#' @param prompt_list A list of messages forming the conversation prompt, where each message is a list with "role" (system, user, assistant) and "content" (message text).
#' @param model (Optional) A character string specifying the GPT model to use. Defaults to the model returned by default_model().
#' @param temp (Optional) A numeric value representing the temperature for sampling in the range (0, 1]. Defaults to 0.
#'
#' @return A response object from the API call.
#'
#' @examples
#' \dontrun{
#' # Example usage:
#' api_key <- "your_openai_api_key"
#' prompt_list <- list(list(role = "system", content = "You are a drop bear"),
#'                     list(role = "user", content = "What do you think of koalas?"))
#' response <- request_chat(api_key, prompt_list)
#' }
#'
#' @seealso \code{\link{add_headers}}, \code{\link[httr]{POST}}
#' @keywords openai api chat completion
#' @import httr
#'
#' @export
request_chat = function(api_key, prompt_list, model=default_model(), temp=0) {
  # Perform the API call
  url = "https://api.openai.com/v1/chat/completions"
  headers = httr::add_headers('Content-Type' = 'application/json',
                              'Authorization' = paste('Bearer', api_key))
  body = list(model = model,
              messages = prompt_list,
              temperature = temp)
  response = httr::POST(url, headers, body = body, encode = "json")
  return(response)
}
