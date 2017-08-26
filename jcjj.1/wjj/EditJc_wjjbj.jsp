<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String yhjs=(String)session.getAttribute("yhjs");
	String lrr=(String)session.getAttribute("yhmc");
	String lrbm=(String)session.getAttribute("dwbh");
%>
<%

String wjjbm=null;
String wjmc=null;
String xinghao=null;
String jldw=null;
String dj=null;
String dwbh=null;
String wjazwzbm=null;
String bz=null;
String dqbm=null;
String xh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select wjjbm,wjmc,xinghao,jldw,dj,dwbh,bz,wjazwzbm,dqbm ";
	ls_sql+=" from  jc_wjjbj";
	ls_sql+=" where  (xh="+xh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wjjbm=cf.fillNull(rs.getString("wjjbm"));
		wjmc=cf.fillNull(rs.getString("wjmc"));
		xinghao=cf.fillNull(rs.getString("xinghao"));
		jldw=cf.fillNull(rs.getString("jldw"));
		dj=cf.fillNull(rs.getString("dj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		bz=cf.fillNull(rs.getString("bz"));
		wjazwzbm=cf.fillNull(rs.getString("wjazwzbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改五金件报价（录入序号：<%=xh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%"> 
      <div align="center">

<form method="post" action="" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#FF0000">*</font>五金类别</div>
              </td>
              <td width="34%"> 
                <select name="wjjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select wjjbm,wjjmc from jdm_wjjbm order by wjjbm",wjjbm);
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right"></div>
              </td>
              <td width="34%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0000">*</font><font color="#0000FF">五金名称</font></td>
              <td colspan="3"> 
                <input type="text" name="wjmc" value="<%=wjmc%>" size="73" maxlength="50" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">型号</td>
              <td colspan="3"> 
                <input type="text" name="xinghao" size="73" maxlength="50"  value="<%=xinghao%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#FF0000">*</font>计量单位</div>
              </td>
              <td width="34%"> 
                <input type="text" name="jldw" size="20" maxlength="20"  value="<%=jldw%>" >
              </td>
              <td width="16%"> 
                <div align="right"><font color="#FF0000">*</font>单价</div>
              </td>
              <td width="34%"> 
                <input type="text" name="dj" size="20" maxlength="9"  value="<%=dj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">供应商</td>
              <td width="34%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='1' order by gysmc",dwbh);
%> 
                </select>
              </td>
              <td width="16%" align="right">安装位置</td>
              <td width="34%"> 
                <select name="wjazwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select wjazwzbm,wjazwzmc from jdm_wjazwzbm order by wjazwzbm",wjazwzbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">录入人</font></div>
              </td>
              <td width="34%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
              </td>
              <td width="16%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">录入时间</font></div>
              </td>
              <td width="34%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">录入部门</font></td>
              <td width="34%"> 
                <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%> 
                </select>
              </td>
              <td width="16%" align="right"><font color="#FF0000">*</font><font color="#0000CC">所属地区</font></td>
              <td width="34%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm",dqbm);
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="xh"  value="<%=xh%>" >
            <tr align="center"> 
              <td colspan="4" > 
                <input type="button"  value="保存" onClick="f_do(editform)">
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.wjjbm)=="") {
		alert("请选择[五金类别]！");
		FormName.wjjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.wjmc)=="") {
		alert("请输入[五金名称]！");
		FormName.wjmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("请输入[计量单位]！");
		FormName.jldw.focus();
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

	
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="SaveEditJc_wjjbj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
