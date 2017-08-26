<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String txlx=cf.GB2Uni(request.getParameter("txlx"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="delete from crm_tstjlsb ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into crm_tstjlsb ( year,month,tslxbm,tsyybm,sl) ";
	ls_sql+=" select to_char(slsj,'YYYY'),to_char(slsj,'MM'),tslxbm,tsyybm,count(*)"; 
	ls_sql+=" from crm_tsjl";
	ls_sql+=" where crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" group by to_char(slsj,'YYYY'),to_char(slsj,'MM'),tslxbm,tsyybm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	out.println("���ɳɹ���");
/*
*/
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	out.println(ls_sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����Ͷ�߷���
  <BR>(<%=sjfw%>--<%=sjfw2%>)</font></B> 
  <BR> <BR> 
</CENTER>
<table border="0" width="100%" style='FONT-SIZE: 14px'>
  <tr>
    <td width="45%" valign="top"> 
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="10%">�·�</td>
          <td  width="30%">ԭ��</td>
          <td  width="10%">���� </td>
        </tr>
        <%
		//�����ʾ����
		
		int[] mark={3,1,2};//������ʾ������
		//0:��;1���ϲ��У���С�ƣ�2����ֵ�У���С�ơ��ܼƣ�3���ϲ��У���С�ƣ�4�����ϲ��У�5��������С������ʾ

		//��ȡ����
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_tsjl,dm_slfsbm ";
		ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm ";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

		String all=cf.executeQuery(ls_sql);
		
		ls_sql="SELECT month,tsyymc,sum(sl)";
		ls_sql+=" FROM crm_tstjlsb,dm_tsyybm ";
		ls_sql+=" where crm_tstjlsb.tsyybm=dm_tsyybm.tsyybm ";
		ls_sql+=" group by month,tsyymc";
		so.addData(ls_sql);

		//�������
		so.outData(out,mark);
		%> 
      </table>
    </td>
    <td width="10%" valign="top">&nbsp; </td>
    <td width="45%" align="center"> <%
		//��ȡͼ����ʾ����
		String getStr="";

		ls_sql="SELECT month,sum(sl)";
		ls_sql+=" FROM crm_tstjlsb";
		ls_sql+=" group by month";
		getStr+=so.getDataStr(ls_sql);
		%>
		<applet codebase="/applet" code="TjObjectApplet.class" width="320" height="300">
          <param name="dataStr" value="<%=getStr%>">
          <param name="disType" value="<%=txlx%>">
          <param name="markStr" value="3,2">
          <param name="zbStr" value="0,1">
          <param name="colNameStr" value="�·�,����">
          <param name="alignStr" value="center,center">
          <param name="colWidthStr" value="18,15">
        </applet> 
    </td>
  </tr>
</table>
</body>
</html>
