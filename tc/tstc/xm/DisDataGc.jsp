<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������� </title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String bjjbbm = null;
String bjjbmc=null;
String dqbm = null;
String dqmc=null;

String[][] outStr=null; 
String bgcolor=null;

String xmmc=null;
String ppmc=null;
String xh=null;
String jldw=null;
String bhslStr=null;
String bz=null;


double bhsl=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

int row=0;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	dqbm =up.getParameter("dqbm");
	bjjbbm =up.getParameter("bjjbbm");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	sql=" select dqmc " ;
	sql+=" from dm_dqbm " ;
	sql+=" where dqbm='"+dqbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		dqmc = rs.getString("dqmc");			    
	}
	rs.close();
	ps.close();

	%> 
<form method="post" action="SaveLoadDataGc.jsp" name="editform" target="_blank">
<div align="center">
    <p>�����ײͱ�׼��Ŀ</p>
    <p><font color="#FF0000"><b>��ע�⣺</b></font><b>���ۼ���</b><font color="#FF0000"><b>[<%=bjjbbm%>]</b></font><b>��</b><b>����</b><font color="#FF0000"><b>[<%=dqmc%>]
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
	<input type="hidden" name="bjjbbm" value="<%=bjjbbm%>">

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="20%">��Ŀ����</td>
      <td width="20%">Ʒ��</td>
	  <td width="18%">�ͺ�</td>
      <td width="12%">������λ</td>
      <td width="10%">��������</td>
      <td width="20%">��ע������˵��</td>
    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][1].equals(""))
		{
			out.println("����!��"+i+"��[����]Ϊ��,����������Զ�������");
			break;
		}
		row++;

		int len=outStr[i].length;
		if (len<6)
		{
			out.println("�����������°�Excelģ��");
			return;
		}

		xmmc=outStr[i][0].trim();
		ppmc=outStr[i][1].trim();
		xh=outStr[i][2].trim();
		jldw=outStr[i][3].trim();
		bhslStr=outStr[i][4].trim();
		bz=outStr[i][5].trim();


		if (xmmc.equals(""))
		{
			out.println("�к�["+row+"]������Ŀ����Ϊ��");
			return;
		}


		sql=" select jldwmc" ;
		sql+=" from jdm_jldwbm " ;
		sql+=" where jldwmc='"+jldw+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			jldw = rs.getString("jldwmc");			    
		}
		else{
			out.println("�к�["+row+"]���󣡲����ڵ�[������λ]��"+jldw);
			return;
		}
		rs.close();
		ps.close();




/*		if (bhslStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[��������]����Ϊ��");
			return;
		}
		else{
			try{
				bhsl=Double.parseDouble(bhslStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[��������:"+bhslStr+"]��������:"+e);
				return;
			}
		}
*/

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=xmmc%>
        <input name="xmmc" type="hidden" value="<%=xmmc%>">
      </td>
      <td><%=ppmc%>
        <input name="ppmc" type="hidden" value="<%=ppmc%>">
      </td>
      <td><%=xh%>
        <input name="xh" type="hidden" value="<%=xh%>" >
      </td>
      <td><%=jldw%>
        <input name="jldw" type="hidden" value="<%=jldw%>" >
      </td>
      <td><%=bhslStr%>
        <input name="bhsl" type="hidden" value="<%=bhsl%>" >
      </td>
	  <td><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
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
		f.close();
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%> 
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button" name="bc" value="����" onClick="f_do(editform)">
        <input type="reset"  value="����" onClick="bc.disabled=false">
      ��������Ŀ����<%=row%>
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
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
