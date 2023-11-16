#' Strip JSON Tags from Text
#'
#' This function removes JSON code tags from a text string.
#'
#' @param x A character string possibly containing JSON code tags.
#'
#' @return The input string with JSON code tags removed.
#'
#' @examples
#' \dontrun{
#' # Example usage:
#' input_text <- "```json\n{\"key\": \"value\"}\n```"
#' stripped_text <- strip_json_tags(input_text)
#' }
#'
#' @keywords text manipulation json tags removal
#'
#' @export
strip_json_tags = function(x) {
  start_str = "```json\n"
  if (startsWith(x, start_str)) {
    x = substr(x = x, start = nchar(start_str)+1, stop = nchar(x))
  }
  end_str = "```"
  if (endsWith(x, end_str)) {
    x = substr(x = x, start = 1, stop = nchar(x)-nchar(end_str))
  }
  return(x)
}
