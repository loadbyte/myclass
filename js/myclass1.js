
function selectcourse(c_id){
    var dataString = "c_id="+c_id;
    var url_str = "selectcourse.php";
        
      $.ajax({
       type: "POST",
       url: url_str,
       data: dataString,
       cache: false,
       success: function(result){
        
        $( ".modal-title" ).html( modal_title );
        $( ".modal-body" ).html( result );
         $('#myModal').modal('show') ; 
       }
       });
    }
function showModal(url,query, modal_title){
    var dataString = query;
    var url_str = url;
        
      $.ajax({
       type: "get",
       url: url_str,
       data: dataString,
       cache: false,
       success: function(result){
        
        $( ".modal-title" ).html( modal_title );
        $( ".modal-body" ).html( result );
         $('#myModal').modal('show') ; 
       }
       });
    }




