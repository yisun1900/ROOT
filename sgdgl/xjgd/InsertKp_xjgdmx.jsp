<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String xjjlh=request.getParameter("xjjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String zpml ="";

try {
	conn=cf.getConnection();

	ls_sql="select zpml";
	ls_sql+=" from  kp_xjgdjl";
	ls_sql+=" where xjjlh='"+xjjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zpml=rs.getString("zpml");
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14" >
  <tr>
    <td width="100%" height="4"> 
      <div align="center">录入处罚项（<font color="#0000CC">记录号：<%=xjjlh%></font>）<font color="#FF0000"><strong>(注意：可连续录入多个处罚项)</strong></font></div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertKp_xjgdmx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td bgcolor="#FFFFFF" align="right" width="18%"><font color="#CC0000">*</font>项目大类</td>
              <td width="32%"> 
                <select name="kpdlbm" style="FONT-SIZE:14PX;WIDTH:200PX" onChange="getKpxm(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kpdlbm,kpdlmc from kp_kpdlbm order by kpdlbm","");
%> 
                </select>
                <input type="hidden" name="xjjlh" value="<%=xjjlh%>" size="27" maxlength="8" readonly>
              </td>
              <td align="right" width="18%"><font color="#CC0000">*</font>检查项目</td>
              <td width="32%"> 
                <select name="kpxmbm" style="FONT-SIZE:14PX;WIDTH:200PX" onChange="getKpjg(insertform)">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" ><font color="#CC0000">*</font>违规分级</td>
              <td width="32%" height="2" valign="top"> 
                <select name="kpjg" style="FONT-SIZE:14PX;WIDTH:200PX" onChange="getKpcf(insertform)">
                  <option value=""></option>
                </select>
              </td>
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>违章次数              </td>
              <td width="32%"> 
                <input type="text" name="wzcs" value="" size="27" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000CC">扣分</font></td>
              <td width="32%"> 
                <input type="text" name="kf" value="" size="27" maxlength="16" readonly>
              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000CC">罚款</font></td>
              <td width="32%"> 
                <input type="text" name="sgdfk" value="" size="27" maxlength="16" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font><font color="#0000CC">扣除接单额百分比</font>              </td>
              <td width="32%"> 
                <input type="text" name="kcjdebl" value="" size="10" maxlength="16" readonly>
              % </td>
              <td width="18%" align="right"> 
                <font color="#0000CC">其它处罚</font>              </td>
              <td width="32%"> 
                <select name="kpcfbm" style="FONT-SIZE:14PX;WIDTH:200PX">
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td bgcolor="#FFFFFF" align="right" width="18%">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="79" rows="3" ></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  name="bc"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
                <input name="sczp" type="button" disabled onClick="f_sczp(insertform)"  value="上传照片">
                <input name="ckzp" type="button" disabled onClick="f_ckzp(insertform)"  value="查看照片">
                <input name="button" type="button" onClick="window.location='InsertKp_xjgdmx.jsp?xjjlh=<%=xjjlh%>'"  value="录入下一条"></td>
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

function getKpxm(FormName)
{               
	FormName.kpxmbm.length=1;  
	FormName.kpjg.length=1;  


	if(FormName.kpdlbm.value=="") 
	{
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?kpdlbm="+FormName.kpdlbm.value;
	parent.menu.aform.submit();

}                                                                                                                                                       

function getKpjg(FormName)
{               
	FormName.kpjg.length=1;  


	if(FormName.kpxmbm.value=="") 
	{
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?kpxmbm="+FormName.kpxmbm.value;
	parent.menu.aform.submit();

}                                                                                                                                                       

function getKpcf(FormName)
{               


	if(FormName.kpjg.value=="") 
	{
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?kpxmbm="+FormName.kpxmbm.value+"&kpjg="+FormName.kpjg.value;
	parent.menu.aform.submit();

}                                                                                                                                                       

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xjjlh)=="") {
		alert("请输入[检查记录号]！");
		FormName.xjjlh.focus();
		return false;
	}
	if(!(isNumber(FormName.xjjlh, "检查记录号"))) {
		return false;
	}
	if(	javaTrim(FormName.kpdlbm)=="") {
		alert("请选择[项目大类]！");
		FormName.kpdlbm.focus();
		return false;
	}
	if(FormName.kpxmbm.value=="") {
		alert("请选择[检查项目]！");
		FormName.kpxmbm.focus();
		return false;
	}
	if(FormName.kpjg.value=="") {
		alert("请选择[违规分级]！");
		FormName.kpjg.focus();
		return false;
	}

	if(	javaTrim(FormName.kf)=="") {
		alert("请选择[扣分]！");
		FormName.kf.focus();
		return false;
	}
	if(!(isFloat(FormName.kf, "扣分"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdfk)=="") {
		alert("请选择[罚款]！");
		FormName.sgdfk.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfk, "罚款"))) {
		return false;
	}
	if(	javaTrim(FormName.kcjdebl)=="") {
		alert("请选择[扣除接单额百分比]！");
		FormName.kcjdebl.focus();
		return false;
	}
	if(!(isFloat(FormName.kcjdebl, "扣除接单额百分比"))) {
		return false;
	}
	if (FormName.kcjdebl.value<0 || FormName.kcjdebl.value>100)
	{
		alert("错误！[扣除接单额百分比]应该在0和100之间！");
		FormName.kcjdebl.select();
		return false;
	}

	if(	javaTrim(FormName.wzcs)=="") {
		alert("请选择[违章次数]！");
		FormName.wzcs.focus();
		return false;
	}
	if(!(isFloat(FormName.wzcs, "违章次数"))) {
		return false;
	}

	FormName.submit();
	FormName.bc.disabled=true;
	FormName.sczp.disabled=false;
	FormName.ckzp.disabled=false;
	return true;
}

function f_sczp(FormName)//参数FormName:Form的名称
{
	if(new RegExp('Linux').test(navigator.platform.toString()))
	{
		var urlStr="XmloadFilePad.jsp?xjjlh=<%=xjjlh%>&lx=2&zpgjz="+encodeURI(FormName.kpxmbm.value)+"&zpml=<%=zpml%>&zpsm="+encodeURI(FormName.kpxmbm.options[FormName.kpxmbm.selectedIndex].text);
		window.open(urlStr);
	}
	else
	{
		var urlStr="XmloadFile.jsp?xjjlh=<%=xjjlh%>&lx=2&zpgjz="+FormName.kpxmbm.value+"&zpml=<%=zpml%>&zpsm="+encodeURI(FormName.kpxmbm.options[FormName.kpxmbm.selectedIndex].text);
		window.open(urlStr);
	}
}

function f_ckzp(FormName)//参数FormName:Form的名称
{
	var urlStr="viewXmPhoto.jsp?xjjlh=<%=xjjlh%>&lx=2&zpgjz="+encodeURI(FormName.kpxmbm.value)+"&zpsm="+encodeURI(FormName.kpxmbm.options[FormName.kpxmbm.selectedIndex].text);
	window.open(urlStr);
}

//-->
</SCRIPT>
