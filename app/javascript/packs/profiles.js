// These functions are specifically loaded in the Profiles views

function count_biography_characters() {
  var text_entered = document.getElementById('participant_biography').value;
  var limit = parseInt(document.getElementById('biography_max_character_length').value);
  var counter = limit - text_entered.length;
  var remaining = document.getElementById('biography_characters_remaining');
  remaining.textContent = counter + " characters remaining";
}

function count_survey_answer_characters(answer_element, question_id) {
  var text_entered = answer_element.value;
  var limit = parseInt(document.getElementById('survey_answer_max_character_length').value);
  var counter = limit - text_entered.length;
  var remaining = document.getElementById('survey_answer_characters_remaining_' + question_id);
  remaining.textContent = counter + " characters remaining";
}

// Get the Biography textarea and add the event listener
var biography = document.getElementById('participant_biography');
biography.addEventListener('input', count_biography_characters, false);

// Get the Survey Answer textareas and add the event listeners
var answers = document.getElementsByClassName("survey_answer");
for (var i = 0; i < answers.length; i++) {
  // Immediate invocation
  (function () {
    var answer = answers[i];
    // Remove the 'sqa_' to get the question_id
    var question_id = answer.id.substring(4);
    answers[i].addEventListener('input', function() { count_survey_answer_characters(answer, question_id); }, false);
  }());
}

// Update the counters on page load
document.addEventListener("DOMContentLoaded", function() {
  count_biography_characters();

  for (var i = 0; i < answers.length; i++) {
    // Remove the 'sqa_' to get the question_id
    var question_id = answers[i].id.substring(4);
    count_survey_answer_characters(answers[i], question_id);
  }
});