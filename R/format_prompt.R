#' Format Prompt
#'
#' Replace placeholders in a prompt template with corresponding inputs.
#'
#' @param prompt_template A character string representing the prompt template with placeholders.
#' @param inputs A named list where names are placeholders in the template and values are the replacements.
#'
#' @return A character string with placeholders replaced by corresponding values.
#'
#' @examples
#' prompt_template <- "<name>'s age: <age>"
#' inputs <- list(name = "John", age = 25)
#' format_prompt(prompt_template, inputs)
#'
#' @export
format_prompt = function(prompt_template, inputs) {
  prompt = prompt_template
  for (i in 1:length(inputs)) {
    input = names(inputs)[i]
    string = inputs[[i]]
    tag = paste0("<", input, ">")
    prompt = gsub(pattern = tag, replacement = string, x = prompt)
  }
  return(prompt)
}
