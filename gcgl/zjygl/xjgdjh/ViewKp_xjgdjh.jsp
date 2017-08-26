<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kp_xjgdjh_jhbh=null;
String kp_xjgdjh_khbh=null;
String kp_xjgdjh_xjr=null;
String kp_xjgdjh_jhxjsj=null;
String kp_xjgdjh_xjlx=null;
String kp_xjgdjh_lrr=null;
String kp_xjgdjh_lrsj=null;
String kp_xjgdjh_wcbz=null;
String kdm_wwcyybm_wwcyy=null;
String kp_xjgdjh_shbz=null;
String kp_xjgdjh_bz=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_dwbh=null;
String crm_khxx_sgd=null;
String crm_khxx_zjxm=null;
String crm_khxx_sgbz=null;
String wherekp_xjgdjh_jhbh=null;
wherekp_xjgdjh_jhbh=cf.GB2Uni(request.getParameter("jhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select kp_xjgdjh.jhbh as kp_xjgdjh_jhbh,kp_xjgdjh.khbh as kp_xjgdjh_khbh,kp_xjgdjh.xjr as kp_xjgdjh_xjr,kp_xjgdjh.jhxjsj as kp_xjgdjh_jhxjsj,kp_xjgdjh.xjlx as kp_xjgdjh_xjlx,kp_xjgdjh.lrr as kp_xjgdjh_lrr,kp_xjgdjh.lrsj as kp_xjgdjh_lrsj,kp_xjgdjh.wcbz as kp_xjgdjh_wcbz,kdm_wwcyybm.wwcyy as kdm_wwcyybm_wwcyy,kp_xjgdjh.shbz as kp_xjgdjh_shbz,kp_xjgdjh.bz as kp_xjgdjh_bz,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.dwbh as crm_khxx_dwbh,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,crm_khxx.sgbz as crm_khxx_sgbz ";
	ls_sql+=" from  crm_khxx,kdm_wwcyybm,kp_xjgdjh";
	ls_sql+=" where kp_xjgdjh.wwcyybm=kdm_wwcyybm.wwcyybm(+) and kp_xjgdjh.khbh=crm_khxx.khbh and  (kp_xjgdjh.jhbh='"+wherekp_xjgdjh_jhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kp_xjgdjh_jhbh=cf.fillNull(rs.getString("kp_xjgdjh_jhbh"));
		kp_xjgdjh_khbh=cf.fillNull(rs.getString("kp_xjgdjh_khbh"));
		kp_xjgdjh_xjr=cf.fillNull(rs.getString("kp_xjgdjh_xjr"));
		kp_xjgdjh_jhxjsj=cf.fillNull(rs.getDate("kp_xjgdjh_jhxjsj"));
		kp_xjgdjh_xjlx=cf.fillNull(rs.getString("kp_xjgdjh_xjlx"));
		kp_xjgdjh_lrr=cf.fillNull(rs.getString("kp_xjgdjh_lrr"));
		kp_xjgdjh_lrsj=cf.fillNull(rs.getDate("kp_xjgdjh_lrsj"));
		kp_xjgdjh_wcbz=cf.fillNull(rs.getString("kp_xjgdjh_wcbz"));
		kdm_wwcyybm_wwcyy=cf.fillNull(rs.getString("kdm_wwcyybm_wwcyy"));
		kp_xjgdjh_shbz=cf.fillNull(rs.getString("kp_xjgdjh_shbz"));
		kp_xjgdjh_bz=cf.fillNull(rs.getString("kp_xjgdjh_bz"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_dwbh=cf.fillNull(rs.getString("crm_khxx_dwbh"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		crm_khxx_sgbz=cf.fillNull(rs.getString("crm_khxx_sgbz"));
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 巡检工地计划（计划编号：<%=kp_xjgdjh_jhbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">客户编号</div>
            </td>
            <td width="35%"><%=kp_xjgdjh_khbh%> </td>
            <td width="15%"> 
              <div align="right">合同号</div>
            </td>
            <td width="35%"><%=crm_khxx_hth%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">客户姓名</div>
            </td>
            <td width="35%"><%=crm_khxx_khxm%> </td>
            <td width="15%"> 
              <div align="right">联系方式</div>
            </td>
            <td width="35%"><%=crm_khxx_lxfs%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">房屋地址</div>
            </td>
            <td width="35%"> <%=crm_khxx_fwdz%> </td>
            <td width="15%"> 
              <div align="right">签约店面</div>
            </td>
            <td width="35%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh",crm_khxx_dwbh,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">设计师</div>
            </td>
            <td width="35%"><%=crm_khxx_sjs%> </td>
            <td width="15%"> 
              <div align="right">工程担当</div>
            </td>
            <td width="35%"><%=crm_khxx_zjxm%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">施工队</div>
            </td>
            <td width="35%"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc",crm_khxx_sgd,true);
%> </td>
            <td width="15%"> 
              <div align="right">班长</div>
            </td>
            <td width="35%"> <%=crm_khxx_sgbz%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">巡检人</div>
            </td>
            <td width="35%"> <%=kp_xjgdjh_xjr%> </td>
            <td width="15%"> 
              <div align="right">计划巡检时间</div>
            </td>
            <td width="35%"> <%=kp_xjgdjh_jhxjsj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">录入人</div>
            </td>
            <td width="35%"><%=kp_xjgdjh_lrr%> </td>
            <td width="15%"> 
              <div align="right">录入时间</div>
            </td>
            <td width="35%"><%=kp_xjgdjh_lrsj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">完成标志</div>
            </td>
            <td width="35%"><%
	cf.selectToken(out,"1+设置计划&2+完成计划&3+未完成",kp_xjgdjh_wcbz,true);
%> </td>
            <td width="15%"> 
              <div align="right">巡检类型</div>
            </td>
            <td width="35%"><%
	cf.selectToken(out,"1+常规巡检&2+临时巡检&9+其它",kp_xjgdjh_xjlx,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">未完成原因</div>
            </td>
            <td width="35%"> <%=kdm_wwcyybm_wwcyy%> </td>
            <td width="15%"> 
              <div align="right">审核标志</div>
            </td>
            <td width="35%"> <%
	cf.selectToken(out,"N+未审核&Y+已审核",kp_xjgdjh_shbz,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right">备注</td>
            <td colspan="3"><%=kp_xjgdjh_bz%></td>
          </tr>
        </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
