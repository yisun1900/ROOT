<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" >
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入客户姓名</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="53%" valign="top" bgcolor="#FFFFFF"> 
                <p>客户姓名 
                  <input type="text" name="khxm" size="16" maxlength="50"  onKeyUp="singleAdd(selectform)">
                  <input type="text" name="count"  size="4">
                </p>
              </td>
              <td width="11%" align="center"> 
                <p>
                  <input type="button"  value="增加" onClick="add(selectform)" name="button" >
                </p>
                <p> 
                  <input type="button"  value="删除" onClick="remove(selectform)" name="button2" >
                </p>
              </td>
              <td width="36%"> 
                <select name="khxmlist" size="25" multiple style="FONT-SIZE:12px;WIDTH:152px">
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="3"> 
                <input type="button"  value="继续" onClick="f_do(selectform)" >
                <input type="reset"  value="重输">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
//将单件已选产品加入出库列表               
function singleAdd(FormName)
{               
	if (event.keyCode==13)//回车
	{
		if(	javaTrim(FormName.khxm)=="") {
			alert("请输入[客户姓名]！");
			FormName.khxm.focus();
			return false;
		}

		if (isExisted(FormName.khxmlist,FormName.khxm.value)!=-1){        
			alert("此客户姓名已被扫入到列表中！");        
			FormName.khxm.select() ;              
			return        
		}      

		add(FormName);
	}        
}                                                                                                                                                       

function add(FormName)//参数FormName:Form的名称
{
	if (isExisted(FormName.khxmlist,FormName.khxm.value)!=-1){        
		alert("此客户姓名已被扫入到列表中！");        
		FormName.khxm.select() ;              
		return        
	}        
	var op1=document.createElement("OPTION");
	op1.value=FormName.khxm.value;
	op1.text=FormName.khxmlist.options.length+1+":"+FormName.khxm.value;
	FormName.khxmlist.add(op1);

	FormName.count.value=FormName.khxmlist.options.length ;              
	FormName.khxm.value="" ;              
	FormName.khxm.select() ;              
}
function remove(FormName)//参数FormName:Form的名称
{
	for (var i=FormName.khxmlist.options.length-1; i>=0; i--)
	{
		if (FormName.khxmlist.options[i].selected)
		{
			FormName.khxmlist.remove(i);
		}
	}
	for (var i=0;i<FormName.khxmlist.options.length; i++)
	{
		FormName.khxmlist.options[i].text=i+1+":"+FormName.khxmlist.options[i].value;
	}
	FormName.count.value=FormName.khxmlist.options.length ;              
}

//判断重复录入                                          
  
function isExisted(o,val){//在出库产品列表中判断        
	index=0;    
	while(index<o.length){  
		if ( o.options[index].value==val) 
			return index;  
		index++;  
	}    
	return -1;    
}        


function f_do(FormName)//参数FormName:Form的名称
{
	if (FormName.khxmlist.length==0)
	{
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	for(i=0;i<FormName.khxmlist.length;i++){                                                                         
		FormName.khxmlist.options[i].selected = true;                                                                         
	}                                                                        

	FormName.action="KhxmList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
