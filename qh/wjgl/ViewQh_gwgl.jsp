<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fbfw=null;
String qh_gwgl_gwbh=null;
String qh_gwgl_gwmc=null;
String qh_gwgl_gwnr=null;
String qh_gwgl_gwfj=null;
String qh_gwgl_fbsj=null;
String qh_gwgl_fbr=null;
String qh_gwgl_lrr=null;
String qh_gwgl_fbbm=null;
String fbfgs=null;
String qh_gwgl_lrsj=null;
String qh_gwgl_bz=null;
String bt=null;
String fl=null;
String whereqh_gwgl_gwbh=null;
whereqh_gwgl_gwbh=request.getParameter("gwbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select bt,fl,DECODE(fbfw,'1','本公司','2','集团') fbfw,qh_gwgl.gwbh as qh_gwgl_gwbh,qh_gwgl.gwmc as qh_gwgl_gwmc,qh_gwgl.gwnr as qh_gwgl_gwnr,qh_gwgl.gwfj as qh_gwgl_gwfj,qh_gwgl.fbsj as qh_gwgl_fbsj,qh_gwgl.fbr as qh_gwgl_fbr,qh_gwgl.lrr as qh_gwgl_lrr,a.dwmc as qh_gwgl_fbbm,b.dwmc as fbfgs,qh_gwgl.lrsj as qh_gwgl_lrsj,qh_gwgl.bz as qh_gwgl_bz ";
	ls_sql+=" from  sq_dwxx a,sq_dwxx b,qh_gwgl";
	ls_sql+="  where qh_gwgl.fbbm=a.dwbh and qh_gwgl.fbfgs=b.dwbh and  (qh_gwgl.gwbh='"+whereqh_gwgl_gwbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bt=cf.fillNull(rs.getString("bt"));
		fl=cf.fillNull(rs.getString("fl"));
		fbfw=cf.fillNull(rs.getString("fbfw"));
		qh_gwgl_gwbh=cf.fillNull(rs.getString("qh_gwgl_gwbh"));
		qh_gwgl_gwmc=cf.fillNull(rs.getString("qh_gwgl_gwmc"));
		qh_gwgl_gwnr=cf.fillNull(rs.getString("qh_gwgl_gwnr"));
		qh_gwgl_gwfj=cf.fillNull(rs.getString("qh_gwgl_gwfj"));
		qh_gwgl_fbsj=cf.fillNull(rs.getDate("qh_gwgl_fbsj"));
		qh_gwgl_fbr=cf.fillNull(rs.getString("qh_gwgl_fbr"));
		qh_gwgl_lrr=cf.fillNull(rs.getString("qh_gwgl_lrr"));
		qh_gwgl_fbbm=cf.fillNull(rs.getString("qh_gwgl_fbbm"));
		fbfgs=cf.fillNull(rs.getString("fbfgs"));
		qh_gwgl_lrsj=cf.fillNull(rs.getDate("qh_gwgl_lrsj"));
		qh_gwgl_bz=cf.fillNull(rs.getString("qh_gwgl_bz"));
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
      <div align="center"> 公文编号：<%=qh_gwgl_gwbh%></div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right"><b>公文名称</b></td>
            <td width="35%"><%=qh_gwgl_gwmc%></td>
            <td width="17%" align="right">发布范围</td>
            <td width="33%"><%=fbfw%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right">标题</td>
            <td><%=bt%></td>
            <td align="right">分类</td>
            <td><%=fl%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right"><b>发布部门</b></td>
            <td width="35%"><%=qh_gwgl_fbbm%></td>
            <td width="17%" align="right">发布分公司</td>
            <td width="33%"><%=fbfgs%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right"><b>发布人</b></td>
            <td width="35%"><%=qh_gwgl_fbr%></td>
            <td width="17%" align="right"><b>发布时间</b></td>
            <td width="33%"><%=qh_gwgl_fbsj%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right"><b>录入人</b></div>            </td>
            <td width="35%"> <%=qh_gwgl_lrr%> </td>
            <td width="17%"> 
              <div align="right"><b>录入时间</b></div>            </td>
            <td width="33%"><%=qh_gwgl_lrsj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right"><b>公文附件</b></td>
            <td colspan="3"><a href="/qh/wjgl/file/<%=qh_gwgl_gwfj%>" >查看附件：<%=qh_gwgl_gwfj%></a></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right"><b>公文内容</b></div>            </td>
            <td colspan="3"><%=qh_gwgl_gwnr%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right"><b>备注</b></div>            </td>
            <td colspan="3"><%=qh_gwgl_bz%> </td>
          </tr>
        </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
