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
String sql=null;

String sfkdybj="";
String bjjb=null;
String lx="";

String mark="";
try {
	conn=cf.getConnection();

	//��飺�Ƿ�ɴ�ӡ���ۣ���������������������������ʼ
	String bjdysq="";
	sql="select bjjb,bjdysq";
	sql+=" from  crm_zxkhxx";
	sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=rs.getString("bjjb");
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//0��δ��Ȩ��1���ɵ�����2���ɴ�ӡ
	}
	rs.close();
	ps.close();
	//��飺�Ƿ�ɴ�ӡ���ۣ�����������������������������

	//��ʼ��
	dzbj.Tzk tzk=new dzbj.Tzk();
	//���±����ۿ�
	tzk.updateBjZkl(conn,khbh,"yz");

	//���������շ���Ŀ�������շѰٷֱ�
	dzbj.NewDzbj dzbj=new dzbj.NewDzbj();
	dzbj.updateSfxm(conn,khbh,"yz");

	//��ȡ���ӱ��۽��
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	double dzbjze=dzbjje.getAllBjje(conn,khbh,"yz");

	//�޸ģ����ӱ����ܶ�
	sql="update crm_zxkhxx set dzbjze=?,sfzdzbj='Y'";
	sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();

	
	
	//�ײ�
	sql="select lx";
	sql+=" from  bdm_bjjbbm";
	sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(sql);
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
	out.print("<BR>SQL=" + sql);
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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
			    <input type="button" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyList.jsp?khbh=<%=khbh%>')"  value="Ԥ����ӡ��ʱ����"   />
			  </p>
			  <p>
			    <input type="button" <%=mark%> onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyAllList.jsp?khbh=<%=khbh%>')"  value="��鱨��"   />
			  </p>
		    </td>
		  </tr>
		<%
	}
%>

</table>

</body>
</html>

