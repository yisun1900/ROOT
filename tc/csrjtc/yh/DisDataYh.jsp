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

String lbxmbm=null;
String lbmc=null;
String xmmc=null;
String ppmc=null;
String xh=null;
String jldw=null;
String zqdjStr=null;
String djStr=null;
String sjzjStr=null;
String slStr=null;
String lxStr=null;
String bz=null;


double zqdj=0;
double dj=0;
double sjzj=0;
double sl=0;
String lx=null;

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
<form method="post" action="SaveLoadDataYh.jsp" name="editform" target="_blank">
<div align="center">
    <p>�����ײ��Ż���Ŀ</p>
    <p><font color="#FF0000"><b>��ע�⣺</b></font><b>���ۼ���</b><font color="#FF0000"><b>[<%=bjjbbm%>]</b></font><b>��</b><b>����</b><font color="#FF0000"><b>[<%=dqmc%>]
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
	<input type="hidden" name="bjjbbm" value="<%=bjjbbm%>">

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="7%">�������</td>
	<td  width="6%">��Ŀ����</td>
	<td  width="14%">��Ŀ����</td>
	<td  width="10%">Ʒ��</td>
	<td  width="12%">�ͺ�</td>
	<td  width="4%">������λ</td>
	<td  width="5%">��ǰ����</td>
	<td  width="5%">�Żݵ���</td>
	<td  width="5%">�����ۼ�</td>
	<td  width="4%">����</td>
	<td  width="4%">����</td>
	<td  width="24%">��ע������˵��</td>
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
		if (len<8)
		{
			out.println("�����������°�Excelģ��");
			return;
		}

		lbmc=outStr[i][0].trim();
		lbxmbm=outStr[i][1].trim();
		xmmc=outStr[i][2].trim();
		ppmc=outStr[i][3].trim();
		xh=outStr[i][4].trim();
		jldw=outStr[i][5].trim();
		zqdjStr=outStr[i][6].trim();
		djStr=outStr[i][7].trim();
		sjzjStr=outStr[i][8].trim();
		slStr=outStr[i][9].trim();
		lxStr=outStr[i][10].trim();
		bz=outStr[i][11].trim();


		if (lbxmbm.equals(""))
		{
			out.println("�к�["+row+"]���������Ŀ����Ϊ��");
			return;
		}

		int count=0;
		sql=" select count(*)" ;
		sql+=" from tc_yhlb " ;
		sql+=" where lbmc='"+lbmc+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"'" ;
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
			out.println("�к�["+row+"]���󣡲����ڵ�[�������]��"+lbmc);
			return;
		}

		sql=" select count(*)" ;
		sql+=" from jdm_jldwbm " ;
		sql+=" where jldwmc='"+jldw+"'" ;
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
			out.println("�к�["+row+"]���󣡲����ڵ�[������λ]��"+jldw);
			return;
		}



		if (zqdjStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[��ǰ����]����Ϊ��");
			return;
		}
		else{
			try{
				zqdj=Double.parseDouble(zqdjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[��ǰ����:"+zqdjStr+"]��������:"+e);
				return;
			}
		}

		if (djStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[�Żݵ���]����Ϊ��");
			return;
		}
		else{
			try{
				dj=Double.parseDouble(djStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[�Żݵ���:"+djStr+"]��������:"+e);
				return;
			}
		}


		if (sjzjStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[�����ۼ�]����Ϊ��");
			return;
		}
		else{
			try{
				sjzj=Double.parseDouble(sjzjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[�����ۼ�:"+sjzjStr+"]��������:"+e);
				return;
			}
		}

		if (slStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[����]����Ϊ��");
			return;
		}
		else{
			try{
				sl=Double.parseDouble(slStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[����:"+slStr+"]��������:"+e);
				return;
			}
		}

		if (lxStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[����]����Ϊ��");
			return;
		}
		else if (lxStr.equals("����"))
		{
			lx="1";//1�����̣�2������
		}
		else if (lxStr.equals("����"))
		{
			lx="2";//1�����̣�2������
		}
		else{
			out.println("<BR>�к�["+row+"]����[����]ֻ����:���̡�����,ʵ��Ϊ:"+lxStr);
			return;
		}


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
 	  <td><%=lbmc%>
        <input name="lbmc" type="hidden" value="<%=lbmc%>">
      </td>
     <td><%=lbxmbm%>
        <input name="lbxmbm" type="hidden" value="<%=lbxmbm%>">
      </td>
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
      <td><%=zqdjStr%>
        <input name="zqdj" type="hidden" value="<%=zqdj%>" >
      </td>
      <td><%=djStr%>
        <input name="dj" type="hidden" value="<%=dj%>" >
      </td>
      <td><%=sjzjStr%>
        <input name="sjzj" type="hidden" value="<%=sjzj%>" >
      </td>
      <td><%=slStr%>
        <input name="sl" type="hidden" value="<%=sl%>" >
      </td>
      <td><%=lxStr%>
        <input name="lx" type="hidden" value="<%=lx%>" >
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
