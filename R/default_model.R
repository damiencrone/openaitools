#' Default Model Selection
#'
#' This function returns the default model identifier for use in certain applications.
#' The default model is set to "gpt-3.5-turbo-1106".
#'
#' @return A character string representing the default model identifier.
#'
#' @examples
#' default_model()
#'
#' @export
default_model = function () {
  return("gpt-3.5-turbo-1106")
}
