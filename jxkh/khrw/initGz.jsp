<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>���뿼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String[][] outStr=null; 
String bgcolor=null;

String ssfgs =null;
String khzq =null;

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
try 
{
	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	ssfgs = up.getParameter("ssfgs");
	khzq = up.getParameter("khzq");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer);
	f.close();

	%> 
<form method="post" action="saveInitGz.jsp" name="editform" >
<div align="center">���뿼������</div>
<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
<input type="hidden" name="khzq" value="<%=khzq%>">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" > 
      <td colspan="17"> 
        <input type="button"  value="����" onClick="f_do(editform)">
      </td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="10%">Ա�����</td>
	<td  width="20%">��������</td>
	<td  width="15%">����</td>
	<td  width="15%">Ա������</td>
	<td  width="20%">����ְ��</td>
	<td  width="15%">����ҵ��</td>
    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(filename); 

	if (outStr==null)
	{
		out.println("����Execel�ļ��޷�ʶ�������¸���һ�����ļ�");
		return;
	}

	conn=cf.getConnection();    //�õ�����

	String ygbh=null;
	String dwbh=null;
	String dwmc=null;
	String bianhao=null;
	String yhmc=null;
	String xzzwbm=null;

	String byrwStr=null;
	double byrw=0;
	
	
	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}


		ygbh=outStr[i][0].trim();
		dwmc=outStr[i][1].trim();
		bianhao=outStr[i][2].trim();
		yhmc=outStr[i][3].trim();
		xzzwbm=outStr[i][4].trim();

		byrwStr=outStr[i][5].trim();
		
		
		if (ygbh.equals(""))
		{
			out.println("����!��"+i+"��[Ա�����]Ϊ��,����������Զ�������");
			break;
		}

		sql="select dwbh";
		sql+=" from  sq_dwxx";
		sql+=" where dwmc='"+dwmc+"' and ssfgs='"+ssfgs+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dwbh=rs.getString("dwbh");
		}
		else{
			out.println("<BR>����!�������Ų����ڣ�"+dwmc);
		}
		rs.close();
		ps.close();


		int count=0;
		sql="select count(*)";
		sql+=" from  sq_yhxx";
		sql+=" where ygbh='"+ygbh+"' and dwbh='"+dwbh+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count<1)
		{
			out.println("<BR>���󣡸�[Ա�����]��"+ygbh+"�������ڣ�"+sql);
		}
		
		String getyhmc=null;
		String getbianhao=null;
		String getxzzwbm=null;
		sql="select yhmc,bianhao,xzzwbm";
		sql+=" from  sq_yhxx";
		sql+=" where ygbh='"+ygbh+"' and dwbh='"+dwbh+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getyhmc=rs.getString("yhmc");
			getbianhao=rs.getString("bianhao");
			getxzzwbm=rs.getString("xzzwbm");
		}
		rs.close();
		ps.close();

		if (!getyhmc.equals(yhmc))
		{
			out.println("<BR>���󣡡�Ա�����:"+ygbh+"����������ȷ����ȷΪ��"+getyhmc+"��������Ϊ��"+yhmc);
		}
		if (!getbianhao.equals(bianhao))
		{
			out.println("<BR>���󣡡�Ա�����:"+ygbh+"�����Ų���ȷ����ȷΪ��"+getbianhao+"��������Ϊ��"+bianhao);
		}
		if (!getxzzwbm.equals(xzzwbm))
		{
			out.println("<BR>���󣡡�Ա�����:"+ygbh+"������ְ����ȷ����ȷΪ��"+getxzzwbm+"��������Ϊ��"+xzzwbm);
		}
		
		
		
		if (byrwStr.equals(""))
		{
			out.println("<BR>["+yhmc+"]���ѣ�[����ҵ��]Ϊ��");
			byrwStr="0";
			byrw=0;
		}
		else{
			try{
				byrw=Double.parseDouble(byrwStr);
			}
			catch (Exception e){
				out.println("["+yhmc+"]����[����ҵ��]��������");
				return;
			}
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=ygbh%> 
        <input name="ygbh" type="hidden" value="<%=ygbh%>" >
      </td>
      <td><%=dwmc%> 
        <input name="dwbh" type="hidden" value="<%=dwbh%>" >
      </td>
	  </td>
      <td> <%=bianhao%>
        <input name="bianhao" type="hidden" value="<%=bianhao%>">
		</td>
      <td> <%=yhmc%>
        <input name="yhmc" type="hidden" value="<%=yhmc%>">
		</td>
      <td> <%=xzzwbm%>
        <input name="xzzwbm" type="hidden" value="<%=xzzwbm%>">
		</td>
      <td><%=byrwStr%>
        <input name="byrw" type="hidden" value="<%=byrw%>">
      </td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("����ʧ�ܣ�Exception:" + e);
	out.print("<BR>SQL=" + sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
		f.close();
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%> 
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="����" onClick="f_do(editform)">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
