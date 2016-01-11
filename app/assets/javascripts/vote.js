$(document).ready(function(){
  // $('.vote').on('submit', function(event){
  //   console.log("lsakjdf");
  //   event.preventDefault();
  //
  //   var request =
  //
  // });
  $('.vote').on("ajax:complete", function(a, b, c){
    response = JSON.parse(b.responseText);

    var parentId = a.currentTarget.parentNode.id;
    a = $("#" + parentId + " > .votes");
    console.log(a);

    a.empty();
    a.append("Upvotes: " + response["up_votes"] + " Downvotes: " + response["down_votes"]);
  });
});
