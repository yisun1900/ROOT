<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<div align="center">
 

<form method="post" action="" name="selectform">

    <table width="37%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFCC">
        <td width="59%" height="25" >
          <div align="center">ǩ���ͻ�--��ѯ</div>
        </td>
      </tr>

      <%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;
try {
	conn=cf.getConnection();   //�õ�����

	if (kfgssq.equals("2") || kfgssq.equals("5"))//2����Ȩ����ֹ�˾��5����Ȩ����ֹ�˾�������
	{
		String dwbh=null;
		String dwmc=null;
		sql="select dwbh,dwmc";
		sql+=" from sq_dwxx";
		sql+=" where ( dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"')";
		sql+="      OR dwbh in(select ssfgs from sq_sqbm  where ygbh='"+ygbh+"') )";
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
				<INPUT type="radio" name="ssfgs" value="<%=dwbh%>" id="<%=dwbh%>" onclick="<%=dwbh%>.disabled=true;f_do('<%=dwbh%>');">
				<label for="<%=dwbh%>"><%=dwmc%></label>  
			</td>
			</tr>
			<%
		}
		rs.close();
		ps.close();
	}
	else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))//1����Ȩ�����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾�������
	{
		String dwbh=null;
		sql="select dwbh";
		sql+=" from sq_dwxx";
		sql+=" where ( dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"')";
		sql+="      OR dwbh in(select ssfgs from sq_sqbm  where ygbh='"+ygbh+"') )";
		sql+=" order by dwbh";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			dwbh=rs.getString("dwbh");
		}
		rs.close();
		ps.close();

		response.sendRedirect("SelectJyCrm_khxx.jsp?ssfgs="+dwbh);
	}
	else{
		out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
		return;
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
function f_do(ssfgs)//����FormName:Form������
{
	selectform.action="SelectJyCrm_khxx.jsp?ssfgs="+ssfgs;

	selectform.submit();
	return true;
}
//-->
</SCRIPT>

