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


String[][] outStr=null; 
String bgcolor=null;

String dqbm=null;
String clbm=null;
String nbbm=null;
String clmc=null;
String xh=null;
String gg=null;


String scph=null;
String scrqStr=null;
String ckbh=null;
String hjbh=null;
String hwbh=null;
String jldwbm=null;
String kcslStr=null;
String rkjStr=null;
String kcjeStr=null;


String mark=null;

double kcsl=0;
double rkj=0;
double kcje=0;
double allkcsl=0;
double allkcje=0;
java.sql.Date scrq=null;

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
<div align="center">�������Ŀ��</div>
  <table width="170%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="3%">���ڵ���</td>
      <td width="7%">���ϱ���</td>
	  <td width="6%">�ڲ�����</td>
      <td width="15%">��������</td>
      <td width="11%">�ͺ�</td>
      <td width="12%">���</td>
	  <td width="5%">��������</td>
	  <td width="6%">��������</td>
	  <td width="5%">���ڲֿ�</td>
	  <td width="5%">���ڻ���</td>
	  <td width="5%">���ڻ�λ</td>

      <td width="4%">������λ</td>
	  <td width="5%">�������</td>
	  <td width="5%">����</td>
	  <td width="6%">�����</td>

    </tr>
	

	<%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

	String[] nbbmStr=new String[outStr.length-1];

	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][0].equals(""))
		{
			out.println("����!��"+i+"��[����]Ϊ��,����������Զ�������");
			break;
		}
		row++;

		int len=outStr[i].length;
		if (len<15)
		{
			out.println("�����������°�Excelģ��");
			return;
		}

		dqbm=outStr[i][0].trim();
		clbm=outStr[i][1].trim();
		nbbm=outStr[i][2].trim();
		clmc=outStr[i][3].trim();
		xh=outStr[i][4].trim();
		gg=outStr[i][5].trim();
		scph=outStr[i][6].trim();
		scrqStr=outStr[i][7].trim();
		ckbh=outStr[i][8].trim();
		hjbh=outStr[i][9].trim();
		hwbh=outStr[i][10].trim();
		jldwbm=outStr[i][11].trim();
		kcslStr=outStr[i][12].trim();
		rkjStr=outStr[i][13].trim();
		kcjeStr=outStr[i][14].trim();
 

		mark="";

		if (nbbm.equals(""))
		{
			out.println("�������к�["+row+"]����[�ڲ�����]Ϊ��");
			return;
		}

		sql=" select clbm" ;
		sql+=" from jxc_clbm " ;
		sql+=" where nbbm='"+nbbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			clbm = rs.getString(1);			    
		}
		rs.close();
		ps.close();



		int count=0;
		sql=" select count(*)" ;
		sql+=" from dm_dqbm " ;
		sql+=" where dqbm='"+dqbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			out.println("���������ϱ���["+clbm+"]���󣬲����ڵ�[��������]��"+dqbm);
			return;
		}

		sql=" select count(*)" ;
		sql+=" from jxc_cljgb " ;
		sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			out.println("<BR>�����ڲ��ϼ۸���У����ϱ���["+clbm+"]������");
			return;
		}

		sql=" select count(*)" ;
		sql+=" from jxc_ckmc " ;
		sql+=" where ckbh='"+ckbh+"' and dqbm='"+dqbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			out.println("���������ϱ���["+clbm+"]���󣬲����ڵ�[�ֿ���]��"+ckbh);
			return;
		}

		sql=" select count(*)" ;
		sql+=" from jxc_hjmc " ;
		sql+=" where ckbh='"+ckbh+"' and hjbh='"+hjbh+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			out.println("���������ϱ���["+clbm+"]���󣬲����ڵ�[���ܱ��]��"+hjbh);
			return;
		}

		if (!hwbh.equals(""))
		{
			sql=" select count(*)" ;
			sql+=" from jxc_hwmc " ;
			sql+=" where hwbh='"+hwbh+"' and hjbh='"+hjbh+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				count = rs.getInt(1);			    
			}
			rs.close();
			ps.close();

			if (count<1)
			{
				out.println("���������ϱ���["+clbm+"]���󣬲����ڵ�[���ڻ�λ]��"+hwbh);
				return;
			}
		}


		if (jldwbm.equals(""))
		{
			out.println("���������ϱ���["+clbm+"]����[������λ]Ϊ��");
			return;
		}
		else{
			sql=" select count(*)" ;
			sql+=" from jdm_jldwbm " ;
			sql+=" where jldwmc='"+jldwbm+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				count = rs.getInt(1);			    
			}
			rs.close();
			ps.close();

			if (count<1)
			{
				out.println("���������ϱ���["+clbm+"]���󣬲����ڵ�[������λ]��"+jldwbm);
				return;
			}
		}

		
		



		if (kcslStr.equals(""))
		{
			out.println("<BR>���������ϱ���["+clbm+"]����[�������]����Ϊ��");
			return;
		}
		else{
			try{
				kcsl=Double.parseDouble(kcslStr.trim());
			}
			catch (Exception e){
				out.println("<BR>���������ϱ���["+clbm+"]����[�������:"+kcslStr+"]��������:"+e);
				return;
			}
		}

		if (rkjStr.equals(""))
		{
			out.println("<BR>���������ϱ���["+clbm+"]����[����]����Ϊ��");
			return;
		}
		else{
			try{
				rkj=Double.parseDouble(rkjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>���������ϱ���["+clbm+"]����[����:"+rkjStr+"]��������:"+e);
				return;
			}
		}

		if (kcjeStr.equals(""))
		{
			out.println("<BR>���������ϱ���["+clbm+"]����[�����]����Ϊ��");
			return;
		}
		else{
			try{
				kcje=Double.parseDouble(kcjeStr.trim());
			}
			catch (Exception e){
				out.println("<BR>���������ϱ���["+clbm+"]����[�����:"+kcjeStr+"]��������:"+e);
				return;
			}
		}

		scrq=null;
		if (scrqStr!=null && !scrqStr.trim().equals(""))
		{
			try{
				scrq=java.sql.Date.valueOf(scrqStr.trim());
			}
			catch (Exception e) {
				out.print("<BR>���������ϱ���["+clbm+"]����[��������]�����ڣ�" + scrqStr);
				return;
			}
		}
		else{
			out.println("<BR>���������ϱ���["+clbm+"]����[��������]����Ϊ��");
			return;
		}

		if (scph==null || scph.trim().equals(""))
		{
			out.println("<BR>���������ϱ���["+clbm+"]����[��������]����Ϊ��");
			return;
		}

		allkcsl+=kcsl;
		allkcje+=kcje;

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=dqbm%>
        <input name="dqbm" type="hidden" value="<%=dqbm%>">
      </td>
      <td><%=clbm%>
        <input name="clbm" type="hidden" value="<%=clbm%>">
      </td>
      <td><%=nbbm%></td>
	  <td> <%=clmc%></td>
	  <td> <%=xh%></td>
      <td> <%=gg%></td>

      <td> <%=scph%>
        <input name="scph" type="hidden" value="<%=scph%>" >
      </td>
      <td> <%=scrq%>
        <input name="scrq" type="hidden" value="<%=scrq%>" >
      </td>
      <td ><%=ckbh%>
        <input name="ckbh" type="hidden" value="<%=ckbh%>" >
      </td>
      <td ><%=hjbh%>
        <input name="hjbh" type="hidden" value="<%=hjbh%>" >
      </td>
      <td ><%=hwbh%>
        <input name="hwbh" type="hidden" value="<%=hwbh%>" >
      </td>


      <td><%=jldwbm%></td>
      <td><%=kcsl%>
        <input name="kcsl" type="hidden" value="<%=kcsl%>" >
      </td>
      <td> <%=rkj%>
        <input name="rkj" type="hidden" value="<%=rkj%>" >
      </td>
      <td> <%=kcje%>
        <input name="kcje" type="hidden" value="<%=kcje%>" >
      </td>
    </tr>
    <%
	}


}
catch (Exception e) {
	out.print("<P>����ʧ�ܣ�Exception:" + e);
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
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td colspan="3">С ��</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><%=allkcsl%>
      </td>
      <td>&nbsp;</td>
      <td> <%=allkcje%>
      </td>
    </tr>

	<tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="����" onClick="f_do(editform)">
        <input type="reset"  value="����">
      �赼����Ŀ����<%=row%>
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
