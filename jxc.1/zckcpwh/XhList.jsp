<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>����չ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String clxlmc=cf.GB2Uni(cf.getParameter(request,"clxlmc"));
String ppmc=cf.GB2Uni(cf.getParameter(request,"ppmc"));
String dqbm=request.getParameter("dqbm");
%>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style="FONT-SIZE:16"  cellpadding="2" cellspacing="2">
  <tr>
    <td>
      <div align="center">
	  <p>���/ϵ�У�<%=clxlmc%>����Ʒ�ƣ�<%=ppmc%>�� </p>
      </div>
    </td>
  </tr>
<%
String cllbbm=null;
int count=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jxc_clbm.cllbbm,count(*)";
	ls_sql+=" from  jxc_clbm,jxc_cljgb";
	ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm ";
	ls_sql+=" and jxc_clbm.ppmc='"+ppmc+"' and jxc_clbm.clxlbm='"+clxlmc+"' and jxc_cljgb.dqbm='"+dqbm+"'";
	ls_sql+=" and jxc_clbm.cllb='0'";//0�����ģ�1������
	ls_sql+=" and jxc_cljgb.xsfs!='1'";//1������Ʒ��2���ֻ����ۣ�3���ڻ����ۣ�4����������
	ls_sql+=" group by jxc_clbm.cllbbm";
	ls_sql+=" order by jxc_clbm.cllbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		cllbbm=cf.fillNull(rs.getString("cllbbm"));
		count=rs.getInt(2);
%>
  <tr>
    <td align="center" height="30"><A HREF="cpList.jsp?dqbm=<%=dqbm%>&clxlmc=<%=clxlmc%>&ppmc=<%=ppmc%>&cllbbm=<%=cllbbm%>" ><%=cllbbm%>����<%=count%>���ͺſ�ѡ��</A></td>
  </tr>
<%
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
</table>
</body>
</html>
