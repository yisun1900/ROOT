<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>ά�����ı���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF" style="FONT-SIZE:16">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletConfig().getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String[][] outStr=null; 
String bgcolor=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;
String xuhao=null;
String ckbh=null;
String hjbh=null;
String hwbh=null;
String clbm=null;
double kcsl=0;
double zcpsl=0;
double ccpsl=0;
double bfpsl=0;

String ckmc=null;
String hjmc=null;
String hwmc=null;
String zljb=null;
String yclmc=null;
String yxh=null;
String ygg=null;
String ynbbm=null;
String yzljb=null;
String yxuhao=null;
String yckmc=null;
String yhjmc=null;
String yhwmc=null;
String yclbm=null;
String ykcsl=null;
String yzcpsl=null;
String yccpsl=null;
String ybfpsl=null;
String dqbm=null;
String dqmc=null;
String ydqmc=null;
int count=0;
String pdph=null;
try 
{
	conn=cf.getConnection();    //�õ�����
	

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	pdph =up.getParameter("pdph");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\jcjj\\zcbj\\impdata\\"+yhdlm+".txt";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();
//��ѯ�̵��¼�еĲֿ�����
	sql=" select ckmc,jxc_kcpdjl.ckbh ckbh,dqmc,jxc_kcpdjl.dqbm dqbm " ;
	sql+=" from jxc_kcpdjl,jxc_ckmc,dm_dqbm " ;
	sql+=" where jxc_kcpdjl.dqbm=dm_dqbm.dqbm and jxc_kcpdjl.ckbh=jxc_ckmc.ckbh and pdph='"+pdph+"' " ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		dqmc = rs.getString("dqmc");
		dqbm = rs.getString("dqbm");
		ckmc = rs.getString("ckmc");
		ckbh = rs.getString("ckbh");			
	}
	else
	{
		out.println("<BR>���������["+xuhao+"]���󣬲����ڵĲֿ�["+yckmc+"]������");
		return;
	}
	rs.close();
	ps.close();
	%> 
<form method="post" action="Saveexcel.jsp" name="editform" target="_blank">
  <div align="center">¼���̵�����ϸ</div>
   <input name="pdph" type="hidden" value="<%=pdph%>">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="3%">���</td>
	<td  width="5%">����</td>
	<td  width="8%">�ֿ�</td>
	<td  width="6%">���ϱ���</td>
	<td  width="12%">��������</td>	
	<td  width="8%">�ͺ�</td>
	<td  width="8%">���</td>
	<td  width="7%">�ڲ�����</td>
	<td  width="4%">����Ʒ����</td>
	<td  width="4%">�д�Ʒ����</td>
	<td  width="4%">����Ʒ����</td>
    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(5001,filename); 

	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][1]==null || outStr[i][1].equals(""))
		{
			out.println("����!��"+i+"��[����]Ϊ��,����������Զ�������");
			break;
		}
		yxuhao=outStr[i][0].trim();
		ydqmc=outStr[i][1].trim();
		yckmc=outStr[i][2].trim();
		yclbm=outStr[i][3].trim();
		yclmc=outStr[i][4].trim();
		yxh=outStr[i][5].trim();
		ygg=outStr[i][6].trim();
		ynbbm=outStr[i][7].trim();
		yzcpsl=outStr[i][8].trim();
		yccpsl=outStr[i][9].trim();
		ybfpsl=outStr[i][10].trim();

		//���
		xuhao=yxuhao;
		//��������
		if (!(dqmc.equals(ydqmc)))
		{out.println("<BR>���������["+xuhao+"]���󣬲ֿⲻ�����̵����Ϊ:["+dqmc+"];��¼��ĵ���Ϊ:["+ydqmc+"];");return;}

		//�ֿ�����
		if (!(ckmc.equals(yckmc)))
		{out.println("<BR>���������["+xuhao+"]���󣬲ֿⲻ�����̵�ֿ�Ϊ:["+ckmc+"];��¼��Ĳֿ�Ϊ:["+yckmc+"];");return;}
		
		
		//���ϱ���
		if (yclbm!=null && !yclbm.trim().equals(""))
		{
			clbm=cf.addZero(yclbm,13);
		}
		else
		{
			out.println("<BR>���������["+xuhao+"]����[���ϱ���]����Ϊ�գ�����");
			return;
		}

		//�̵�����Ʒ����
		zcpsl=0;
		if (yzcpsl!=null && !yzcpsl.trim().equals(""))
		{
			try{
				zcpsl=Double.parseDouble(yzcpsl.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[�̵�����Ʒ����]�����֣�" + yzcpsl);
				return;
			}
		}
		if (zcpsl<0)
		{out.println("<BR>���������["+xuhao+"]����[�̵�����Ʒ����]������ڵ����㣡����");
			return;}
			//�̵�д�Ʒ����
		ccpsl=0;
		if (yccpsl!=null && !yccpsl.trim().equals(""))
		{
			try{
				ccpsl=Double.parseDouble(yccpsl.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[�̵�д�Ʒ����]�����֣�" + yccpsl);
				return;
			}
		}
		if (ccpsl<0)
		{out.println("<BR>���������["+xuhao+"]����[�̵�д�Ʒ����]������ڵ����㣡����");
			return;}
			//�̵㱨��Ʒ����
		bfpsl=0;
		if (ybfpsl!=null && !ybfpsl.trim().equals(""))
		{
			try{
				bfpsl=Double.parseDouble(ybfpsl.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[�̵㱨��Ʒ����]�����֣�" + ybfpsl);
				return;
			}
		}
		if (bfpsl<0)
		{out.println("<BR>���������["+xuhao+"]����[�̵㱨��Ʒ����]������ڵ����㣡����");
			return;}
		

%> 
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=yxuhao%> 
        <input name="xuhao" type="hidden" value="<%=xuhao%>">
      </td>
	  <td><%=ydqmc%> 
        <input name="dqbm" type="hidden" value="<%=dqbm%>">
      </td>
		<td><%=yckmc%> 
        <input name="ckbh" type="hidden" value="<%=ckbh%>">
      </td>
	  <td><%=clbm%> 
        <input name="clbm" type="hidden" value="<%=clbm%>">
      </td>
	  <td><%=yclmc%></td>
	  <td><%=yxh%></td>
	  <td><%=ygg%></td>
	  <td><%=ynbbm%></td>
	  <td><%=zcpsl%> 
        <input name="zcpsl" type="hidden" value="<%=zcpsl%>">
      </td>
	  <td><%=ccpsl%> 
        <input name="ccpsl" type="hidden" value="<%=ccpsl%>">
      </td>
	  <td><%=bfpsl%> 
        <input name="bfpsl" type="hidden" value="<%=bfpsl%>">
      </td>
    </tr>
    <%
	}
	rwe=null;
}
catch (Exception e) {
	out.print("���["+xuhao+"]����" + e);
	return;
}
finally 
{
	outStr=null; 

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
      <td colspan="42"> 
        <input type="button"  value="����" name="bc" onClick="f_do(editform)">
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
//	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
