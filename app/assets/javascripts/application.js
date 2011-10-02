// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function addPlayer(lien)
{ 
  var xhr; 
  try {  xhr = new ActiveXObject('Msxml2.XMLHTTP');   }
  catch (e) 
  {
    try {   xhr = new ActiveXObject('Microsoft.XMLHTTP');    }
    catch (e2) 
    {
      try {  xhr = new XMLHttpRequest();     }
      catch (e3) {  xhr = false;   }
    }
  }

  xhr.onreadystatechange  = function()
  { 
    if(xhr.readyState  == 4)
    {
      if(xhr.status  == 200) 
      {
        var page = xhr.reponseXML;
        var input = page.getElementById("embed-code-field");
        var code = input.value;
      }else
      {
        document.ajax.dyn="Error code " + xhr.status;
      }
    }
  }; 

  xhr.open( GET", lien,  true); 
  xhr.send(null); 

  var article = document.getElementsByTagName("article")[0];
  alert(code);
}
