<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String sfkdybj="";
String bjjb=null;
String lx="";

String mark="";
try {
	conn=cf.getConnection();

	//��飺�Ƿ�ɴ�ӡ���ۣ���������������������������ʼ
	String bjdysq="";
	String ssfgs="";
	ls_sql="select bjjb,bjdysq,ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=rs.getString("bjjb");
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//0��δ��Ȩ��1���ɵ�����2���ɴ�ӡ
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	String sfqyyssh="";
	ls_sql="select sfqyyssh";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfqyyssh=cf.fillNull(rs.getString("sfqyyssh"));
	}
	rs.close();
	ps.close();
	if (sfqyyssh.equals("Y"))//�Ƿ�����Ԥ�����  Y�����ã�N��������
	{
		String ysshbz="";
		ls_sql=" select ysshbz";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where  (khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ysshbz=cf.fillNull(rs.getString("ysshbz"));
		}
		rs.close();
		ps.close();

//		if (!ysshbz.equals("Y"))//N��δ���룻B��������ˣ�C���������룻Y�����ͨ����M�����δͨ��
//		{
//			out.println("����δԤ����ˣ����ܴ�ӡ����");
//			return;
//		}
	}

	ls_sql="select sfkdybj";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfkdybj=cf.fillNull(rs.getString("sfkdybj"));//�Ƿ�ɴ�ӡ����  Y������Ȩ��ӡ��N��������Ȩ��ӡ��M�����ܴ�ӡ
	}
	rs.close();
	ps.close();

	if (sfkdybj.equals("M"))//M�����ܴ�ӡ
	{
		out.println("���ѣ�����Ȩ��ӡ����");
		mark="disabled";
	}
	else if (sfkdybj.equals("Y"))//Y������Ȩ��ӡ
	{
		if ( !bjdysq.equals("1") && !bjdysq.equals("2"))//0��δ��Ȩ��1���ɵ�����2���ɴ�ӡ
		{
			out.println("���ѣ�������Ȩ���ܴ�ӡ���ۣ�Ŀǰδ��Ȩ");
			mark="disabled";
		}
	}
	//��飺�Ƿ�ɴ�ӡ���ۣ�����������������������������

	//�ײ�
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
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

<html>
<head>
<title>���ӱ��۴�ӡ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	font-size: 18px;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr  align="center">
    <td height="90"><span class="STYLE1">��ӡ���ӱ��ۣ��ͻ���ţ�<%=khbh%>��</span></td>
  </tr>

<%
	if (lx.equals("2"))//1�����ײͣ�2���ײ�
	{
		%>
		  <tr align="center" >
			<td height="36"><input type="button" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxTcDyKhList.jsp?khbh=<%=khbh%>')"  value="�ײͣ���ӡ���̱��ۣ��ͻ���"   /></td>
		  </tr>
		  <tr align="center" >
			<td height="36"><input type="button" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxTcDySgdList.jsp?khbh=<%=khbh%>')"  value="�ײͣ���ӡ���̱��ۣ�������"   /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="�ײͣ������嵥" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyTcZcList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="�ײͣ����������嵥" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyTcZcSjList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="�ײͣ����ĳ����Ӽ��嵥" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyTcZcClList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="�ײͣ����շ������嵥" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyTcZcSfList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="���ļ����嵥" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyTcZcJmList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="���������嵥" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyTcBcjList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td height="36">
			<input type="button"  value="�ײͣ��������ģ���ֵ��" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyGzClList_cz.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td height="36">
			<input type="button"  value="�Ҿ��ײ�" onClick="window.open('/dzbjone/zxbjmx/Bj_zctcmcDyList.jsp?khbh=<%=khbh%>&lx=1')"  />
			<input type="button" onClick="window.open('/dzbjone/zxbjmx/Bj_khwntcmcDyList.jsp?khbh=<%=khbh%>&lx=1')"  value="����װ��"  /></td>
		  </tr>

		  <tr align="center" >
			<td height="36">
			<input type="button" onClick="window.open('/dzbjone/zxbjmx/BjDyList.jsp?khbh=<%=khbh%>')"  value="�ײͣ��ܼ�"></td>
		  </tr>
		<%
	}
	else{
		%>
		  <tr  align="center">
			<td height="36">
			  <p>
			    <input type="button" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyList.jsp?khbh=<%=khbh%>')"  value="Ԥ����ӡ�˸�����"   />
			  </p>
			  <p>
			    <input type="button" onClick="window.open('/dzbjone/zxbjmx/Bj_khzcmxDy.jsp?khbh=<%=khbh%>')"  value="Ԥ����ӡ���ı���"   />
			  </p>
			  <p>
			    <input type="button" <%=mark%> onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyAllList.jsp?khbh=<%=khbh%>')"  value="��鱨��"   />
			  </p>
			  <p>
			    <input type="button" onClick="window.open('/dzbjone/zxbjmx/DyZxgcys.jsp?khbh=<%=khbh%>')"  value="װ�޹���Ԥ����"   />
			  </p>
			  <p>
			    <input type="button" onClick="window.open('/dzbjone/zxbjmx/DyBzsm.jsp?khbh=<%=khbh%>')"  value="����˵��"   />
			  </p>
			  <p>
			    <input type="button" onClick="window.open('/dzbjone/zxbjmx/DySdqjg.jsp?khbh=<%=khbh%>')"  value="ˮ�������߰�װ�۸��"   />
			  </p>
		    </td>
		  </tr>
		<%
	}
%>

</table>

</body>
</html>
