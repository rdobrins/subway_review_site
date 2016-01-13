$(document).ready(function(){
  $(".vote").on("ajax:complete", function(a, b){
    var response = JSON.parse(b.responseText);
    var parentId = a.currentTarget.parentNode.id;

    a = $("#" + parentId + " > .votes");
    a.empty();
    a.append("Upvotes: " + response.review["up_votes"] + " Downvotes: " + response.review["down_votes"]);
    if(response.temp == null){
      if(response.vote.up === true){
        c = $("#" + parentId + " > #upvote input");
        c.css("background-color","green");
        c.css("color","white");
        d = $("#" + parentId + " > #upvoted input");
        d.css("background-color","green");
        d.css("color","white");
      }else{
        c = $("#" + parentId + " > #downvote input");
        c.css("background-color","red");
        c.css("color","white");
        d = $("#" + parentId + " > #downvoted input");
        d.css("background-color","red");
        d.css("color","white");
      }
    }else{
      if(response.temp.up === true){
        c = $("#" + parentId + " > #upvote input");
        c.css("background-color","white");
        c.css("color","green");
        d = $("#" + parentId + " > #upvoted input");
        d.css("background-color","white");
        d.css("color","green");
        if(response.vote.up != true){
          c = $("#" + parentId + " > #downvote input");
          c.css("background-color","red");
          c.css("color","white");
          d = $("#" + parentId + " > #downvoted input");
          d.css("background-color","red");
          d.css("color","white");
        }
      }else{
        c = $("#" + parentId + " > #downvoted input");
        c.css("background-color","white");
        c.css("color","red");
        d = $("#" + parentId + " > #downvote input");
        d.css("background-color","white");
        d.css("color","red");
        if(response.vote.up === true){
          c = $("#" + parentId + " > #upvote input");
          c.css("background-color","green");
          c.css("color","white");
          d = $("#" + parentId + " > #upvoted input");
          d.css("background-color","green");
          d.css("color","white");
        };
      };
    };
  });
});
