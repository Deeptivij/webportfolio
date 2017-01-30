//script for sidebar.html.erb


//script for image slidehsow

    
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });

    $(document).ready(function() {
        $("input[name='sort']").on("change", function(){  
        alert(this.value);      
            if(this.value=='poem'){
        $(".read_couplet").addClass("hide");
        $(".read_poem").removeClass("hide");
        }
        else{
            $(".read_couplet").removeClass("hide");
        $(".read_poem").addClass("hide");
        }
    });
    	$("input[name='sort_project']").on("change", function(){        if(this.value=='songs'){
        $(".poems").addClass("hide");
        $(".events").addClass("hide");
        $(".songs").removeClass("hide");
    	}
    	else if(this.value=='poems'){
        $(".songs").addClass("hide");
        $(".events").addClass("hide");
        $(".poems").removeClass("hide");
    	}
    	else{
    		$(".songs").addClass("hide");
        $(".poems").addClass("hide");
        $(".events").removeClass("hide");
    	}
    });
    	
       

    });
    
