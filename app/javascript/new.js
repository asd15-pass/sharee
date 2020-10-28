// function new_form(){
// var i = 1 ;
//  const bt = document.getElementById('bt')
//  bt.addEventListener('click'){
//   function addForm() {
//     var src = document.getElementById("inputform_0");
//     var copy = src.cloneNode(true);
//     copy.id = 'inputform_' + i;
//     var parent = document.getElementById('form_area');
//     parent.appendChild(copy);

//     var button_data = document.createElement('button');
//     button_data.id = i;
//     button_data.onclick = function(){deleteBtn(this);}
//     button_data.innerHTML = '削除';
//     var input_area = document.getElementById(src.id);
//     parent.appendChild(button_data);
    
//     i++ ;
//   }

//   function deleteBtn(target) {
//     var target_id = target.id;
//     var parent = document.getElementById('form_area');
//     var ipt_id = document.getElementById('inputform_' + target_id);
//     var tgt_id = document.getElementById(target_id);
//     parent.removeChild(ipt_id);
//     parent.removeChild(tgt_id);	
//   }
// }
// }
// window.addEventListener('load',new_form)