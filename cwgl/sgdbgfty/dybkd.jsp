<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String jsjlh=request.getParameter("jsjlh");

double jsjsze=0;
double sjbk=0;

double ycsjbk=0;
double ecsjbk=0;
double scsjbk=0;


String khbh=null;
String khxm=null;
String fwdz=null;
String sjs=null;
String zjxm=null;
String sgdmc=null;
double qye=0;
double zkl=0;

String gdjsjd="";
double clkhj=0;
String lrr=null;

String sqr="";
String sqsj="";
String sqbm="";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select khbh,sjbk,lrr,gdjsjd";
	ls_sql+=" from  cw_sgdbgfty";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sjbk=rs.getDouble("sjbk");
		lrr=cf.fillNull(rs.getString("lrr"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
	}
	else{
		rs.close();
		ps.close();
		out.println("���󣡲����¼������:"+jsjlh);
		return;
	}
	rs.close();
	ps.close();

	int row=0;
	ls_sql="select jsjsze,sjbk";
	ls_sql+=" from  cw_sgdbgfty";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by jsjlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jsjsze=rs.getDouble("jsjsze");
		sjbk=rs.getDouble("sjbk");

		row++;
		if (row==1)
		{
			ycsjbk=sjbk;
		}
		else if (row==2)
		{
			ecsjbk=sjbk;
		}
		else if (row==3)
		{
			scsjbk=sjbk;
		}
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,sjs,sgdmc,zjxm,qye,zkl";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		qye=rs.getDouble("qye");
		zkl=rs.getDouble("zkl");
	}
	rs.close();
	ps.close();


	ls_sql="select sqr,sqsj,sqbm";
	ls_sql+=" from  cw_sgdjssqjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ls_sql+=" and jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqr=cf.fillNull(rs.getString("sqr"));
		sqsj=cf.fillNull(rs.getDate("sqsj"));
		sqbm=cf.fillNull(rs.getString("sqbm"));
	}
	rs.close();
	ps.close();



	//ʩ��������Ϻϼ�
	clkhj=0;
	ls_sql="select sum(pszje)";
	ls_sql+=" from  jxc_clpsd";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and psdzt in('2','3','5')";
	//0���ȴ��ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻5�����ֳ��⣻6�����������޸ģ�7������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clkhj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//������Ʒ�ϼ�
	ls_sql="select sum(je)";
	ls_sql+=" from  cw_gdyplyjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";//0��δ���㣻1���ѽ���
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clkhj+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	clkhj=cf.round(clkhj,2);

}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<title>���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<div align="center">���</div>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF" height="34">
    <td width="25%">�ͻ���ţ�<U><%=khbh%></U></td>
    <td width="25%">�ͻ�������<U><%=khxm%></U></td>
    <td width="25%">���ʦ��<U><%=sjs%></U></td>
    <td width="25%">����<U><%=zjxm%></U></td>
  </tr>
  
  <tr bgcolor="#FFFFFF" height="34">
    <td colspan="3">���ݵ�ַ��<U><%=fwdz%></U></td>
    <td>ʩ���ӣ�<U><%=sgdmc%></U></td>
  </tr>
  
  
  <tr bgcolor="#FFFFFF" height="34">
  <td>��ͬ��<U><%=qye%></U></td>
  <td>�ۿۣ�<U><%=zkl%></U></td>
  <td>���������<U><%=jsjsze%></U></td>
  <td>���Ͽ�ϼƣ�<U><%=clkhj%></U></td>
</tr>
  <tr bgcolor="#FFFFFF" height="34">
  <td>��һ�β��<U><%=ycsjbk%></U></td>
  <td>�ڶ��β��<U><%=ecsjbk%></U></td>
  <td>�����β��<U><%=scsjbk%></U></td>
  <td>&nbsp;</td>
</tr>
  <tr bgcolor="#FFFFFF" height="34">
  <td colspan="4">����д��<U><%=cf.NumToRMBStr(sjbk)%></U></td>
  </tr>
</table>

<BR>
<table width="100%"  border="0" cellpadding="1" cellspacing="0" bgcolor="#999999" style="FONT-SIZE:14">
  <tr bgcolor="#FFFFFF" height="34">
    <td width="25%">���̾���<U>&nbsp;<%=sqr%>&nbsp;</U></td>
    <td width="25%">����<U>&nbsp;<%=lrr%>&nbsp;</U></td>
    <td width="25%">�ܾ���<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
    <td width="25%">����ˣ�<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
  </tr>
  <tr bgcolor="#FFFFFF" height="44">
    <td width="25%">&nbsp;</td>
    <td width="25%">&nbsp;</td>
    <td colspan="2" align="center"><U>&nbsp;<%=cf.today("YYYY")%>&nbsp;</U>��<U>&nbsp;<%=cf.today("MM")%>&nbsp;</U>��<U>&nbsp;<%=cf.today("DD")%>&nbsp;</U>��</td>
  </tr>
</table>


</body>
</html>

