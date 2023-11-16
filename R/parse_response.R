#' Parse OpenAI API Response
#'
#' This function parses the response received from the OpenAI GPT-3 API.
#'
#' @param resp A response object obtained from the OpenAI API call.
#'
#' @return Parsed content from the response if successful, otherwise NA.
#'
#' @examples
#' \dontrun{
#' # Example usage:
#' api_key <- "your_openai_api_key"
#' prompt_list <- list(list(role = "system", content = "you are a drop bear"),
#'                     list(role = "user", content = "What do you think of koalas?"))
#' response <- request_chat(api_key, prompt_list)
#' parsed_content <- parse_response(response)
#' }
#'
#' @seealso \code{\link[httr]{content}}
#' @keywords openai api response parsing
#' @import httr
#'
#' @export
parse_response = function(resp) {
  response_received = resp$status_code == 200
  if (response_received) {
    cont = content(resp)
    if (cont$choices[[1]]$finish_reason == "stop") {
      parsed_response = cont$choices[[1]]$message$content
      return(parsed_response)
    } else {
      print(resp)
      return(NA)
    }
  } else {
    print(resp)
    return(NA)
  }
}
