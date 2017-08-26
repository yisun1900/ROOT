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
String khbh=request.getParameter("khbh");
String dqbm=request.getParameter("dqbm");

%>
<body bgcolor="#FFFFFF"  style="FONT-SIZE:14" onload="selectform.zcmc.focus();">
<div align="center">
  <p>请输入客户姓名</p>
  <p>注意：<1>：输入[姓名]或[合同号]，按回车，全部输入完成后，一定点击按钮[<font color="#FF0000">继续</font>] 
    <BR>
    <2>：可通过客户[姓名]或[合同号]前的[<font color="#FF0000">选择框</font>]，确定用[姓名]还是[合同号]输入信息
  <table width="100%" border="0" style="FONT-SIZE:14">
    <tr>
      <td>
<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="52%" valign="top" bgcolor="#FFFFFF"> 
                <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
                  <tr bgcolor="#FFFFFF"> 
                    <td align="right" width="27%"> 主材名称</td>
                    <td width="73%"> 
                      <input type="text" name="zcmc" size="45" maxlength="50"  onKeyUp="keyGo(jldwbm)">
                    </td>
                  </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td align="right" width="27%">计量单位</td>
                    <td width="73%"> 
                      <input type="text" name="jldwbm" size="16" maxlength="20"  onKeyUp="keyGo(dj)">
                    </td>
                  </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td align="right" width="27%">单价</td>
                    <td width="73%"> 
                      <input type="text" name="dj" size="16" maxlength="20"  onKeyUp="keyGo(sl)">
                    </td>
                  </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td align="right" width="27%">数量</td>
                    <td width="73%"> 
                      <input type="text" name="sl" size="16" maxlength="8"  onKeyUp="keyGo(bz)">
                    </td>
                  </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td align="right" width="27%">备注</td>
                    <td width="73%"> 
                      <input type="text" name="bz" size="45" maxlength="300"  onKeyUp="singleAdd(selectform)">
                    </td>
                  </tr>
                </table>
                <p>&nbsp; </p>
              </td>
              <td width="8%" align="center"> 
                <p> 
                  <input type="button"  value="增加" onClick="add(selectform)" name="button" >
                </p>
                <p> 
                  <input type="button"  value="删除" onClick="remove(selectform)" name="button2" >
                </p>
              </td>
              <td width="40%"> 
                <select name="zcxmlist" size="32" multiple style="FONT-SIZE:12px;WIDTH:360px">
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="3"> 
                <div align="center">
                  <input type="hidden" name="khbh"  value="<%=khbh%>">
                  <input type="hidden" name="dqbm"  value="<%=dqbm%>">
                  <input type="button"  value="继续" onClick="f_do(selectform)" >
                </div>
              </td>
            </tr>
          </table>
        </form>
	  
	  </td>
    </tr>
  </table>
  
</div>
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
		if(	javaTrim(FormName.zcmc)=="") {
			alert("请输入[主材名称]！");
			FormName.zcmc.focus();
			return false;
		}
		if(	javaTrim(FormName.jldwbm)=="") {
			alert("请输入[计量单位]！");
			FormName.jldwbm.focus();
			return false;
		}
		if(	javaTrim(FormName.dj)=="") {
			alert("请输入[单价]！");
			FormName.dj.focus();
			return false;
		}
		if(!(isFloat(FormName.dj, "单价"))) {
			return false;
		}
		if(	javaTrim(FormName.sl)=="") {
			alert("请输入[数量]！");
			FormName.sl.focus();
			return false;
		}
		if(!(isFloat(FormName.sl, "数量"))) {
			return false;
		}

		add(FormName);
	}        
}                                                                                                                                                       

function add(FormName)//参数FormName:Form的名称
{
	if (isExisted(FormName.zcxmlist,FormName.zcmc.value)!=-1){        
		alert("此[客户姓名]已被扫入到列表中！");        
		FormName.zcmc.select() ;              
		return        
	}        
	var op1=document.createElement("OPTION");
	op1.value=FormName.zcmc.value+"^"+FormName.jldwbm.value+"^"+FormName.dj.value+"^"+FormName.sl.value+"^"+FormName.bz.value;
	op1.text=FormName.zcxmlist.options.length+1+":"+FormName.zcmc.value+"/"+FormName.jldwbm.value+"/"+FormName.dj.value+"/"+FormName.sl.value+"/"+FormName.bz.value;
	FormName.zcxmlist.add(op1);

	FormName.zcmc.select() ;              
	
}
function remove(FormName)//参数FormName:Form的名称
{
	for (var i=FormName.zcxmlist.options.length-1; i>=0; i--)
	{
		if (FormName.zcxmlist.options[i].selected)
		{
			FormName.zcxmlist.remove(i);
		}
	}
	for (var i=0;i<FormName.zcxmlist.options.length; i++)
	{
		FormName.zcxmlist.options[i].text=i+1+":"+FormName.zcxmlist.options[i].value;
	}
	FormName.count.value=FormName.zcxmlist.options.length ;              
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
	if (FormName.zcxmlist.length==0)
	{
		alert("请输入[主材名称]！");
		FormName.zcmc.select();
		return false;
	}

	for(i=0;i<FormName.zcxmlist.length;i++){                                                                         
		FormName.zcxmlist.options[i].selected = true;                                                                         
	}                                                                        

	FormName.target="";
	FormName.action="InsertBj_zcbjmx.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
