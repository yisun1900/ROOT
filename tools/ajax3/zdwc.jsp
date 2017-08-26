<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
  <head>
    <title>Ajax 演示</title>
    <style type="text/css">

    .mouseOut {
    background: #708090;
    color: #FFFAFA;
    }

    .mouseOver {
    background: #FFFAFA;
    color: #000000;
    }
    </style>
    <script type="text/javascript">        
        var xmlHttp;
        var completeDiv;
        var inputField;
        var nameTable;
        var nameTableBody;

        function createXMLHttpRequest() {
            if (window.ActiveXObject) {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            else if (window.XMLHttpRequest) {
                xmlHttp = new XMLHttpRequest();                
            }
        }

        function initVars() {
            inputField = document.getElementById("names");            
            nameTable = document.getElementById("name_table");
            completeDiv = document.getElementById("popup");
            nameTableBody = document.getElementById("name_table_body");
        }

        function findNames() 
		{
            initVars();
            if (inputField.value.length > 0) 
			{
                createXMLHttpRequest();            
                var url = "zdwcServlet?names=" + inputField.value;                        
                xmlHttp.open("GET", url, true);
                xmlHttp.onreadystatechange = callback;
                xmlHttp.send(null);
            } 
			else 
			{
                clearNames();
            }
        }

        function callback() {
            if (xmlHttp.readyState == 4) {
                if (xmlHttp.status == 200) {
                    var name = xmlHttp.responseXML.getElementsByTagName("name")[0].firstChild.data;
                    setNames(xmlHttp.responseXML.getElementsByTagName("name"));
                } else if (xmlHttp.status == 204){
                    clearNames();
                }
            }
        }
        
        function setNames(the_names) {            
            clearNames();
            var size = the_names.length;
            setOffsets();

            var row, cell, txtNode;
            for (var i = 0; i < size; i++) 
			{
                var nextNode = the_names[i].firstChild.data;


				
				
				
				
				
				//转换UTF8编码到汉字＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
				nextNode=chineseFromUtf8Url(nextNode);


                row = document.createElement("tr");
                cell = document.createElement("td");
                
                cell.onmouseout = function() {this.className='mouseOver';};
                cell.onmouseover = function() {this.className='mouseOut';};
                cell.setAttribute("bgcolor", "#FFFAFA");
                cell.setAttribute("border", "0");
                cell.onclick = function() { populateName(this); } ;                             

                txtNode = document.createTextNode(nextNode);
                cell.appendChild(txtNode);
                row.appendChild(cell);
                nameTableBody.appendChild(row);
            }
        }

        function setOffsets() {
            var end = inputField.offsetWidth;
            var left = calculateOffsetLeft(inputField);
            var top = calculateOffsetTop(inputField) + inputField.offsetHeight;

            completeDiv.style.border = "black 1px solid";
            completeDiv.style.left = left + "px";
            completeDiv.style.top = top + "px";
            nameTable.style.width = end + "px";
        }
        
        function calculateOffsetLeft(field) {
          return calculateOffset(field, "offsetLeft");
        }

        function calculateOffsetTop(field) {
          return calculateOffset(field, "offsetTop");
        }

        function calculateOffset(field, attr) {
          var offset = 0;
          while(field) {
            offset += field[attr]; 
            field = field.offsetParent;
          }
          return offset;
        }

        function populateName(cell) {
            inputField.value = cell.firstChild.nodeValue;
            clearNames();
        }

        function clearNames() {
            var ind = nameTableBody.childNodes.length;
            for (var i = ind - 1; i >= 0 ; i--) {
                 nameTableBody.removeChild(nameTableBody.childNodes[i]);
            }
            completeDiv.style.border = "none";
        }





//新增转换UTF8－－>汉字
  function   utf8CodeToChineseChar(strUtf8)   
  {   
      var   iCode,   iCode1,   iCode2;   
      iCode   =   parseInt("0x"   +   strUtf8.substr(1,   2));   
      iCode1   =   parseInt("0x"   +   strUtf8.substr(4,   2));   
      iCode2   =   parseInt("0x"   +   strUtf8.substr(7,   2));   
        
      return   String.fromCharCode(((iCode & 0x0F) << 12) | ((iCode1 & 0x3F) << 6) | (iCode2 & 0x3F));   
  }   
    
  //   将   UTF8   编码的   URL   中的中文部分（<   0xFFFF）转换过来   
function   chineseFromUtf8Url(strUtf8)     
{   
	var   bstr   =   "";   
	var   nOffset   =   0; //   processing   point   on   strUtf8   

	if(   strUtf8   ==   ""   )   
		return   "";   

	strUtf8   =   strUtf8.toLowerCase();   
	nOffset   =   strUtf8.indexOf("%e");   
	if(   nOffset   ==   -1   )   
		return   strUtf8;   

	while(   nOffset   !=   -1   )   
	{   
		bstr   +=   strUtf8.substr(0,   nOffset);   
		strUtf8   =   strUtf8.substr(nOffset,   strUtf8.length   -   nOffset);   
		if(   strUtf8   ==   ""   ||   strUtf8.length   <   9   )       //   bad   string   
			return   bstr;   

		bstr   +=   utf8CodeToChineseChar(strUtf8.substr(0,   9));   
		strUtf8   =   strUtf8.substr(9,   strUtf8.length   -   9);   
		nOffset   =   strUtf8.indexOf("%e");   
	}   

	return   bstr   +   strUtf8;   
}   
    









    </script>
  </head>
  <body>
    <h1>Ajax 演示</h1>
    姓名: <input type="text" size="20" id="names" onkeyup="findNames();" style="height:20;"/>
   
	<div style="position:absolute;" id="popup">
        <table id="name_table" bgcolor="#FFFAFA" border="0" cellspacing="0" cellpadding="0"/>            
            <tbody id="name_table_body"></tbody>
        </table>
    </div>

  </body>
</html>





