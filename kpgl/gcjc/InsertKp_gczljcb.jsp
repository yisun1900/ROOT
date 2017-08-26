<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=request.getParameter("khbh");
String yhdlm=(String)session.getAttribute("yhdlm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
//考评序号
String kpxh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sjs=null;
String sgd=null;
String zjxm=null;
String sgbz=null;

try {
	conn=cf.getConnection();

//考评序号
	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  kp_gczljcb";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();

	kpxh=khbh+cf.addZero(count+1,2);

	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sjs,sgdmc,zjxm,sgbz";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
	}
	ps.close();
	rs.close();


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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入数据</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertKp_gczljcb.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#000099">客户编号</font></div>
              </td>
              <td width="35%"><%=khbh%> </td>
              <td width="15%"> 
                <div align="right"><font color="#000099">实开工日期</font></div>
              </td>
              <td width="35%"><%=sjkgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#000099">客户姓名</font></td>
              <td width="35%"><%=khxm%></td>
              <td width="15%" align="right"><font color="#000099">联系方式</font></td>
              <td width="35%"><%=lxfs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#000099">房屋地址</font></td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#000099">设计师</font></td>
              <td width="35%"><%=sjs%></td>
              <td width="15%" align="right"><font color="#000099">施工队</font></td>
              <td width="35%"><%=sgd%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#000099">质检姓名</font></td>
              <td width="35%"><%=zjxm%></td>
              <td width="15%" align="right"><font color="#000099">施工班组</font></td>
              <td width="35%"><%=sgbz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#000099">考评序号</font></td>
              <td width="35%"> 
                <input type="text" name="kpxh" value="<%=kpxh%>" size="20" maxlength="9" readonly>
                <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>
              </td>
              <td width="15%" align="right">考评类型</td>
              <td width="35%"> 
                <select name="kplx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">质检员</option>
                  <option value="2">巡检员</option>
                  <option value="3">公司抽查</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"> 
                <div align="right">考评人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kpr" value="" size="20" maxlength="20">
              </td>
              <td width="15%"> 
                <div align="right">考评时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kpsj" value="" size="20" maxlength="10">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">录入人</td>
              <td width="35%"> 
                <input type="text" name="lrr" value="<%=yhdlm%>" size="20" maxlength="20" readonly>
              </td>
              <td width="15%" align="right">录入时间</td>
              <td width="35%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="55" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="button"  value="录入考评项目" onClick="window.open('yrk_lrxxmain.jsp?kpxh=<%=kpxh%>')" name="lr" disabled=true >
                <input type="button"  value="查看考评项目" onClick="window.open('Kp_jcmxbList.jsp?kpxh=<%=kpxh%>')" name="cx" disabled=true>
                <input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.kpxh)=="") {
		alert("请输入[考评序号]！");
		FormName.kpxh.focus();
		return false;
	}

	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.kplx)=="") {
		alert("请输入[考评类型]！");
		FormName.kplx.focus();
		return false;
	}
	if(	javaTrim(FormName.kpr)=="") {
		alert("请输入[考评人]！");
		FormName.kpr.focus();
		return false;
	}
	if(	javaTrim(FormName.kpsj)=="") {
		alert("请输入[考评时间]！");
		FormName.kpsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kpsj, "考评时间"))) {
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
	FormName.submit();
	FormName.lr.disabled=false;
	FormName.cx.disabled=false;
	return true;
}
//-->
</SCRIPT>
