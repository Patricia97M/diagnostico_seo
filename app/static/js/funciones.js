$(document).ready(function () {       
    var bien = $("img[class*='bien']").length;
    var mal = $("img[class*='mal']").length;

    var total = bien + mal;
    var porcentajeBien = bien / total * 100;
    var porcentajeMal = mal / total * 100;

    $("span[class*='contadorBien']").text(Math.round(porcentajeBien)+"%");
  
    $("span[class*='contadorMal']").text(Math.round(porcentajeMal)+"%");

    $("p[class*='totalB']").text(bien+" puntos SEO");
  
    $("p[class*='totalM']").text(mal+" puntos SEO");

    $("input[type=url]").on("keyup",function () {
        option=false;
        if (!this.value) {
            option=true;
        }
        $(".analizar").attr("disabled",option);
    });
    $("#modal").click(function(){
        var url = $("#url").val();
        $("#url2").val(url);
        $("#btnPersonalizado").attr("disabled",true);
    });
    $("input[type=checkbox]").change(function(){

		var elemento=this;
		var contador=0;

		$("input[type=checkbox]").each(function(){
			if($(this).is(":checked"))
				contador++;
        });
        if (contador==0){
            $("#btnPersonalizado").attr("disabled",true);
        }else{
            $("#btnPersonalizado").attr("disabled",false);
        }
    });
    /*$("#btnPersonalizado").click(function(){
        var elemento=this;
		var contador=0;

		$("input[type=checkbox]").each(function(){
			if($(this).is(":checked"))
				contador++;
        });
        if (contador==0){
            $("#btnPersonalizado").attr("disabled",true);
        }else{
            $("#btnPersonalizado").attr("disabled",false);
        }
    });*/
   
});
jQuery(document).ready(function(){
$(".oculto").hide();              
$(".btn-consejo").click(function(){
    var nodo = $(this).attr("href");  

    if ($(nodo).is(":visible")){
        $(nodo).hide();
        return false;
    }else{
    $(".oculto").hide("slow");                             
    $(nodo).fadeToggle("fast");
    return false;
    }
});
}); 