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

String bjbbh = null;
String dqbm = null;
String dqmc=null;

String[][] outStr=null; 
String bgcolor=null;

String bjjbbm = null;
String bjjbmc=null;
String hxbm=null;
String hxmc=null;
String xmbh=null;
String xmmc=null;
String bzslStr=null;
String sfxzsl=null;
String sfxzslStr=null;
String ccbfjjStr=null;


double bzsl=0;
double ccbfjj=0;

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
	bjbbh =up.getParameter("bjbbh");

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
    <p>�����ײͱ�׼������Ŀ</p>
    <p><font color="#FF0000"><b>��ע�⣺</b></font><b>�汾��</b><font color="#FF0000"><b>[<%=bjbbh%>]</b></font><b>��</b><b>����</b><font color="#FF0000"><b>[<%=dqmc%>]
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
	<input type="hidden" name="bjbbh" value="<%=bjbbh%>">

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="14%">���ۼ���</td>
      <td width="14%">����</td>
	  <td width="14%">��Ŀ���</td>
      <td width="28%">��Ŀ����</td>
      <td width="10%">�Ƿ���������</td>
      <td width="10%">��׼����</td>
      <td width="10%">�����Ӽ�</td>
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
		if (len<7)
		{
			out.println("�����������°�Excelģ��");
			return;
		}

		bjjbmc=outStr[i][0].trim();
		hxmc=outStr[i][1].trim();
		xmbh=outStr[i][2].trim();
		xmmc=outStr[i][3].trim();
		sfxzslStr=outStr[i][4].trim();
		bzslStr=outStr[i][5].trim();
		ccbfjjStr=outStr[i][6].trim();


		if (xmbh.equals(""))
		{
			out.println("�к�["+row+"]������Ŀ���Ϊ��");
			return;
		}

		sql=" select bjjbbm" ;
		sql+=" from bdm_bjjbbm " ;
		sql+=" where bjjbmc='"+bjjbmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			bjjbbm = rs.getString("bjjbbm");			    
		}
		else{
			out.println("�к�["+row+"]���󣡲����ڵ�[���ۼ���]��"+bjjbmc);
			return;
		}
		rs.close();
		ps.close();

		sql=" select hxbm" ;
		sql+=" from dm_hxbm " ;
		sql+=" where hxmc='"+hxmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			hxbm = rs.getString("hxbm");			    
		}
		else{
			out.println("�к�["+row+"]���󣡲����ڵ�[����]��"+hxmc);
			return;
		}
		rs.close();
		ps.close();

		String getxmmc = null;
		sql=" select xmmc" ;
		sql+=" from bj_jzbjb " ;
		sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			getxmmc = rs.getString("xmmc");			    
		}
		else{
			out.println("�к�["+row+"]���󣡲����ڵ�[��Ŀ���]��"+xmbh);
			return;
		}
		rs.close();
		ps.close();
		if (!getxmmc.equals(xmmc))
		{
			out.println("�к�["+row+"]����[��Ŀ����]����ȷ��ӦΪ����"+getxmmc+"��");
			return;
		}




		if (bzslStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[��׼����]����Ϊ��");
			return;
		}
		else{
			try{
				bzsl=Double.parseDouble(bzslStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[��׼����:"+bzslStr+"]��������:"+e);
				return;
			}
		}

		if (ccbfjjStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[�����Ӽ�]����Ϊ��");
			return;
		}
		else{
			try{
				ccbfjj=Double.parseDouble(ccbfjjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[�����Ӽ�:"+ccbfjjStr+"]��������:"+e);
				return;
			}
		}


		if (sfxzslStr.equals("������"))
		{
			sfxzsl="1";
		}
		else if (sfxzslStr.equals("��������"))
		{
			sfxzsl="2";
		}
		else if (sfxzslStr.equals("������"))
		{
			sfxzsl="3";
		}
		else{
			out.println("�к�["+row+"]����[�Ƿ���������]ֻ��Ϊ�������������������ơ���ĿǰΪ["+sfxzslStr+"]");
			return;
		}

		if (sfxzsl.equals("1"))
		{
			if (bzsl==0 || ccbfjj==0)
			{
				out.println("�к�["+row+"]����[�Ƿ���������]Ϊ�����������׼�����������Ӽ۶�����Ϊ0");
				return;
			}
		}
		else if (sfxzsl.equals("2"))
		{
			if (bzsl==0)
			{
				out.println("�к�["+row+"]����[�Ƿ���������]Ϊ�������������׼��������Ϊ0");
				return;
			}
		}

		if (bzsl==0)
		{
			bzslStr="";
		}
		if (ccbfjj==0)
		{
			ccbfjjStr="";
		}



		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=bjjbmc%>
        <input name="bjjbbm" type="hidden" value="<%=bjjbbm%>" >
      </td>
      <td><%=hxmc%>
        <input name="hxbm" type="hidden" value="<%=hxbm%>">
      </td>
      <td><%=xmbh%>
        <input name="xmbh" type="hidden" value="<%=xmbh%>">
      </td>
	  <td ><%=xmmc%>
      </td>
      <td><%=sfxzslStr%>
        <input name="sfxzsl" type="hidden" value="<%=sfxzsl%>" >
      </td>
      <td><%=bzslStr%>
        <input name="bzsl" type="hidden" value="<%=bzsl%>" >
      </td>
      <td><%=ccbfjjStr%>
        <input name="ccbfjj" type="hidden" value="<%=ccbfjj%>" >
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