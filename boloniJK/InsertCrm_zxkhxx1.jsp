<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>��ѯ�ͻ�--�Ǽ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<div align="center">
 
<%
String ssfgs=request.getParameter("ssfgs");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

%>

<form method="post" action="" name="selectform">

    <table width="37%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFCC">
        <td width="59%" height="25" >
          <div align="center">��ѯ�ͻ��Ǽǣ���ѡ�����</div>
        </td>
      </tr>



<%

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;
try {
	conn=cf.getConnection();   //�õ�����

	if (kfgssq.equals("1") || kfgssq.equals("2"))//1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾
	{
		%>
		<tr bgcolor="#FFFFCC"> 
		<td width="59%" height="25" > 
		  <INPUT type="radio" name="dwbh" value="" onclick="f_do(selectform)">
		  ��ѡ���κε���</td>
		</tr>
		<%
		String dwbh=null;
		String dwmc=null;
		sql="select dwbh,dwmc";
		sql+=" from sq_dwxx";
		sql+=" where dwlx='F2' and ssfgs='"+ssfgs+"'";
		sql+=" order by dwbh";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			dwbh=rs.getString("dwbh");
			dwmc=rs.getString("dwmc");

			%> 
			<tr bgcolor="#FFFFCC"> 
			<td width="59%" height="25" >
				<INPUT type="radio" name="dwbh" value="<%=dwbh%>" id="<%=dwbh%>" onclick="f_do(selectform)">
				<label for="<%=dwbh%>"><%=dwmc%></label>  
			</td>
			</tr>
			<%
		}
		rs.close();
		ps.close();
	}
	else if (kfgssq.equals("4") || kfgssq.equals("5"))//4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		String dwbh=null;
		String dwmc=null;
		sql="select dwbh,dwmc";
		sql+=" from sq_dwxx";
		sql+=" where dwlx='F2' and ssfgs='"+ssfgs+"'";
		sql+=" and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		sql+=" order by dwbh";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			dwbh=rs.getString("dwbh");
			dwmc=rs.getString("dwmc");

			%> 
			<tr bgcolor="#FFFFCC"> 
			<td width="59%" height="25" >
				<INPUT type="radio" name="dwbh" value="<%=dwbh%>" id="<%=dwbh%>" onclick="f_do(selectform)">
				<label for="<%=dwbh%>"><%=dwmc%></label>  
			</td>
			</tr>
			<%
		}
		rs.close();
		ps.close();
	}
	else if (kfgssq.equals("3"))//3����Ȩ��������
	{
		String dwbh=null;
		sql="select dwbh";
		sql+=" from sq_sqbm";
		sql+=" where ygbh='"+ygbh+"'";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			dwbh=rs.getString("dwbh");
		}
		rs.close();
		ps.close();

		response.sendRedirect("InsertCrm_zxkhxx2.jsp?ssfgs="+ssfgs+"&dwbh="+dwbh);
	}


}
catch (Exception e) {
	out.print("Exception: " + e);
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
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}

%> 
    </table>

</form>
</div>

</body>
</html>

<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	FormName.action="InsertCrm_zxkhxx2.jsp?ssfgs=<%=ssfgs%>";

	FormName.submit();
	return true;
}
//-->
</SCRIPT>

