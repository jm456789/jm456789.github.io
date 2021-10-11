var itemList=[];
var addBtn = document.querySelector("#add");
addBtn.addEventListener("click",addList)
// == addBtn.onclick=addList;
//Dummy Function
function addList()
{
    var item=document.querySelector("#item").value;
    if(item!=null)
    {
        itemList.push(item);
        document.querySelector("#item").value="";
        document.querySelector("#item").focus();
    }
    showList();
}

function showList()
{
    var list="<ul>";
    for(var i=0; i<itemList.length; i++)
       {
        list +="<li>"+itemList[i]+"<span class='close' id= "+i+">X</sapn></li>";
       }
    list +="</ul>";

    document.querySelector("#itemlist").innerHTML = list;  

    
    var remove=document.querySelectorAll(".close");
    for(var i=0; i<itemList.length; i++)
       {
           remove[i].addEventListener("click",removeList);
       }
    list +="</ul>";

    // document.write("<ul><li>itemList[0]</li></ul>")
}
function removeList()
{
    var id=this.getAttribute("id");
    itemList.splice(id,1);
    showList();

}
