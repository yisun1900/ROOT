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

String khbh=null;


String[][] outStr=null; 
String bgcolor=null;

String zcpzwzbm=null;
String ppbm=null;
String zcmc=null;
String xinghao=null;
String gg=null;
String jldwbm=null;

String slStr=null;
double sl=0;
String zqdjStr=null;
double zqdj=0;
String djStr=null;
double dj=0;
String cbjStr=null;
double cbj=0;

String ycfStr=null;
double ycf=0;

String qtfyStr=null;
String qtfy=null;

String qtfyjeStr=null;
double qtfyje=0;


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

	khbh =up.getParameter("khbh");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();



	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">
    <p>�������� </p>
  </div>
	<input type="hidden" name="khbh" value="<%=khbh%>">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	  <td width="2%">&nbsp;</td>
	  <td width="8%">�ṹλ��</td>
	  <td width="9%">Ʒ��</td>
	  <td width="12%">����</td>
	  <td width="12%">�ͺ�</td>
	  <td width="12%">���</td>
	  <td width="5%">��λ</td>
	  <td width="6%">����</td>
	  <td width="6%">ԭ��</td>
	  <td width="6%">����</td>
	  <td width="6%">�ɱ���</td>
	  <td width="6%">Զ�̷�</td>
	  <td width="5%">��������Ŀ</td>
	  <td width="6%">������</td>
    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

	String[] xinghaoStr=new String[outStr.length-1];

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
		if (len<13)
		{
			out.println("�����������°�Excelģ��");
			return;
		}

		zcpzwzbm=outStr[i][0].trim();
		ppbm=outStr[i][1].trim();
		zcmc=outStr[i][2].trim();
		xinghao=outStr[i][3].trim();

		gg=outStr[i][4].trim();
		jldwbm=outStr[i][5].trim();

		slStr=outStr[i][6].trim();
		zqdjStr=outStr[i][7].trim();
		djStr=outStr[i][8].trim();
		cbjStr=outStr[i][9].trim();

		ycfStr=outStr[i][10].trim();
		qtfyStr=outStr[i][11].trim();
		qtfyjeStr=outStr[i][12].trim();


		if (zcpzwzbm.equals("��"))
		{
			zcpzwzbm="";
		}
		if (ppbm.equals("��"))
		{
			ppbm="";
		}
		if (zcmc.equals("��"))
		{
			zcmc="";
		}
		if (xinghao.equals("��"))
		{
			xinghao="";
		}
		if (gg.equals("��"))
		{
			gg="";
		}
		if (jldwbm.equals("��"))
		{
			jldwbm="";
		}
		if (slStr.equals("��"))
		{
			slStr="";
		}
		if (zqdjStr.equals("��"))
		{
			zqdjStr="";
		}
		if (djStr.equals("��"))
		{
			djStr="";
		}
		if (cbjStr.equals("��"))
		{
			cbjStr="";
		}
		if (ycfStr.equals("��"))
		{
			ycfStr="";
		}
		if (qtfyStr.equals("��"))
		{
			qtfyStr="";
		}
		if (qtfyjeStr.equals("��"))
		{
			qtfyjeStr="";
		}



		if (zcmc.equals(""))
		{
			out.println("�������к�["+row+"]����[����]Ϊ��");
			return;
		}

		int count=0;
		sql=" select count(*)" ;
		sql+=" from jxc_ppxx " ;
		sql+=" where ppmc='"+ppbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			out.println("<BR>�������к�["+row+"]���󣬲����ڵ�[Ʒ��]��"+ppbm);
//			return;
		}


		if (slStr.equals(""))
		{
			sl=0;
		}
		else{
			try{
				sl=Double.parseDouble(slStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�������к�["+row+"]����[����:"+slStr+"]��������:"+e);
//				return;
			}
		}

		if (zqdjStr.equals(""))
		{
			zqdj=0;
		}
		else{
			try{
				zqdj=Double.parseDouble(zqdjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�������к�["+row+"]����[ԭ��:"+djStr+"]��������:"+e);
//				return;
			}
		}

		if (djStr.equals(""))
		{
			dj=0;
		}
		else{
			try{
				dj=Double.parseDouble(djStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�������к�["+row+"]����[����:"+djStr+"]��������:"+e);
//				return;
			}
		}

		if (cbjStr.equals(""))
		{
			cbj=0;
		}
		else{
			try{
				cbj=Double.parseDouble(cbjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�������к�["+row+"]����[�ɱ���:"+cbjStr+"]��������:"+e);
//				return;
			}
		}


		if (ycfStr.equals(""))
		{
			ycf=0;
		}
		else{
			try{
				ycf=Double.parseDouble(ycfStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�������к�["+row+"]����[Զ�̷�:"+ycfStr+"]��������:"+e);
//				return;
			}
		}



		if (qtfyStr.equals("��װ��"))
		{
			qtfy="1";
		}
		else if (qtfyStr.equals("�ӹ���"))
		{
			qtfy="2";
		}
		else if (qtfyStr.equals("�����շ�"))
		{
			qtfy="3";
		}
		else{
			qtfyStr="��";
			qtfy="W";
		}


		if (qtfyjeStr.equals(""))
		{
			qtfyje=0;
		}
		else{
			try{
				qtfyje=Double.parseDouble(qtfyjeStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�������к�["+row+"]����[������:"+qtfyjeStr+"]��������:"+e);
//				return;
			}
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=row%> 
      </td>
      <td><%=zcpzwzbm%> 
        <input name="zcpzwzbm" type="hidden" value="<%=zcpzwzbm%>">
      </td>
      <td><%=ppbm%> 
        <input name="ppbm" type="hidden" value="<%=ppbm%>">
      </td>
      <td><%=zcmc%> 
        <input name="zcmc" type="hidden" value="<%=zcmc%>">
      </td>
      <td> <%=xinghao%>
        <input name="xinghao" type="hidden" value="<%=xinghao%>" >
      </td>
	  <td align="center"> <%=gg%>
        <input name="gg" type="hidden" value="<%=gg%>" >
      </td>
	  <td align="center"> <%=jldwbm%>
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td> <%=slStr%>
        <input name="sl" type="hidden" value="<%=sl%>" >
      </td>
      <td> <%=zqdjStr%>
        <input name="zqdj" type="hidden" value="<%=zqdj%>" >
      </td>
      <td> <%=djStr%>
        <input name="dj" type="hidden" value="<%=dj%>" >
      </td>
      <td> <%=cbjStr%>
        <input name="cbj" type="hidden" value="<%=cbj%>" >
      </td>
    <td> <%=ycfStr%>
        <input name="ycf" type="hidden" value="<%=ycf%>" >
      </td>
      <td> <%=qtfyStr%>
        <input name="qtfy" type="hidden" value="<%=qtfy%>" >
      </td>
      <td> <%=qtfyje%>
        <input name="qtfyje" type="hidden" value="<%=qtfyje%>" >
      </td>

    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("����ʧ�ܣ�Exception:" + e);
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
        <input type="button"  value="����" onClick="f_do(editform)">
        <input type="reset"  value="����">
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
	return true;
}
//-->
</SCRIPT>
