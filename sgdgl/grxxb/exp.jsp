<%@ page contentType="application/vnd.ms-excel;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������� </title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">

<table width="250%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#CCCCCC" align="center"> 
	<td width="3%">����ʩ����</td>
	<td width="3%">�೤����</td>
	<td width="3%">����</td>
	<td width="2%">�Ա�</td>
	<td width="4%">����</td>
	<td width="4%">��������</td>
	<td width="3%">����</td>
	<td width="4%">��ְʱ��</td>
	<td width="3%">�ȼ�</td>

	<td width="4%">����</td>
	<td width="8%">���֤��</td>

	<td width="10%">�绰</td>
	<td width="6%">סַ</td>
	<td width="4%">������ϵ��</td>
	<td width="6%">��ϵ�˵绰</td>
	<td width="8%">������ϵ�˵�ַ</td>
	<td width="8%">��ѵ˵��</td>
	<td width="5%">�ϸ�֤���</td>
	<td width="5%">���п�</td>
	<td width="3%">�Ƿ�ǩ��������ǲ��ͬ</td>
	<td width="3%">�Ƿ�ͨ������</td>

</tr>

<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql = null;

int row=0;

try 
{
	conn=cf.getConnection();    //�õ�����



	String ssfgs=request.getParameter("ssfgs");
	
	String sgdmc=null;
	String bzmc=null;

	String xm=null;
	String xb=null;
	String jg=null;
	String csrq=null;
	String gz=null;
	String rzsj=null;
	String dj=null;
	String lx=null;
	String sfzh=null;
	String dh=null;
	String zz=null;
	String jjlxr=null;
	String jjlxrdh=null;
	String jjlxrdz=null;
	String pxsm=null;
	String sgzbh=null;
	String yhk=null;
	String sfqdlwpqht=null;
	String sfkstg=null;



	
	ls_sql=" select sgdmc,bzmc,sq_grxxb.xm,sq_grxxb.xb,sq_grxxb.jg,sq_grxxb.csrq ,sq_grxxb.gz,sq_grxxb.rzsj,sq_grxxb.dj,sq_grxxb.lx,sq_grxxb.sfzh ,sq_grxxb.dh,sq_grxxb.zz,sq_grxxb.jjlxr,sq_grxxb.jjlxrdh,sq_grxxb.jjlxrdz,sq_grxxb.pxsm,sq_grxxb.sgzbh,sq_grxxb.yhk,DECODE(sq_grxxb.sfqdlwpqht,'Y','��','N','��') sfqdlwpqht,DECODE(sq_grxxb.sfkstg,'Y','��','N','��') sfkstg" ;
	ls_sql+=" from sq_grxxb,sq_sgd " ;
	ls_sql+=" where sq_grxxb.sgd=sq_sgd.sgd(+) " ;
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and sq_grxxb.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_grxxb.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (ssfgs!=null)
	{
		if (!ssfgs.equals(""))	
		{
			ls_sql+=" and sq_grxxb.ssfgs='"+ssfgs+"'" ;
		}
	}
	ls_sql+=" order by  sq_grxxb.ssfgs,sq_grxxb.sgd,sq_grxxb.bzmc,sq_grxxb.xm" ;
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while(rs.next())
	{         
		sgdmc = cf.fillNull(rs.getString("sgdmc"));			    
		bzmc = cf.fillNull(rs.getString("bzmc"));			    
		xm = cf.fillNull(rs.getString("xm"));			    
		xb = cf.fillNull(rs.getString("xb"));			    
		jg = cf.fillNull(rs.getString("jg"));			    
		csrq = cf.fillNull(rs.getDate("csrq"));			    
		gz = cf.fillNull(rs.getString("gz"));			    
		rzsj = cf.fillNull(rs.getDate("rzsj"));			    
		dj = cf.fillNull(rs.getString("dj"));			    
		lx = cf.fillNull(rs.getString("lx"));			    
		sfzh = cf.fillNull(rs.getString("sfzh"));			    
		dh = cf.fillNull(rs.getString("dh"));			    
		zz = cf.fillNull(rs.getString("zz"));			    
		jjlxr = cf.fillNull(rs.getString("jjlxr"));			    
		jjlxrdh = cf.fillNull(rs.getString("jjlxrdh"));			    
		jjlxrdz = cf.fillNull(rs.getString("jjlxrdz"));			    
		pxsm = cf.fillNull(rs.getString("pxsm"));			    
		sgzbh = cf.fillNull(rs.getString("sgzbh"));			    
		yhk = cf.fillNull(rs.getString("yhk"));			    
		sfqdlwpqht = cf.fillNull(rs.getString("sfqdlwpqht"));			    
		sfkstg = cf.fillNull(rs.getString("sfkstg"));	
		
		sfzh="sfz:"+sfzh;
		yhk="yhk:"+yhk;
		
		row++;


			%> 
		<tr bgcolor="#FFFFFF" align="center"> 
		  <td><%=sgdmc%> 
		  </td>
		  <td><%=bzmc%> 
		  </td>
		  <td><%=xm%>
		  </td>
		  <td><%=xb%>
		  </td>
		  <td><%=jg%>
		  </td>
		  <td><%=csrq%>
		  </td>
		  <td> <%=gz%>
		  </td>
		  <td> <%=rzsj%>
		  </td>
		  <td> <%=dj%> 
		  </td>
		  <td ><%=lx%>
		  </td>
		  <td ><%=sfzh%>
		  </td>
		  <td ><%=dh%>
		  </td>
		  <td ><%=zz%>
		  </td>
		  <td ><%=jjlxr%>
		  </td>
		  <td ><%=jjlxrdh%>
		  </td>
		  <td ><%=jjlxrdz%>
		  </td>
		  <td ><%=pxsm%>
		  </td>
		  <td ><%=sgzbh%>
		  </td>
		  <td ><%=yhk%>
		  </td>
		  <td ><%=sfqdlwpqht%>
		  </td>
		<td ><%=sfkstg%>
		  </td>
		</tr>
		<%


	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("����ʧ�ܣ�Exception:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%> 
  </table>
</body>
</html>
