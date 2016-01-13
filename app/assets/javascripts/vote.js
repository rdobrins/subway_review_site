$(document).ready(function(){
  $(".vote").on("ajax:complete", function(a, b){
    var response = JSON.parse(b.responseText);
    var parentId = a.currentTarget.parentNode.id;
    var c = "";
    a = $("#" + parentId + " > .votes");
    a.empty();
    a.append("Upvotes: " + response.review.down_votes + " Downvotes: ");
    a.append(response.review.down_votes);
    if(response.temp === null){
      if(response.vote.up === true){
        if($("#" + parentId + " > #upvote input").length > 1){
          c = $("#" + parentId + " > #upvote input");
        }else{
          c = $("#" + parentId + " > #upvoted input");
        }
        c.css("background-color","green");
        c.css("color","white");
      }else{
        if($("#" + parentId + " > #downvote input").length > 1){
          c = $("#" + parentId + " > #downvote input");
        }else{
          c = $("#" + parentId + " > #downvoted input");
        }
        c.css("background-color","red");
        c.css("color","white");
      }
    }else{
      if(response.temp.up === true){
        if($("#" + parentId + " > #upvote input").length > 1){
          c = $("#" + parentId + " > #upvote input");
        }else{
          c = $("#" + parentId + " > #upvoted input");
        }
        c.css("background-color","white");
        c.css("color","green");
        if(response.vote.up !== true){
          if($("#" + parentId + " > #downvote input").length > 1){
            c = $("#" + parentId + " > #downvote input");
          }else{
            c = $("#" + parentId + " > #downvoted input");
          }
          c.css("background-color","red");
          c.css("color","white");
        }
      }else{
        if($("#" + parentId + " > #downvote input").length > 1){
          c = $("#" + parentId + " > #downvote input");
        }else{
          c = $("#" + parentId + " > #downvoted input");
        }
        c.css("background-color","white");
        c.css("color","red");
        if(response.vote.up === true){
          if($("#" + parentId + " > #upvote input").length > 1){
            c = $("#" + parentId + " > #upvote input");
          }else{
            c = $("#" + parentId + " > #upvoted input");
          }
          c.css("background-color","green");
          c.css("color","white");
        }
      }
    }
  });
});
