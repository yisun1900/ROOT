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
String fwmjStr=null;
String tcmc=null;
String tcjgStr=null;
String pmzjdjStr=null;
String tlgbzjjStr=null;

int fwmj=0;
double tcjg=0;
double pmzjdj=0;
double tlgbzjj=0;

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
<form method="post" action="SaveLoadDataTc.jsp" name="editform" target="_blank">
<div align="center">
    <p>�����ײͼ۸�</p>
    <p><font color="#FF0000"><b>��ע�⣺</b></font><b>�汾��</b><font color="#FF0000"><b>[<%=bjbbh%>]</b></font><b>��</b><b>����</b><font color="#FF0000"><b>[<%=dqmc%>]
	<P>ע�⣺��Ҫ�ظ�����</b></font></p>
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
	<input type="hidden" name="bjbbh" value="<%=bjbbh%>">

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="14%">���ۼ���</td>
      <td width="14%">����</td>
	  <td width="14%">���ڻ�׼�����ƽ�ף�</td>
      <td width="28%">�ײ�����</td>
      <td width="10%">�ײͼ۸�</td>
      <td width="10%">ƽ�����ӵ���</td>
      <td width="10%">Ϳ�ϸ�Ϊ��ֽ�Ӽ�</td>
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
		fwmjStr=outStr[i][2].trim();
		tcmc=outStr[i][3].trim();
		tcjgStr=outStr[i][4].trim();
		pmzjdjStr=outStr[i][5].trim();
		tlgbzjjStr=outStr[i][6].trim();


		if (hxmc.equals(""))
		{
			out.println("�к�["+row+"]���󣡻���Ϊ��");
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



		if (fwmjStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[���ڻ�׼���]����Ϊ��");
			return;
		}
		else{
			try{
				fwmj=Integer.parseInt(fwmjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[���ڻ�׼���:"+fwmjStr+"]��������:"+e);
				return;
			}
		}

		if (tcjgStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[�ײͼ۸�]����Ϊ��");
			return;
		}
		else{
			try{
				tcjg=Double.parseDouble(tcjgStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[�ײͼ۸�:"+tcjgStr+"]��������:"+e);
				return;
			}
		}

		if (pmzjdjStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[ƽ�����ӵ���]����Ϊ��");
			return;
		}
		else{
			try{
				pmzjdj=Double.parseDouble(pmzjdjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[ƽ�����ӵ���:"+pmzjdjStr+"]��������:"+e);
				return;
			}
		}

		if (tlgbzjjStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[Ϳ�ϸ�Ϊ��ֽ�Ӽ�]����Ϊ��");
			return;
		}
		else{
			try{
				tlgbzjj=Double.parseDouble(tlgbzjjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[Ϳ�ϸ�Ϊ��ֽ�Ӽ�:"+tlgbzjjStr+"]��������:"+e);
				return;
			}
		}




		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=bjjbmc%>
        <input name="bjjbbm" type="hidden" value="<%=bjjbbm%>" >
      </td>
      <td><%=hxmc%>
        <input name="hxbm" type="hidden" value="<%=hxbm%>">
      </td>
      <td><%=fwmjStr%>
        <input name="fwmj" type="hidden" value="<%=fwmj%>">
      </td>
      <td><%=tcmc%>
        <input name="tcmc" type="hidden" value="<%=tcmc%>">
      </td>
      </td>
      <td><%=tcjg%>
        <input name="tcjg" type="hidden" value="<%=tcjg%>" >
      </td>
      <td><%=pmzjdj%>
        <input name="pmzjdj" type="hidden" value="<%=pmzjdj%>" >
      </td>
      <td><%=tlgbzjj%>
        <input name="tlgbzjj" type="hidden" value="<%=tlgbzjj%>" >
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
