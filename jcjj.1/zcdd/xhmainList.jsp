<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
%>


<body bgcolor="#FFFFFF" onload="selectform.jc_zcjgb_xh.select()" style="FONT-SIZE:14">

        <form method="post" action="xhcpmainList.jsp" name="selectform" target="cpmain">
        
          
      <div align="center">输入型号，按『回车』键</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr align="center"> 
      <td > 
        <input type="button"  value="查询" onClick="f_do(selectform)" >
      </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="66%"> 
        <input type="radio" name="mhcx" value="N" checked>
        精确查询
		<input type="radio" name="mhcx" value="Y">
        模糊查询 </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="66%">型号 
        <input type="text" name="jc_zcjgb_xh" size="20" maxlength="100" onKeyUp="singleAdd(selectform)" >
      </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="66%"> 
        <select name="xhlist" size="24" multiple style="FONT-SIZE:12px;WIDTH:152px">
        </select>
      </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="66%">订单编号 
        <input type="text" name="ddbh" size="12" maxlength="20" value="<%=ddbh%>" readonly>
      </td>
    </tr>
  </table>
</form>


</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
//将型号加入列表               
function singleAdd(FormName)
{               
	if (event.keyCode==13)//回车
	{
		add(FormName);
	}        
}                                                                                                                                                       

function add(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jc_zcjgb_xh)=="") {
		alert("请输入[型号]！");
		FormName.jc_zcjgb_xh.focus();
		return false;
	}

	if (isExisted(FormName.xhlist,FormName.jc_zcjgb_xh.value)!=-1){        
		alert("此[型号]已被选择！");        
		FormName.jc_zcjgb_xh.select() ;              
		return        
	}        
	var op1=document.createElement("OPTION");
	op1.value=FormName.jc_zcjgb_xh.value;
	op1.text=FormName.xhlist.options.length+1+":"+FormName.jc_zcjgb_xh.value;
	FormName.xhlist.add(op1);


	FormName.jc_zcjgb_xh.value="" ;              
	FormName.jc_zcjgb_xh.select() ;   
	
}
function remove(FormName)//参数FormName:Form的名称
{
	for (var i=FormName.xhlist.options.length-1; i>=0; i--)
	{
		if (FormName.xhlist.options[i].selected)
		{
			FormName.xhlist.remove(i);
		}
	}
	for (var i=0;i<FormName.xhlist.options.length; i++)
	{
		FormName.xhlist.options[i].text=i+1+":"+FormName.xhlist.options[i].value;
	}

}

//判断重复录入                                          
  
function isExisted(o,val){//在列表中判断        
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
	for(i=0;i<FormName.xhlist.length;i++){                                                                         
		FormName.xhlist.options[i].selected = true;                                                                         
	}                                                                        


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
