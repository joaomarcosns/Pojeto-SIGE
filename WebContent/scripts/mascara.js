function mascara(i,type){
   
   var valor = i.value;
    
   if(isNaN(valor[valor.length-1]) || valor[valor.length-1] === " "){
      i.value = valor.substring(0, valor.length-1);
      return;
   }
    
   if(type == "data"){
      i.setAttribute("maxlength", "10");
      if (valor.length == 2 || valor.length == 5) i.value += "/";
   }
 
   if(type == "cpf"){
      i.setAttribute("maxlength", "14");
      if (valor.length == 3 || valor.length == 7) i.value += ".";
      if (valor.length == 11) i.value += "-";
   }
 
   if(type == "cep"){
      i.setAttribute("maxlength", "9");
      if (valor.length == 5) i.value += "-";
   }
 
   if(type == "tel"){
      if(valor[0] == 9){
         i.setAttribute("maxlength", "10");
         if (valor.length == 5) i.value += "-";
      } 
      else if(valor[0] == 3){
         i.setAttribute("maxlength", "13");
         if (valor.length == 2) i.value += " ";
      } else{
         i.setAttribute("maxlength", "9");
         if (valor.length == 4) i.value += "-";
      }
   }
}

function validaInput(i){

   var valor = i.value;

   if(valor[0] === " "){
      i.value = valor.substring(0, valor.length-1);
      return;
   }

   if (i.type == "number" && valor < 0){
      i.value = valor.substring(0, valor.length-1);
      return;
   }
}
