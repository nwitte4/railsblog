window.comments = function(){
  console.log('im the posts js page')
  var buttons = document.getElementById("button");

  function clickMe(event){
    console.log('clicked!');
  }
  if (buttons){
    buttons.addEventListener('click', clickMe);
  }

}
