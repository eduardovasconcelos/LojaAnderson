/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function mark_for_destroy(element)
{
    $(element).next('.should_destroy').value = 1;
    $(element).up('.item').hide();
}


