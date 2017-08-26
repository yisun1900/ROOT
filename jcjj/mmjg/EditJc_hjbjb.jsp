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

String mmdglxbm=null;
String kdjgqjbm=null;
String ysbm=null;
String dj=null;
String dqbm=null;
String wheremmdglxbm=cf.GB2Uni(request.getParameter("mmdglxbm"));
String wherekdjgqjbm=cf.GB2Uni(request.getParameter("kdjgqjbm"));
String whereysbm=cf.GB2Uni(request.getParameter("ysbm"));
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select mmdglxbm,kdjgqjbm,ysbm,dj,dqbm ";
	ls_sql+=" from  jc_hjbjb";
	ls_sql+=" where mmdglxbm='"+wheremmdglxbm+"' and kdjgqjbm='"+wherekdjgqjbm+"' and ysbm='"+whereysbm+"' and dqbm='"+wheredqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmdglxbm=cf.fillNull(rs.getString("mmdglxbm"));
		kdjgqjbm=cf.fillNull(rs.getString("kdjgqjbm"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		dj=cf.fillNull(rs.getString("dj"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_hjbjb.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>订购类型</div>
              </td>
              <td width="33%"> 
                <select name="mmdglxbm" style="FONT-SIZE:12PX;WIDTH:180PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmdglxbm,mmdglxmc from jc_mmdglx where jjfs in('43','44','45') order by mmdglxbm",mmdglxbm);
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>宽度价格区间</div>
              </td>
              <td width="33%"> 
                <select name="kdjgqjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kdjgqjbm,kdjgqj from jdm_kdjgqj order by kdjgqjbm",kdjgqjbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>材质</td>
              <td colspan="3">
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:520PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmczbm,mmczmc from jdm_mmczbm order by mmczbm",ysbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>单价</div>
              </td>
              <td width="33%">
                <input type="text" name="dj" size="20" maxlength="17"  value="<%=dj%>" >
              </td>
              <td width="17%"> 
                <div align="right"></div>
              </td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">录入人</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">录入时间</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">录入部门</font></td>
              <td width="33%"> 
                <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%> 
                </select>
              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC">所属地区</font></td>
              <td width="33%"> 
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
            <input type="hidden" name="wheremmdglxbm"  value="<%=wheremmdglxbm%>" >
            <input type="hidden" name="wherekdjgqjbm"  value="<%=wherekdjgqjbm%>" >
            <input type="hidden" name="whereysbm"  value="<%=whereysbm%>" >
            <input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
            <tr> 
              <td width="17%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="33%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
              </td>
              <td width="17%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="33%" height="2"> 
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
	if(	javaTrim(FormName.mmdglxbm)=="") {
		alert("请选择[订购类型]！");
		FormName.mmdglxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kdjgqjbm)=="") {
		alert("请选择[宽度价格区间]！");
		FormName.kdjgqjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ysbm)=="") {
		alert("请选择[材质]！");
		FormName.ysbm.focus();
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

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
