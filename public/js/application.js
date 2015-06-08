$(document).ready(function() {
  var questionNum = 0;
  $('.add_choice').unbind("sum")

  $(".add_question").click(function(){
    questionNum ++;
    $("#questions").append(
      '<div id="question_'+ questionNum +'">\
          Question title: <input type="text" name="questions[' + questionNum + '][question_desc]"></input>\
          <br/>\
          <div id="question_'+ questionNum +'_choices"></div>\
          <button type="button" class="add_choice" value="'+ questionNum +'">Add Choice</button>\
        </div>\
        <br/><br/><br/>'
      );
  })
  $(document).on("click", ".add_choice", function() {
    var questionNumber = $(this).val();
    var nextChoiceNumber = $(this).parent().children("#question_" + questionNumber + "_choices").children("input").length + 1;
    $("#question_" + questionNumber + "_choices").append(
      'Choice: <input type="text" name="questions['+ questionNumber+'][choices]['+ nextChoiceNumber+']"></input>'
      );
    $("#question_" + questionNumber + "_choices").append("<br/>");
    nextChoiceNumber ++;
  });
});







  // function Question(questionId) {
  //   this.questionId = questionId;
  //   var questionClass = "question_" + questionCount
  //   var questionClassJquery = "." + questionClass
  //   $(".questions").append('<div class="question_">Question: <input type="text" name="questions[question_desc]"/></div>');
  //   $(".question_").attr("class", questionClass);

  //   $(questionClassJquery).append('<p class="choices"></p>');

  //   $(questionClassJquery).append('<button type="button" class="add_choice">Add Choice</button>');
  //   $(".add_choice").addClass(questionClass);



  //   this.Choice = function() {
  //     this.choiceId = choiceId;
  //     $(".choices ").append('<div>Choice: <input type="text" name="choices[choice_desc]" /></div>')
  //   }
  // }



//   $(".add_question").click(function(event){
//     event.preventDefault();
//     questionCount ++;
//     new Question("question" + questionCount);
//   }
//   $(".add_choice").click(function(event){
//     event.preventDefault();
//     var ??? = new Choice();
//     })
//   });
// });



