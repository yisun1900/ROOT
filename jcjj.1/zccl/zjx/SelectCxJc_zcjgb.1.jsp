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
	String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));

	String ppbm=cf.GB2Uni(request.getParameter("ppbm"));
	String zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
	
	String clzt=cf.executeQuery("select clzt from jc_zczjx where zjxbh='"+zjxbh+"'");
	if (!clzt.equals("00"))
	{
		out.println("<BR>错误，不能再进行修改！增减项单已完成");
		return;
	}
%>

<body bgcolor="#FFFFFF" onload="selectform.jc_zcjgb_xh.select()">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">增加 标准项目（订单编号：<%=ddbh%>，增减项编号：<%=zjxbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Jc_zcjgbCxList.jsp" name="selectform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">
                <input type="hidden" name="ddbh" size="20"  value="<%=ddbh%>">
                <input type="hidden" name="zjxbh" size="20"  value="<%=zjxbh%>">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">结果排序</td>
              <td width="32%">
                <select name="jgpx" style="FONT-SIZE:12PX;WIDTH:152PX">
				 <OPTION  value=",jc_zcjgb.zcbm">主材编码</OPTION>
				 <OPTION  value=",jc_zcjgb.zclbbm,jc_zcjgb.xh,jc_zcjgb.zcbm">类别系列，型号</OPTION>
				 <OPTION  value=",jc_zcjgb.zclbbm,jc_zcjgb.xh,jc_zcjgb.gg,jc_zcjgb.zcbm">类别系列，型号，规格</OPTION>
				 <OPTION  value=",jc_zcjgb.xh,jc_zcjgb.gg,jc_zcjgb.zcbm" selected>型号，规格</OPTION>
				 <OPTION  value=",jc_zcjgb.xh,jc_zcjgb.zcbm">型号</OPTION>
                </select>
              </td>
              <td width="17%" align="right">型号是否模糊查询</td>
              <td width="33%">
                <input type="radio" name="mhcx" value="Y" checked>
                模糊查询 
                <input type="radio" name="mhcx" value="N">
                精确查询 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF">型号</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <input type="text" name="jc_zcjgb_xh" size="20" maxlength="100"  onKeyUp="singleAdd(selectform)">
              </td>
              <td rowspan="7" align="center" bgcolor="#CCCCFF"> 
                <p>被选型号</p>
                <p> 
                  <input type="button"  value="增加" onClick="add(selectform)" name="button" >
                </p>
                <p> 
                  <input type="button"  value="删除" onClick="remove(selectform)" name="button2" >
                </p>
              </td>
              <td rowspan="7" align="center" valign="middle" bgcolor="#CCCCFF"> 
                <select name="xhlist" size="13" multiple style="FONT-SIZE:12px;WIDTH:180px">
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">主材大类</td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_zcdlbm" value="<%=zcdlbm%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">子品牌</td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_dwbh" value="<%=ppbm%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">是否有促销</td>
              <td width="32%"><%
	cf.radioToken(out, "sfycx","N+没促销&Y+有促销","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">是否有货</td>
              <td width="32%"> 
                <input type="radio" name="sfyh" value="Y">
                有货 
                <input type="radio" name="sfyh" value="N">
                无货</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">主材编码</td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_zcbm" size="20" maxlength="7" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">主材名称</td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_zcmc" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">类别/系列</td>
              <td colspan="3"> 
                <input type="text" name="jc_zcjgb_zclbbm" value="" size="71" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">规格</td>
              <td colspan="3"> 
                <input type="text" name="jc_zcjgb_gg" size="71" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">颜色</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_zcysbm" value="" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">计量单位</div>
              </td>
              <td width="33%"> 
                <select name="jc_zcjgb_jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">市场统一限价 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_lsj" size="20" maxlength="9" >
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_lsj2" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">优惠价 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_yhj" size="20" maxlength="9" >
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_yhj2" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">是否包含配件</div>
              </td>
              <td width="32%"><%
	cf.radioToken(out, "jc_zcjgb_sfbhpj","Y+包含&N+不包含","");
%> </td>
              <td width="17%"> 
                <div align="right">照片名称</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_zp" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">配件套数 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_pjts" size="20" maxlength="8" >
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_pjts2" size="20" maxlength="8" >
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

	if(!(isFloat(FormName.jc_zcjgb_lsj, "市场统一限价"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcjgb_lsj2, "市场统一限价"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcjgb_yhj, "优惠价"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcjgb_yhj2, "优惠价"))) {
		return false;
	}
	if(!(isNumber(FormName.jc_zcjgb_pjts, "配件套数"))) {
		return false;
	}
	if(!(isNumber(FormName.jc_zcjgb_pjts2, "配件套数"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
