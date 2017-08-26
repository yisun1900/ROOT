<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String jjsjs=null;
String pdgc=null;
String xcmgc=null;
String pgcr=null;
String pgcsj=null;
String pgcsm=null;
String fgsbh=null;
String khbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
double htze=0;
double wdzje=0;
String fkfs=null;

double jjzkl=0;
String dzyy=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double fkje=0;

try {
	conn=cf.getConnection();

	ls_sql="select jjsjs,pdgc,xcmgc,jc_jjdd.pgcr,jc_jjdd.pgcsj,jc_jjdd.pgcsm,fgsbh,khbh,htze,wdzje,fkfs,jjzkl,dzyy";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jjsjs=cf.fillNull(rs.getString("jjsjs"));
		pdgc=cf.fillNull(rs.getString("pdgc"));
		xcmgc=cf.fillNull(rs.getString("xcmgc"));
		pgcr=cf.fillNull(rs.getString("pgcr"));
		pgcsj=cf.fillNull(rs.getDate("pgcsj"));
		pgcsm=cf.fillNull(rs.getString("pgcsm"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		htze=rs.getDouble("htze");
		wdzje=rs.getDouble("wdzje");
		fkfs=cf.fillNull(rs.getString("fkfs"));
		jjzkl=rs.getDouble("jjzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
	}
	rs.close();
	ps.close();

	ls_sql="select hth,khxm,fwdz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
	}
	rs.close();
	ps.close();

	//付款
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and ddbh='"+ddbh+"' and scbz='N' and fklxbm='24'";//24：家具
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkje=rs.getDouble(1);
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
<title>修改工厂</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveXgPdJc_jjdd.jsp" name="insertform" >
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">家具订单处理--修改工厂（订单编号：<%=ddbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#000099">客户编号</font></td>
              <td><%=khbh%></td>
              <td align="right"><font color="#000099">合同号</font></td>
              <td><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#000099">客户姓名</font></td>
              <td><%=khxm%></td>
              <td align="right"><font color="#000099">房屋地址</font></td>
              <td><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#000099"><b>未打折金额</b></font></td>
              <td><%=wdzje%></td>
              <td align="right"><font color="#000099"><b>合同总额</b></font></td>
              <td><%=htze%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">订单折扣</font></td>
              <td><%=jjzkl%></td>
              <td align="right">&nbsp;</td>
              <td valign="top">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">打折原因</font></td>
              <td colspan="3"><%=dzyy%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><b><font color="#CC0000">付款方式</font></b></td>
              <td><b><font color="#CC0000">
                <%
	cf.selectToken(out,"1+已交橱柜款&2+橱柜预付款&3+主材预付款&4+家具预付款&5+木门预付款&9+未付款",fkfs,true);
%>
              </font></b></td>
              <td align="right"><b><font color="#CC0000">付款金额</font></b></td>
              <td><b><font color="#CC0000"><%=fkje%></font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF">家具工厂</td>
              <td width="32%"> 
                <select name="pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	String sql="select sq_gysxx.gysbh,sq_gysxx.gysmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+fgsbh+"' and sq_gysxx.gyslb='3' order by sq_gysxx.gysmc";
	cf.selectItem(out,sql,pdgc);
%> 
                </select>              </td>
              <td width="17%" align="right">型材门工厂</td>
              <td width="33%"> 
                <select name="xcmgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	sql="select sq_gysxx.gysbh,sq_gysxx.gysmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+fgsbh+"' and sq_gysxx.gyslb='3' order by sq_gysxx.gysmc";
	cf.selectItem(out,sql,xcmgc);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF">派单人</td>
              <td width="32%"> 
                <input type="text" name="pgcr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>              </td>
              <td width="17%" align="right">派单时间</td>
              <td width="33%"> 
                <input type="text" name="pgcsj" size="20" maxlength="20"  value="<%=cf.today()%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">派单说明</td>
              <td colspan="3"> 
                <textarea name="pgcsm" cols="71" rows="3"><%=pgcsm%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" height="51"> 
                <div align="center"> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset" name="Reset" value="重输">
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                </div>              </td>
            </tr>
          </table>

	  
	  </div>
    </td>
  </tr>
</table>
</form>
</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if (FormName.pdgc.value=="" && FormName.xcmgc.value=="")
	{
		alert("请选择[家具工厂]或[型材门工厂]！");
		FormName.pdgc.focus();
		return false;
	}
	if(	javaTrim(FormName.pgcr)=="") {
		alert("请输入[派单人]！");
		FormName.pgcr.focus();
		return false;
	}
	if(	javaTrim(FormName.pgcsj)=="") {
		alert("请输入[派单时间]！");
		FormName.pgcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pgcsj, "派单时间"))) {
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
