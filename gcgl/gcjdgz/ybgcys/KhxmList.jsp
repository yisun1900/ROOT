<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

String xz=request.getParameter("xz");
String khxmlist[]=request.getParameterValues("khxmlist");
if (khxmlist==null)
{
	out.println("������ͻ�����!");
	return;
}
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���ι�����ɵǼ�</font></B>
</CENTER>

<table border="1" width="115%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC" align="center"> 
      <td  width="4%">&nbsp;</td>
	  <td  width="4%">���</td>
	  <td  width="8%">��ͬ��</td>
	  <td  width="7%">����</td>
	  <td  width="6%">���ʦ</td>
	  <td  width="6%">���̵���</td>
	  <td  width="6%">ʩ����</td>
	  <td  width="24%">���ݵ�ַ</td>
	  <td  width="8%">Ŀǰ����</td>
	  <td  width="8%">Ӧ��������</td>
	  <td  width="8%">ǩԼ����</td>
	  <td  width="11%">ǩԼ����</td>
</tr>
<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String bgcolor=null;

int pos=0;
int count=0;
int row=0;
String khxm=null;
String sjkgrq=null;
String hflxbm=null;
String hfrq=null;

String khbh=null;
String hth=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String qyrq=null;
String kgrq=null;
String dwmc=null;
String gcjdmc=null;
try {
	conn=cf.getConnection();

	for (int i=0;i<khxmlist.length ;i++ )
	{
		khxm=cf.GB2Uni(khxmlist[i]);

		if (i%2==1)
		{
			bgcolor="#FFFFCC";
		}
		else{
			bgcolor="#FFFFFF";
		}

		count=0;
		ls_sql="SELECT khbh,hth,khxm,DECODE(xb,'M','��','W','Ů') as xb,fwdz,lxfs,qyrq,kgrq,a.dwmc dm,sjs,zjxm,sgdmc sgd,gcjdmc ";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm ";
		ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm and crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
		ls_sql+=" and crm_khxx.zt='2' and crm_khxx.gcjdbm='2'";
		if (xz.equals("xzkhxm"))
		{
			ls_sql+=" and khxm='"+khxm+"'";
		}
		else{
			ls_sql+=" and hth='"+khxm+"'";
		}

		if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			khbh=cf.fillHtml(rs.getString("khbh"));
			hth=cf.fillHtml(rs.getString("hth"));
			khxm=cf.fillHtml(rs.getString("khxm"));
			xb=cf.fillHtml(rs.getString("xb"));
			fwdz=cf.fillHtml(rs.getString("fwdz"));
			lxfs=cf.fillHtml(rs.getString("lxfs"));
			qyrq=cf.fillHtml(rs.getDate("qyrq"));
			kgrq=cf.fillHtml(rs.getDate("kgrq"));
			dwmc=cf.fillHtml(rs.getString("dm"));
			sjs=cf.fillHtml(rs.getString("sjs"));
			zjxm=cf.fillHtml(rs.getString("zjxm"));
			sgd=cf.fillHtml(rs.getString("sgd"));
			gcjdmc=cf.fillHtml(rs.getString("gcjdmc"));

%>
			
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td> 
        <A HREF="InsertCrm_gcjddjjl.jsp?khbh=<%=khbh%>" target="_blank">�Ǽ�</A>
	  </td>
      <td><%=(i+1)%></td>
      <td>
		<%=hth%>
	  </td>
      <td><%=khxm%></td>
       <td><%=sjs%></td>
      <td><%=zjxm%></td>
      <td><%=sgd%></td>
      <td><%=fwdz%></td>
      <td><%=gcjdmc%></td>
      <td><%=kgrq%></td>
		<td><%=qyrq%></td>
      <td><%=dwmc%></td>
	</tr>
<%
			count++;
			row++;
		}
		ps.close();
		rs.close();

		if (count<1)//������
		{
%>
			
    <tr bgcolor="#CC0000"> 
      <td>&nbsp;</td>
      <td><%=(i+1)%></td>
      <td colspan="2"><%=khxm%></td>
      <td colspan="9" bgcolor="#CC0000">���ݲ�����</td>
	</tr>
<%
		}
	}
}
catch (Exception e) {
	out.print("��������: " + e);
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

</table>


</body>
</html>

