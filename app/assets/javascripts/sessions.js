window.sessions = function(){
  console.log('im the sessions js page')
  var buttons = document.getElementById("button");

  function clickMe(event){
    console.log('clicked!');
  }
  if (buttons){
    buttons.addEventListener('click', clickMe);
  }

}
