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
String ysbm=null;
String qhjgqjbm=null;
String mmdj=null;
double yksmjjl=0;
String dqbm=null;
String wheremmdglxbm=cf.GB2Uni(request.getParameter("mmdglxbm"));
String whereysbm=cf.GB2Uni(request.getParameter("ysbm"));
String whereqhjgqjbm=cf.GB2Uni(request.getParameter("qhjgqjbm"));
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select mmdglxbm,ysbm,qhjgqjbm,mmdj,yksmjjl,dqbm ";
	ls_sql+=" from  jc_mtbjb";
	ls_sql+=" where mmdglxbm='"+wheremmdglxbm+"' and ysbm='"+whereysbm+"' and qhjgqjbm='"+whereqhjgqjbm+"' and dqbm='"+wheredqbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmdglxbm=cf.fillNull(rs.getString("mmdglxbm"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		qhjgqjbm=cf.fillNull(rs.getString("qhjgqjbm"));
		mmdj=cf.fillNull(rs.getString("mmdj"));
		yksmjjl=rs.getDouble("yksmjjl");
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
<%
String str=cf.getItemData("select qhjgqjbm,qhjgqj,mmdglxbm from jdm_qhjgqj  order by mmdglxbm,qhjgqjbm");
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

<form method="post" action="SaveEditJc_mtbjb.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>木门订购类型</div>
              </td>
              <td width="32%"> 
                <select name="mmdglxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(mmdglxbm,qhjgqjbm,<%=str%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmdglxbm,mmdglxmc from jc_mmdglx where jjfs in('12','13','14','15') order by mmdglxbm",mmdglxbm);
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right"></div>
              </td>
              <td width="34%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>材质</td>
              <td colspan="3">
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:510PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmczbm,mmczmc from jdm_mmczbm order by mmczbm",ysbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>墙厚价格区间</div>
              </td>
              <td width="32%"> 
                <select name="qhjgqjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select qhjgqjbm,qhjgqj from jdm_qhjgqj where mmdglxbm='"+mmdglxbm+"' order by qhjgqjbm",qhjgqjbm);
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right"><font color="#FF0000">*</font>每米单价</div>
              </td>
              <td width="34%"> 
                <input type="text" name="mmdj" size="20" maxlength="17"  value="<%=mmdj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>松木集成材加价率</td>
              <td width="32%"> 
                <input type="text" name="yksmjjl" value="<%=yksmjjl%>" size="10" maxlength="17" >
              倍数              </td>
              <td width="16%">&nbsp;</td>
              <td width="34%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">录入人</font></div>
              </td>
              <td width="32%"> 
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
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">录入部门</font></td>
              <td width="32%"> 
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
            <input type="hidden" name="wheremmdglxbm"  value="<%=wheremmdglxbm%>" >
            <input type="hidden" name="whereysbm"  value="<%=whereysbm%>" >
            <input type="hidden" name="whereqhjgqjbm"  value="<%=whereqhjgqjbm%>" >
            <input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
            <tr align="center"> 
              <td colspan="4" height="2"> 
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
	if(	javaTrim(FormName.mmdglxbm)=="") {
		alert("请选择[木门订购类型]！");
		FormName.mmdglxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ysbm)=="") {
		alert("请选择[材质]！");
		FormName.ysbm.focus();
		return false;
	}
	if(	javaTrim(FormName.qhjgqjbm)=="") {
		alert("请选择[墙厚价格区间]！");
		FormName.qhjgqjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mmdj)=="") {
		alert("请输入[每米单价]！");
		FormName.mmdj.focus();
		return false;
	}
	if(!(isFloat(FormName.mmdj, "每米单价"))) {
		return false;
	}
	if(	javaTrim(FormName.yksmjjl)=="") {
		alert("请输入[松木集成材加价率]！");
		FormName.yksmjjl.focus();
		return false;
	}
	if(!(isFloat(FormName.yksmjjl, "松木集成材加价率"))) {
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
