<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sgd=null;
	int ywgs=0;
	int zsgds=0;
	int kpjlh=0;
	String jzsj=null;

	ls_sql="SELECT kpjlh,jzsj";
	ls_sql+=" FROM kp_kpjl  ";
    ls_sql+=" where  zxbz='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kpjlh=rs.getInt("kpjlh");
		jzsj=cf.fillNull(rs.getDate("jzsj"));
	}
	rs.close();
	ps.close();


	ls_sql="SELECT sgd";
	ls_sql+=" FROM kp_sgdkpjg  ";
    ls_sql+=" where  kpjlh="+kpjlh;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		sgd=rs1.getString("sgd");

/*
*/
		//���깤��
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx  ";
		ls_sql+=" where  pdsj>TO_DATE('"+jzsj+"','YYYY-MM-DD') and zt='2' and wgbz='Y' and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			ywgs=rs.getInt(1);
		}
		rs.close();
		ps.close();
		//��ʩ������
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx  ";
		ls_sql+=" where  pdsj>TO_DATE('"+jzsj+"','YYYY-MM-DD') and zt='2' and wgbz='N' and sgd='"+sgd+"'";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zsgds=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql=" update kp_sgdkpjg set ywgs="+ywgs+", zsgds="+zsgds;
		ls_sql+=" where  kpjlh="+kpjlh+" and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();



}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}



	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT kp_sgdkpjg.bqpm as kp_sgdkpjg_bqpm,sgdmc as sq_dwxx_dwmc,kjdds-yjdds,kjzds-yjzds,kjxds-yjxds,kp_sgdkpjg.ywgs,kp_sgdkpjg.zsgds ,kp_sgdkpjg.bzs as kp_sgdkpjg_bzs,kp_sgdkpjg.kjdds as kp_sgdkpjg_kjdds,kp_sgdkpjg.kjzds as kp_sgdkpjg_kjzds,kp_sgdkpjg.kjxds as kp_sgdkpjg_kjxds,kp_sgdkpjg.kjdzs as kp_sgdkpjg_kjdzs,kp_sgdkpjg.kjdze as kp_sgdkpjg_kjdze,kp_sgdkpjg.yjdds as kp_sgdkpjg_yjdds,kp_sgdkpjg.yjddje as kp_sgdkpjg_yjddje,kp_sgdkpjg.yjzds as kp_sgdkpjg_yjzds,kp_sgdkpjg.yjzdje as kp_sgdkpjg_yjzdje,kp_sgdkpjg.yjxds as kp_sgdkpjg_yjxds,kp_sgdkpjg.yjxdje as kp_sgdkpjg_yjxdje,yjdds+yjzds+yjxds,yjddje+yjzdje+yjxdje,kp_sgdkpjg.zf as kp_sgdkpjg_zf,kp_sgdkpjg.zfpm as kp_sgdkpjg_zfpm,kp_sgdkpjg.sqpm as kp_sgdkpjg_sqpm,kp_sgdkpjg.zbj as kp_sgdkpjg_zbj";
	ls_sql+=" FROM sq_sgd,kp_sgdkpjg,kp_kpjl  ";
    ls_sql+=" where kp_sgdkpjg.sgd=sq_sgd.sgd";
    ls_sql+=" and kp_sgdkpjg.kpjlh=kp_kpjl.kpjlh  and zxbz='Y'";
    ls_sql+=" order by kp_sgdkpjg.bqpm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("kp_sgdkpjg_bqpm","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ʩ�����ɵ�ͳ��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">��������</td>
	<td  width="1%">ʩ����</td>
	<td  width="1%">Ƿ�Ӵ���</td>
	<td  width="1%">Ƿ���е���</td>
	<td  width="1%">Ƿ��С����</td>
	<td  width="1%">���깤��</td>
	<td  width="1%">��ʩ������</td>
	<td  width="1%">������</td>
	<td  width="1%">�ɽӴ���</td>
	<td  width="1%">�ɽ��е���</td>
	<td  width="1%">�ɽ�С����</td>
	<td  width="1%">�ɽӵ�����</td>
	<td  width="1%">�ɽӵ��ܶ�</td>
	<td  width="1%">�ѽӴ���</td>
	<td  width="1%">�ѽӴ󵥽��</td>
	<td  width="1%">�ѽ��е���</td>
	<td  width="1%">�ѽ��е����</td>
	<td  width="1%">�ѽ�С����</td>
	<td  width="1%">�ѽ�С�����</td>
	<td  width="1%">�ѽӵ�����</td>
	<td  width="1%">�ѽӵ��ܶ�</td>
	<td  width="1%">�ܷ�</td>
	<td  width="1%">�ܷ�����</td>
	<td  width="1%">��������</td>
	<td  width="1%">�ʱ���</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.printSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>