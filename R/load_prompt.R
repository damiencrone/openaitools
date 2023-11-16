#' Load Prompt from File
#'
#' This function reads the contents of a file and returns a concatenated string.
#'
#' @param file A character string specifying the file path to read the prompt from.
#'
#' @return A character string containing the contents of the file.
#'
#' @examples
#' \dontrun{
#' # Example usage:
#' file_path <- "path/to/your/prompt_file.txt"
#' prompt_text <- load_prompt(file_path)
#' }
#'
#' @export
load_prompt = function (file) {
  return(paste(readLines(file), collapse = "\n"))
}
