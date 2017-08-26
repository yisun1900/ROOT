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
	String dwbh=(String)session.getAttribute("dwbh");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String sql=null;
%>

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
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">分公司</div>
              </td>
              <td width="31%"> 
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");

        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> 
              </td>
              <td width="17%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" valign="top" bgcolor="#FFFFFF">回访类型</td>
              <td valign="top" bgcolor="#FFFFFF"> 
                <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' order by hflxbm","");
%> 
                </select>
              </td>
              <td width="15%" align="center">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" valign="top" bgcolor="#FFFFFF" align="right"> 
                <p> 客户姓名 </p>
              </td>
              <td width="35%" valign="top" bgcolor="#FFFFFF"> 
                <input type="text" name="khxm" size="16" maxlength="50"  onKeyUp="singleAdd(selectform)">
                <input type="text" name="count"  size="4">
              </td>
              <td width="15%" align="center"> 
                <p> 
                  <input type="button"  value="增加" onClick="add(selectform)" name="button" >
                </p>
                <p> 
                  <input type="button"  value="删除" onClick="remove(selectform)" name="button2" >
                </p>
              </td>
              <td width="35%"> 
                <select name="khxmlist" size="30" multiple style="FONT-SIZE:12px;WIDTH:152px">
                </select>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
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
