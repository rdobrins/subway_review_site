$(document).ready(function(){
  $(".vote").on("ajax:complete", function(a, b){
    var response = JSON.parse(b.responseText);
    var parentId = a.currentTarget.parentNode.id;
    a = $("#" + parentId + " > .votes");
    a.empty();
    a.append("Upvotes: " + response.review.up_votes);
    a.append(" Downvotes: " + response.review.down_votes);
    if(response.temp === null){
      if(response.vote.up === true){
        if($("#" + parentId + " > #upvote input").length > 1){
          var c = $("#" + parentId + " > #upvote input");
        }else{
          var c = $("#" + parentId + " > #upvoted input");
        };
        c.css("background-color","green");
        c.css("color","white");
      }else{
        if($("#" + parentId + " > #downvote input").length > 1){
          var c = $("#" + parentId + " > #downvote input");
        }else{
          var c = $("#" + parentId + " > #downvoted input");
        };
        c.css("background-color","red");
        c.css("color","white");
      }
    }else{
      if(response.temp.up === true){
        if($("#" + parentId + " > #upvote input").length > 1){
          var d = $("#" + parentId + " > #upvote input");
        }else{
          var d = $("#" + parentId + " > #upvoted input");
        };
        d.css("background-color","white");
        d.css("color","green");
        if(response.vote.up != true){
          if($("#" + parentId + " > #downvote input").length > 1){
            var c = $("#" + parentId + " > #downvote input");
          }else{
            var c = $("#" + parentId + " > #downvoted input");
          };
          c.css("background-color","red");
          c.css("color","white");
        }
      }else{
        if($("#" + parentId + " > #downvote input").length > 1){
          var d = $("#" + parentId + " > #downvote input");
        }else{
          var d = $("#" + parentId + " > #downvoted input");
        };
        d.css("background-color","white");
        d.css("color","red");
        if(response.vote.up === true){
          if($("#" + parentId + " > #upvote input").length > 1){
            var c = $("#" + parentId + " > #upvote input");
          }else{
            var c = $("#" + parentId + " > #upvoted input");
          };
          c.css("background-color","green");
          c.css("color","white");
        };
      }
    }
  });
});
