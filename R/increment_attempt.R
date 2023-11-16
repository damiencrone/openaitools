#' Increment Attempt for Retry Logic
#'
#' This function increments the attempt count for retry logic and provides messages based on the attempt status.
#'
#' @param attempt The current attempt count.
#' @param max_tries An integer specifying the maximum number of retry attempts.
#'
#' @return A message indicating the attempt status.
#'
#' @examples
#' \dontrun{
#' # Example usage:
#' current_attempt <- 2
#' max_attempts <- 3
#' increment_attempt(current_attempt, max_attempts)
#' }
#'
#' @keywords retry logic attempt counting message
#'
#' @export
increment_attempt = function(attempt, max_tries) {
  attempt = attempt + 1
  if (attempt < max_tries) {
    message("Attempt ", attempt, " unsuccessful; pausing for ", 2^attempt, " seconds (@", Sys.time(), ") before retrying...")
    Sys.sleep(2^attempt)
  } else {
    message("Max retries reached; returning NA")
  }
  return(attempt)
}
