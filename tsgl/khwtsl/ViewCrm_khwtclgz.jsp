<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_khwtclgz_khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_qyrq=null;
String crm_khxx_dwbh=null;
String crm_khxx_sgd=null;
String crm_khxx_zjxm=null;
String crm_khwtclgz_wtbh=null;
String dm_wtflbm_wtflmc=null;
String crm_khwtclgz_wtsm=null;
String crm_khwtclgz_yqjjsj=null;
String crm_khwtclgz_slr=null;
String crm_khwtclgz_slsj=null;
String crm_khwtclgz_slbm=null;
String crm_khwtclgz_clzt=null;
String crm_khwtclgz_clr=null;
String crm_khwtclgz_clkssj=null;
String crm_khwtclgz_cljssj=null;
String crm_khwtclgz_clqk=null;
String crm_khwtclgz_bz=null;
String wherecrm_khwtclgz_wtbh=null;
wherecrm_khwtclgz_wtbh=cf.GB2Uni(request.getParameter("wtbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_khwtclgz.khbh as crm_khwtclgz_khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.dwbh as crm_khxx_dwbh,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,crm_khwtclgz.wtbh as crm_khwtclgz_wtbh,dm_wtflbm.wtflmc as dm_wtflbm_wtflmc,crm_khwtclgz.wtsm as crm_khwtclgz_wtsm,crm_khwtclgz.yqjjsj as crm_khwtclgz_yqjjsj,crm_khwtclgz.slr as crm_khwtclgz_slr,crm_khwtclgz.slsj as crm_khwtclgz_slsj,crm_khwtclgz.slbm as crm_khwtclgz_slbm,crm_khwtclgz.clzt as crm_khwtclgz_clzt,crm_khwtclgz.clr as crm_khwtclgz_clr,crm_khwtclgz.clkssj as crm_khwtclgz_clkssj,crm_khwtclgz.cljssj as crm_khwtclgz_cljssj,crm_khwtclgz.clqk as crm_khwtclgz_clqk,crm_khwtclgz.bz as crm_khwtclgz_bz ";
	ls_sql+=" from  crm_khwtclgz,crm_khxx,dm_wtflbm";
	ls_sql+=" where crm_khwtclgz.wtflbm=dm_wtflbm.wtflbm(+) and crm_khwtclgz.khbh=crm_khxx.khbh and  (crm_khwtclgz.wtbh='"+wherecrm_khwtclgz_wtbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		crm_khwtclgz_khbh=cf.fillNull(rs.getString("crm_khwtclgz_khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_qyrq=cf.fillNull(rs.getDate("crm_khxx_qyrq"));
		crm_khxx_dwbh=cf.fillNull(rs.getString("crm_khxx_dwbh"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		crm_khwtclgz_wtbh=cf.fillNull(rs.getString("crm_khwtclgz_wtbh"));
		dm_wtflbm_wtflmc=cf.fillNull(rs.getString("dm_wtflbm_wtflmc"));
		crm_khwtclgz_wtsm=cf.fillNull(rs.getString("crm_khwtclgz_wtsm"));
		crm_khwtclgz_yqjjsj=cf.fillNull(rs.getDate("crm_khwtclgz_yqjjsj"));
		crm_khwtclgz_slr=cf.fillNull(rs.getString("crm_khwtclgz_slr"));
		crm_khwtclgz_slsj=cf.fillNull(rs.getDate("crm_khwtclgz_slsj"));
		crm_khwtclgz_slbm=cf.fillNull(rs.getString("crm_khwtclgz_slbm"));
		crm_khwtclgz_clzt=cf.fillNull(rs.getString("crm_khwtclgz_clzt"));
		crm_khwtclgz_clr=cf.fillNull(rs.getString("crm_khwtclgz_clr"));
		crm_khwtclgz_clkssj=cf.fillNull(rs.getDate("crm_khwtclgz_clkssj"));
		crm_khwtclgz_cljssj=cf.fillNull(rs.getDate("crm_khwtclgz_cljssj"));
		crm_khwtclgz_clqk=cf.fillNull(rs.getString("crm_khwtclgz_clqk"));
		crm_khwtclgz_bz=cf.fillNull(rs.getString("crm_khwtclgz_bz"));
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
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 客户问题处理跟踪（问题编号：<%=crm_khwtclgz_wtbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="16%"> 
              <div align="right">客户编号</div>
            </td>
            <td width="34%"> <%=crm_khwtclgz_khbh%> </td>
            <td width="17%"> 
              <div align="right">合同号</div>
            </td>
            <td width="33%"><%=crm_khxx_hth%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="16%" align="right">客户姓名</td>
            <td width="34%"><%=crm_khxx_khxm%>（<%=crm_khxx_lxfs%>）</td>
            <td width="17%" align="right">房屋地址</td>
            <td width="33%"><%=crm_khxx_fwdz%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="16%"> 
              <div align="right">签约店面</div>
            </td>
            <td width="34%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh",crm_khxx_dwbh,true);
%> </td>
            <td width="17%"> 
              <div align="right">设计师</div>
            </td>
            <td width="33%"> <%=crm_khxx_sjs%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="16%"> 
              <div align="right">施工队</div>
            </td>
            <td width="34%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc",crm_khxx_sgd,true);
%> </td>
            <td width="17%"> 
              <div align="right">质检</div>
            </td>
            <td width="33%"> <%=crm_khxx_zjxm%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="16%"> 
              <div align="right">签约日期</div>
            </td>
            <td width="34%"><%=crm_khxx_qyrq%> </td>
            <td width="17%"> 
              <div align="right">问题分类</div>
            </td>
            <td width="33%"> <%=dm_wtflbm_wtflmc%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="16%" align="right">问题说明</td>
            <td colspan="3"><%=crm_khwtclgz_wtsm%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="16%"> 
              <div align="right">要求解决时间</div>
            </td>
            <td width="34%"><%=crm_khwtclgz_yqjjsj%> </td>
            <td width="17%"> 
              <div align="right">客服受理时间</div>
            </td>
            <td width="33%"><%=crm_khwtclgz_slsj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="16%"> 
              <div align="right">客服受理人</div>
            </td>
            <td width="34%"> <%=crm_khwtclgz_slr%> </td>
            <td width="17%"> 
              <div align="right">录入部门</div>
            </td>
            <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by dwbh",crm_khwtclgz_slbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="16%"> 
              <div align="right">处理人</div>
            </td>
            <td width="34%"> <%=crm_khwtclgz_clr%> </td>
            <td width="17%"> 
              <div align="right">处理状态</div>
            </td>
            <td width="33%"><%
	cf.selectToken(out,"1+未处理&2+在处理&3+已解决",crm_khwtclgz_clzt,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="16%"> 
              <div align="right">处理开始时间</div>
            </td>
            <td width="34%"><%=crm_khwtclgz_clkssj%> </td>
            <td width="17%"> 
              <div align="right">处理结束时间</div>
            </td>
            <td width="33%"><%=crm_khwtclgz_cljssj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="16%" align="right">处理情况</td>
            <td colspan="3"><%=crm_khwtclgz_clqk%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="16%" align="right">备注</td>
            <td colspan="3"><%=crm_khwtclgz_bz%></td>
          </tr>
        </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
