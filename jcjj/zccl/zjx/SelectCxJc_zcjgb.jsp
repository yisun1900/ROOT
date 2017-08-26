<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>
<%
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
	String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
	String dqbm=cf.executeQuery("select sq_dwxx.dqbm from jc_zcdd,crm_khxx,sq_dwxx where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh and jc_zcdd.ddbh='"+ddbh+"'");

	String ppbm=cf.GB2Uni(request.getParameter("ppbm"));
	String cldlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
	
	String clzt=cf.executeQuery("select clzt from jc_zczjx where zjxbh='"+zjxbh+"'");
	if (!clzt.equals("00"))
	{
		out.println("<BR>错误，不能再进行修改！增减项单已完成");
		return;
	}
%>


<body bgcolor="#FFFFFF" onLoad="selectform.jxc_clbm_xh.select()">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">增减项－查询型号（订单编号：<%=ddbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Jc_zcjgbCxList.jsp" name="selectform" >
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
              <td width="18%" align="right">每页显示数量</td>
              <td colspan="3"> 
                <input type="text" name="myxssl" size="7" maxlength="13" value="50">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">结果排序</td>
              <td width="32%"> 
                <select name="jgpx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <OPTION  value=",jxc_clbm.clbm">主材编码</OPTION>
                  <OPTION  value=",jxc_clbm.cllbbm,jxc_clbm.xh,jxc_clbm.clbm">类别系列，型号</OPTION>
                  <OPTION  value=",jxc_clbm.cllbbm,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.clbm">类别系列，型号，规格</OPTION>
                  <OPTION  value=",jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.clbm" selected>型号，规格</OPTION>
                  <OPTION  value=",jxc_clbm.xh,jxc_clbm.clbm">型号</OPTION>
                </select>              </td>
              <td width="17%" align="right">型号是否模糊查询</td>
              <td width="33%"> 
                <input type="radio" name="mhcx" value="Y" checked>
                模糊查询 
                <input type="radio" name="mhcx" value="N">
                精确查询 </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><strong><font color="#0000CC">是否推荐产品</font></strong></td>
              <td bgcolor="#CCCCFF"><input type="radio" name="sftjcp" value="Y">
是
  <input type="radio" name="sftjcp" value="N">
否</td>
              <td rowspan="10" align="center" bgcolor="#CCCCFF"> 
                <p>被选型号</p>
                <p> 
                  <input type="button"  value="增加" onClick="add(selectform)" name="button" >
                </p>
                <p> 
                  <input type="button"  value="删除" onClick="remove(selectform)" name="button2" >
                </p>              </td>
              <td rowspan="10" align="center" valign="middle" bgcolor="#CCCCFF"> 
                <select name="xhlist" size="16" multiple style="FONT-SIZE:12px;WIDTH:180px">
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF">型号</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <input type="text" name="jxc_clbm_xh" size="20" maxlength="100"  onKeyUp="singleAdd(selectform)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">内部编码</td>
              <td><input type="text" name="jxc_clbm_nbbm" size="20" maxlength="100"  ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">所属地区</font></td>
              <td width="32%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm",dqbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><span class="STYLE1">主材大类</span></td>
              <td width="32%"> 
                <input type="text" name="jxc_clbm_cldlbm" value="<%=cldlbm%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><span class="STYLE1">品牌</span></td>
              <td width="32%"> 
                <input type="text" name="jxc_clbm_ppmc" value="<%=ppbm%>" readonly>              </td>
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
                <input type="text" name="jxc_clbm_clbm" size="20" maxlength="7" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">主材名称</td>
              <td width="32%"> 
                <input type="text" name="jxc_clbm_clmc" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">类别/系列</td>
              <td width="32%"> 
                <input type="text" name="jxc_clbm_cllbbm" size="20" maxlength="100" >              </td>
              <td width="17%" align="right">规格</td>
              <td width="33%"> 
                <input type="text" name="jxc_clbm_gg" size="20" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                颜色              </td>
              <td width="32%"> 
                <input type="text" name="jxc_clbm_clysbm" value="" size="20" maxlength="20" >              </td>
              <td width="17%" align="right">照片名称</td>
              <td width="33%"><input type="text" name="jxc_clbm_zp" size="20" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> 是否包含配件 </td>
              <td><%
	cf.radioToken(out, "jxc_clbm_sfbhpj","Y+包含&N+不包含","");
%>              </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> 配件套数 从 </td>
              <td><input type="text" name="jxc_clbm_pjts" size="20" maxlength="8" >              </td>
              <td align="right"> 到 </td>
              <td><input type="text" name="jxc_clbm_pjts2" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="right">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                市场标价 从              </td>
              <td width="32%"> 
                <input type="text" name="jxc_cljgb_lsj" size="20" maxlength="9" >              </td>
              <td width="17%" align="right"> 
                到              </td>
              <td width="33%"> 
                <input type="text" name="jxc_cljgb_lsj2" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                销售价 从              </td>
              <td width="32%"> 
                <input type="text" name="jxc_cljgb_xsj" size="20" maxlength="9" >              </td>
              <td width="17%" align="right"> 
                到              </td>
              <td width="33%"> 
                <input type="text" name="jxc_cljgb_xsj2" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">计入活动比例 从</td>
              <td width="32%"> 
                <input type="text" name="cxhdbl" size="10" maxlength="10" >
                % </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="cxhdbl2" size="10" maxlength="10" >
                % </td>
            </tr>
        </table>
</form>

	  
	  
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
	if(	javaTrim(FormName.jxc_clbm_xh)=="") {
		alert("请输入[型号]！");
		FormName.jxc_clbm_xh.focus();
		return false;
	}

	if (isExisted(FormName.xhlist,FormName.jxc_clbm_xh.value)!=-1){        
		alert("此[型号]已被选择！");        
		FormName.jxc_clbm_xh.select() ;              
		return        
	}        
	var op1=document.createElement("OPTION");
	op1.value=FormName.jxc_clbm_xh.value;
	op1.text=FormName.xhlist.options.length+1+":"+FormName.jxc_clbm_xh.value;
	FormName.xhlist.add(op1);


	FormName.jxc_clbm_xh.value="" ;              
	FormName.jxc_clbm_xh.select() ;              
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jxc_clbm_cldlbm)=="") {
		alert("请选择[主材大类]！");
		FormName.jxc_clbm_cldlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jxc_clbm_ppmc)=="") {
		alert("请选择[品牌]！");
		FormName.jxc_clbm_ppmc.focus();
		return false;
	}

	for(i=0;i<FormName.xhlist.length;i++){                                                                         
		FormName.xhlist.options[i].selected = true;                                                                         
	}                                                                        


	if(!(isFloat(FormName.jxc_cljgb_lsj, "市场标价"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_cljgb_lsj2, "市场标价"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_cljgb_xsj, "销售价"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_cljgb_xsj2, "销售价"))) {
		return false;
	}
	if(!(isNumber(FormName.jxc_clbm_pjts, "配件套数"))) {
		return false;
	}
	if(!(isNumber(FormName.jxc_clbm_pjts2, "配件套数"))) {
		return false;
	}
	if(!(isFloat(FormName.cxhdbl, "计入活动比例"))) {
		return false;
	}
	if(!(isFloat(FormName.cxhdbl2, "计入活动比例"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
