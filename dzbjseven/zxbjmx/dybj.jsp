
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

String bjjb=null;
String lx="";

String mark="";
String ysshbz="";
try {
	conn=cf.getConnection();

	//��飺�Ƿ�ɴ�ӡ���ۣ���������������������������ʼ
	String ssfgs="";
	String bjdysq="";
	int bjdycs=0;
	ls_sql="SELECT ssfgs,ysshbz,bjdysq,bjdycs,bjjb";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=rs.getString("ssfgs");
		ysshbz=cf.fillNull(rs.getString("ysshbz"));//�Ƿ�����Ԥ�����  B��������ˣ�C���������룻Y�����ͨ����M�����δͨ����S���޸ķ�����Ȩ
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//���۴�ӡ��Ȩ  0��δ��Ȩ��1���ɵ�����2���ɴ�ӡ
		bjdycs=rs.getInt("bjdycs");//���۴�ӡ����
		bjjb=cf.fillNull(rs.getString("bjjb"));//�Ƿ�����Ԥ�����  B��������ˣ�C���������룻Y�����ͨ����M�����δͨ����S���޸ķ�����Ȩ

	}
	rs.close();
	ps.close();
	
	//���[Ԥ�����]���Ƿ������ӡ��������������������������������ʼ
	String sfqyyssh="";
	String getbjdysq="";
	ls_sql="SELECT sfqyyssh,bjdysq";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfqyyssh=cf.fillNull(rs.getString("sfqyyssh"));//�Ƿ�����Ԥ�����  Y�����ã�N��������
		getbjdysq=cf.fillNull(rs.getString("bjdysq"));//���۴�ӡ�Ƿ�����Ȩ  1��������Ȩ��2��ֻ��һ����Ȩ��3��ÿ�δ�ӡ������Ȩ
	}
	rs.close();
	ps.close();

	if (sfqyyssh.equals("Y"))//�Ƿ�����Ԥ�����  Y�����ã�N��������
	{
		if (!ysshbz.equals("Y"))//B��������ˣ�C���������룻Y�����ͨ����M�����δͨ����S���޸ķ�����Ȩ
		{
			out.println("����[Ԥ�����]δͨ�������ܴ�ӡ����");
			return;
		}
	}
	//���[Ԥ�����]���Ƿ������ӡ��������������������������������ʼ

	//���[��ӡ��Ȩ]���Ƿ�ɴ�ӡ���ۣ���������������������������ʼ
	String sfkdybj="";
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
		out.println("��������Ȩ��ӡ����");
		return;
	}
	else if (sfkdybj.equals("Y"))//Y������Ȩ��ӡ
	{
		if (getbjdysq.equals("2"))//2��ֻ��һ����Ȩ
		{
			if ( !bjdysq.equals("1") && !bjdysq.equals("2"))//0��δ��Ȩ��1���ɵ�����2���ɴ�ӡ
			{
				out.println("����������Ȩ���ܴ�ӡ���ۣ�Ŀǰδ��Ȩ");
				return;
			}
		}
		else if (getbjdysq.equals("3"))//3��ÿ�δ�ӡ������Ȩ
		{
			if ( !bjdysq.equals("1") && !bjdysq.equals("2"))//0��δ��Ȩ��1���ɵ�����2���ɴ�ӡ
			{
				out.println("����������Ȩ���ܴ�ӡ���ۣ�Ŀǰδ��Ȩ");
				return;
			}
			else{
				if (bjdycs>=2)
				{
					out.println("����ÿ����Ȩֻ�ܴ�ӡ���Σ�Ŀǰ�ѳ������ƣ�"+bjdycs+"����������Ȩ");
					return;
				}
			}
		}
		else{
			out.println("��������Ȩ���ܴ�ӡ���ۣ��ڡ����ӱ��۲�����ά�� ��ģ�飬���������۴�ӡ�Ƿ�����Ȩ�����ò���ȷ");
			return;
		}
	}
	//���[��ӡ��Ȩ]���Ƿ������ӡ����������������������������������
 	//��飺�Ƿ�ɴ�ӡ���ۣ�����������������������������


	//��װ
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
	if (lx.equals("1"))//1���Ǿ�װ��2����װ
	{
		%>

  <tr  align="center">
	<td height="46">
	  <p>
		<input type="button" <%=mark%> onClick="window.open('Crm_khbjdy4.jsp?khbh=<%=khbh%>')"  value="��ӡ4����ӱ���"   />
	  </p>
	  <p>
		<input type="button" <%=mark%> onClick="window.open('Crm_khbjdy6.jsp?khbh=<%=khbh%>')"  value="��ӡ6����ӱ���"   />
	  </p>
	  <p>
		<input type="button" <%=mark%> onClick="window.open('Crm_khbjdy62.jsp?khbh=<%=khbh%>')"  value="��ӡ6����ӱ���(����)"   />
	  </p>
	  <p>
		<input type="button" <%=mark%> onClick="window.open('Crm_khbjdy61.jsp?khbh=<%=khbh%>')"  value="��ӡ6����ӱ���(��С��)"   />
	  </p>
	  <p>
		<input type="button" <%=mark%> onClick="window.open('Crm_khbjdy7.jsp?khbh=<%=khbh%>')"  value="��ӡ7����ӱ���"   />
	  </p>
	  <p>
		<input type="button" <%=mark%> onClick="window.open('Crm_khbjdy1.jsp?khbh=<%=khbh%>')"  value="��ӡ1����ӱ���"   />
	  </p>
	<p>
		<input type="button" onClick="window.open('Bj_khbjmxDyLsBjList.jsp?khbh=<%=khbh%>')"  value="��ӡ��ʱ����"   />
	  </p>
			  <p>
			    <input type="button" <%=mark%> onClick="window.open('Bj_khbjmxDyAllList.jsp?khbh=<%=khbh%>')"  value="��鱨��"   />
			  </p>
	</td>
  </tr>
		<%
	}
	else{
		%>
		  <tr align="center" >
			<td height="36"><input type="button" onClick="window.open('/dzbjseven/zxbjmx/Bj_khbjmxTcDyKhList.jsp?khbh=<%=khbh%>')"  value="��װ����ӡ���̱��ۣ��ͻ���"   /></td>
		  </tr>
		  <tr align="center" >
			<td height="36"><input type="button" onClick="window.open('/dzbjseven/zxbjmx/Bj_khbjmxTcDySgdList.jsp?khbh=<%=khbh%>')"  value="��װ����ӡ���̱��ۣ�������"   /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="��װ�������嵥" onClick="window.open('/dzbjseven/zxbjmx/Bj_khbjmxDyTcZcList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  

		  <tr align="center" >
			<td height="36">
			<input type="button" onClick="window.open('/dzbjseven/zxbjmx/BjDyList.jsp?khbh=<%=khbh%>')"  value="��װ���ܼ�"></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="��װ������Ŀ" onClick="window.open('/dzbjseven/zxbjmx/Tc_khbzxmList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		<%
	}
%>

</table>

</body>
</html>


