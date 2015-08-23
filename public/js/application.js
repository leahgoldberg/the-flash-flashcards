$(document).ready(function() {
  $(".delete-button").click(function () {
    if (confirm("Are you sure? This action is not reversible.")){
      $("form.delete").submit();
    };
  });
});


