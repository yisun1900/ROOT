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
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center"> 
        <p>请输入客户姓名</p>
        <p>注意：&lt;1&gt;：输入完成后，一定点击按钮[<font color="#FF0000">保存输入姓名</font>]进行存盘，否则您输入的信息将丢失 
          <br>
          &lt;2&gt;：可通过客户姓名或合同号前的[<font color="#FF0000">选择框</font>]，确定用姓名还是合同号选择客户</p>
        <p>
      </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="53%" valign="top" bgcolor="#FFFFFF"> 
                <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
                  <tr bgcolor="#FFFFFF"> 
                    <td align="right" width="32%">
                      <input type="radio" name="xz" value="xzkhxm" checked>
                      客户姓名</td>
                    <td width="68%"> 
                      <input type="text" name="khxm" size="16" maxlength="50"  onKeyUp="go(selectform)">
                      <input type="text" name="count"  size="4">
                    </td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td align="right" width="32%">
                      <input type="radio" name="xz" value="xzhth">
                      合 同 号</td>
                    <td width="68%">
                      <input type="text" name="hth" size="16" maxlength="20"  onKeyUp="go(selectform)">
                    </td>
                  </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td align="right" width="32%">竣工验收日期</td>
                    <td width="68%"> 
                      <input type="text" name="srrq" size="16" maxlength="10"  onKeyUp="singleAdd(selectform)">
                    </td>
                  </tr>
                </table>
                <p>&nbsp; </p>
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
                <select name="khxmlist" size="25" multiple style="FONT-SIZE:12px;WIDTH:180px">
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="3"> 
                <input type="button"  value="保存输入姓名" onClick="f_do(selectform)" >
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
function go(FormName)
{               
	if (event.keyCode==13)//回车
	{
		if (FormName.xz[0].checked)
		{
			if (isExisted(FormName.khxmlist,FormName.khxm.value)!=-1){        
				alert("此客户姓名已被扫入到列表中！");        
				FormName.khxm.select() ;              
				return        
			}   
			
			if(	javaTrim(FormName.khxm)=="") {
				FormName.khxm.focus();
				return false;
			}
		}
		else{
			if (isExisted(FormName.khxmlist,FormName.hth.value)!=-1){        
				alert("此合同号已被扫入到列表中！");        
				FormName.hth.select() ;              
				return        
			}   
			
			if(	javaTrim(FormName.hth)=="") {
				FormName.hth.focus();
				return false;
			}
		}
		FormName.srrq.select();
//		parent.menu.aform.action="yrk_lrxxcx.jsp?khxm="+FormName.khxm.value;
//		parent.menu.aform.submit();
		
	}
}                                                                                                                                                       


//将单件已选产品加入出库列表               
function singleAdd(FormName)
{               
	if (event.keyCode==13)//回车
	{
		if (FormName.xz[0].checked)
		{
			if(	javaTrim(FormName.khxm)=="") {
				alert("请输入[客户姓名]！");
				FormName.khxm.focus();
				return false;
			}
		}
		else{
			if(	javaTrim(FormName.hth)=="") {
				alert("请输入[合同号]！");
				FormName.hth.focus();
				return false;
			}
		}
		if(	javaTrim(FormName.srrq)=="") {
			alert("请输入[实际竣工验收日期]！");
			FormName.srrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.srrq, "实际竣工验收日期"))) {
			return false;
		}

		add(FormName);
	}        
}                                                                                                                                                       

function add(FormName)//参数FormName:Form的名称
{
	if (FormName.xz[0].checked)
	{
		if (isExisted(FormName.khxmlist,FormName.khxm.value)!=-1){        
			alert("此客户姓名已被扫入到列表中！");        
			FormName.khxm.select() ;              
			return        
		}        
		var op1=document.createElement("OPTION");
		op1.value=FormName.khxm.value+":"+FormName.srrq.value;
		op1.text=FormName.khxmlist.options.length+1+":"+FormName.khxm.value+":"+FormName.srrq.value;
		FormName.khxmlist.add(op1);

		FormName.count.value=FormName.khxmlist.options.length ;              
		FormName.khxm.value="" ;              
		FormName.khxm.select() ;              
	}
	else{
		if (isExisted(FormName.khxmlist,FormName.hth.value)!=-1){        
			alert("此合同号已被扫入到列表中！");        
			FormName.hth.select() ;              
			return        
		}        
		var op1=document.createElement("OPTION");
		op1.value=FormName.hth.value+":"+FormName.srrq.value;
		op1.text=FormName.khxmlist.options.length+1+":"+FormName.hth.value+":"+FormName.srrq.value;
		FormName.khxmlist.add(op1);

		FormName.count.value=FormName.khxmlist.options.length ;              
		FormName.hth.value="" ;              
		FormName.hth.select() ;              
	}

	
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
		if ( o.options[index].value.substring(0,o.options[index].value.indexOf(":"))==val) 
			return index;  
		index++;  
	}    
	return -1;    
}        


function f_do(FormName)//参数FormName:Form的名称
{
	if (FormName.xz[0].checked)
	{
		if (FormName.khxmlist.length==0)
		{
			alert("请输入[客户姓名]！");
			FormName.khxm.focus();
			return false;
		}
	}
	else{
		if (FormName.khxmlist.length==0)
		{
			alert("请输入[合同号]！");
			FormName.hth.focus();
			return false;
		}
	}

	for(i=0;i<FormName.khxmlist.length;i++){                                                                         
		FormName.khxmlist.options[i].selected = true;                                                                         
	}                                                                        

	FormName.target="";
	FormName.action="KhxmList.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
