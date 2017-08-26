<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fbfw=null;
String xz_gwgl_gwbh=null;
String xz_gwgl_gwmc=null;
String xz_gwgl_gwnr=null;
String xz_gwgl_gwfj=null;
String xz_gwgl_fbsj=null;
String xz_gwgl_fbr=null;
String xz_gwgl_lrr=null;
String xz_gwgl_fbbm=null;
String fbfgs=null;
String xz_gwgl_lrsj=null;
String xz_gwgl_bz=null;
String wherexz_gwgl_gwbh=null;
wherexz_gwgl_gwbh=request.getParameter("gwbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select DECODE(fbfw,'1','本公司','2','集团') fbfw,xz_gwgl.gwbh as xz_gwgl_gwbh,xz_gwgl.gwmc as xz_gwgl_gwmc,xz_gwgl.gwnr as xz_gwgl_gwnr,xz_gwgl.gwfj as xz_gwgl_gwfj,xz_gwgl.fbsj as xz_gwgl_fbsj,xz_gwgl.fbr as xz_gwgl_fbr,xz_gwgl.lrr as xz_gwgl_lrr,a.dwmc as xz_gwgl_fbbm,b.dwmc as fbfgs,xz_gwgl.lrsj as xz_gwgl_lrsj,xz_gwgl.bz as xz_gwgl_bz ";
	ls_sql+=" from  sq_dwxx a,sq_dwxx b,xz_gwgl";
	ls_sql+="  where xz_gwgl.fbbm=a.dwbh and xz_gwgl.fbfgs=b.dwbh and  (xz_gwgl.gwbh='"+wherexz_gwgl_gwbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fbfw=cf.fillNull(rs.getString("fbfw"));
		xz_gwgl_gwbh=cf.fillNull(rs.getString("xz_gwgl_gwbh"));
		xz_gwgl_gwmc=cf.fillNull(rs.getString("xz_gwgl_gwmc"));
		xz_gwgl_gwnr=cf.fillNull(rs.getString("xz_gwgl_gwnr"));
		xz_gwgl_gwfj=cf.fillNull(rs.getString("xz_gwgl_gwfj"));
		xz_gwgl_fbsj=cf.fillNull(rs.getDate("xz_gwgl_fbsj"));
		xz_gwgl_fbr=cf.fillNull(rs.getString("xz_gwgl_fbr"));
		xz_gwgl_lrr=cf.fillNull(rs.getString("xz_gwgl_lrr"));
		xz_gwgl_fbbm=cf.fillNull(rs.getString("xz_gwgl_fbbm"));
		fbfgs=cf.fillNull(rs.getString("fbfgs"));
		xz_gwgl_lrsj=cf.fillNull(rs.getDate("xz_gwgl_lrsj"));
		xz_gwgl_bz=cf.fillNull(rs.getString("xz_gwgl_bz"));
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
      <div align="center"> 公文编号：<%=xz_gwgl_gwbh%></div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right"><b>公文名称</b></td>
            <td width="35%"><%=xz_gwgl_gwmc%></td>
            <td width="17%" align="right">发布范围</td>
            <td width="33%"><%=fbfw%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right"><b>发布部门</b></td>
            <td width="35%"><%=xz_gwgl_fbbm%></td>
            <td width="17%" align="right">发布分公司</td>
            <td width="33%"><%=fbfgs%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right"><b>发布人</b></td>
            <td width="35%"><%=xz_gwgl_fbr%></td>
            <td width="17%" align="right"><b>发布时间</b></td>
            <td width="33%"><%=xz_gwgl_fbsj%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right"><b>录入人</b></div>
            </td>
            <td width="35%"> <%=xz_gwgl_lrr%> </td>
            <td width="17%"> 
              <div align="right"><b>录入时间</b></div>
            </td>
            <td width="33%"><%=xz_gwgl_lrsj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right"><b>公文附件</b></td>
            <td colspan="3"><a href="/xz/gwgl/file/<%=xz_gwgl_gwfj%>" >查看附件：<%=xz_gwgl_gwfj%></a></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right"><b>公文内容</b></div>
            </td>
            <td colspan="3"><%=xz_gwgl_gwnr%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right"><b>备注</b></div>
            </td>
            <td colspan="3"><%=xz_gwgl_bz%> </td>
          </tr>
        </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
