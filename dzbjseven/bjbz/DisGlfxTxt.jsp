<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������� </title>
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

String bjbbh = null;
String bjjbbm = null;
String dqbm=null;
String dqmc=null;
String wybh=null;
String xmbh=null;
String xmmc=null;

String getbjjbbm=null;
String bjjbmc=null;
String glflbm=null;
String glflmc=null;
String wlbm=null;
String glmc=null;
String pp=null;
String xh=null;
String gg=null;
String xl=null;
String jldwbm=null;
String jldwmc=null;
String xhlstr=null;
double xhl=0;
String djstr=null;
double dj=0;
String jqsflstr=null;
double jqsfl=0;
String bsflstr=null;
double bsfl=0;
String tvocsflstr=null;
double tvocsfl=0;
String wlllbz=null;
String wlllbzmc=null;
String bz=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	bjjbbm =up.getParameter("bjjbbm");
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

	sql=" select bjjbmc" ;
	sql+=" from bdm_bjjbbm " ;
	sql+=" where bjjbbm='"+bjjbbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		bjjbmc = rs.getString("bjjbmc");			    
	}
	else{
		out.println("���󣡱��ۼ��𲻴���");
		return;
	}
	rs.close();
	ps.close();

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
<form method="post" action="SaveDisGlfx.jsp" name="editform" target="_blank">
<div align="center">
    ���빤�Ϸ���
    <p><font color="#FF0000"><b>��ע�⣺</b></font><b>�汾��</b><font color="#FF0000"><b>[<%=bjbbh%>]</b></font><b>�����ۼ���</b><font color="#FF0000"><b>[<%=bjjbmc%>]��</b></font><b>����</b><font color="#FF0000"><b>[<%=dqmc%>]
	<BR>ϵͳ�Զ��Ѿ�����ɾ�������µ���������滻</b></font>
  </div>
	<input type="hidden" name="bjjbbm" value="<%=bjjbbm%>">
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
  	<input type="hidden" name="bjbbh" value="<%=bjbbh%>">
<table width="180%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
		<td width="4%">��Ŀ���</td>
		<td width="11%">��Ŀ����</td>

		<td width="3%">���Ϸ���</td>
		<td width="4%">�赽��������</td>
		<td width="5%">���ϱ���</td>
		<td width="10%">��������</td>
		<td width="7%">Ʒ��</td>
		<td width="6%">�ͺ�</td>
		<td width="6%">���</td>
		<td width="9%">ϵ��</td>
		<td  width="3%">��ȩ�ͷ���</td>
		<td  width="3%">���ͷ���</td>
		<td  width="3%">TVOC�ͷ���</td>
		<td width="3%">������λ</td>
		<td width="3%">����</td>
		<td width="3%">����</td>
		<td width="17%" align="left">��ע</td>
    </tr>
    <%
	//���ļ�
	outStr=cf.readTxt(filename,"\t"); 

	int row=0;

	for (int i=1;i<outStr.length ;i++ )
	{
		row++;
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		xmbh=outStr[i][0].trim();
		xmmc=outStr[i][1].trim();
		glflmc=outStr[i][2].trim();
		wlllbzmc=outStr[i][3].trim();
		wlbm=outStr[i][4].trim();
		glmc=outStr[i][5].trim();
		pp=outStr[i][6].trim();
		xh=outStr[i][7].trim();
		gg=outStr[i][8].trim();
		xl=outStr[i][9].trim();
		jqsflstr=outStr[i][10].trim();
		bsflstr=outStr[i][11].trim();
		tvocsflstr=outStr[i][12].trim();
		jldwmc=outStr[i][13].trim();
		xhlstr=outStr[i][14].trim();
		djstr=outStr[i][15].trim();
		bz=outStr[i][16].trim();

//		wlbm="0";




		String yxmmc="";
		if (xmbh.equals(""))
		{
			out.println("<BR>���������["+row+"]��Ŀ���["+xmbh+"]����[��Ŀ���]Ϊ��");
			return;
		}
		else{
			sql=" select xmmc" ;
			sql+=" from bj_jzbjb " ;
			sql+=" where xmbh='"+xmbh.trim()+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				yxmmc = rs.getString("xmmc");			    
			}
			else{
				out.println("���������["+row+"]��Ŀ���["+xmbh+"]���󣬲����ڵ�[��Ŀ���]��"+xmbh);
				return;
			}
			rs.close();
			ps.close();
		}

		if (xmmc.equals(""))
		{
			out.println("<BR>���������["+row+"]��Ŀ���["+xmbh+"]����[��Ŀ����]Ϊ��");
			return;
		}
		else{
			if (!yxmmc.trim().equals(xmmc.trim()))
			{
				out.println("<BR>���������["+row+"]��Ŀ���["+xmbh+"]���棬[��Ŀ����]���׼��һ�£���׼���ƣ�["+yxmmc+"]");
			}
		}
		if (glmc.equals(""))
		{
			out.println("<BR>���������["+row+"]��Ŀ���["+xmbh+"]����[��������]Ϊ��");
			return;
		}


		if (glflmc.equals(""))
		{
			out.println("<BR>���������["+row+"]��Ŀ���["+xmbh+"]����[���Ϸ���]Ϊ��");
			return;
		}
		else{
			sql=" select glflbm" ;
			sql+=" from bdm_glflbm " ;
			sql+=" where glflmc='"+glflmc.trim()+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				glflbm = rs.getString("glflbm");			    
			}
			else{
				out.println("<BR>���������["+row+"]��Ŀ���["+xmbh+"]���󣬲����ڵ�[���Ϸ���]��"+glflmc);
				return;
			}
			rs.close();
			ps.close();

			if (glflbm.equals("1"))
			{
				if (wlllbzmc.equals("��Ҫ"))
				{
					wlllbz="Y";
				}
				else if (wlllbzmc.equals("��"))
				{
					wlllbz="N";
				}
				else{
					wlllbz="N";
				}
			}
			else{
				wlllbz="";
				wlllbzmc="";
			}
		}

		if (jldwmc.equals(""))
		{
			out.println("<BR>���������["+row+"]��Ŀ���["+xmbh+"]����[������λ]Ϊ��");
			return;
		}
		else{
			sql=" select jldwbm" ;
			sql+=" from jdm_jldwbm " ;
			sql+=" where jldwmc='"+jldwmc.trim()+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				jldwbm = rs.getString("jldwbm");			    
			}
			else{
				out.println("<BR>���������["+row+"]��Ŀ���["+xmbh+"]���󣬲����ڵ�[������λ]��"+jldwmc);
				return;
			}
			rs.close();
			ps.close();
		}

		if (xhlstr.trim().equals(""))
		{
			out.println("<BR>���������["+row+"]��Ŀ���["+xmbh+"]����[������]Ϊ��");
			return;
		}
		else{
			xhl=Double.parseDouble(xhlstr.trim());
		}

		if (djstr.trim().equals(""))
		{
//			out.println("<BR>���������["+row+"]��Ŀ���["+xmbh+"]����[����]Ϊ��");
//			return;
		}
		else{
			dj=Double.parseDouble(djstr.trim());
		}

		if (jqsflstr.trim().equals(""))
		{
			out.println("<BR>���������["+row+"]��Ŀ���["+xmbh+"]����[��ȩ�ͷ���]Ϊ��");
			return;
		}
		else{
			jqsfl=Double.parseDouble(jqsflstr.trim());
		}

		if (bsflstr.trim().equals(""))
		{
			out.println("<BR>���������["+row+"]��Ŀ���["+xmbh+"]����[���ͷ���]Ϊ��");
			return;
		}
		else{
			bsfl=Double.parseDouble(bsflstr.trim());
		}

		if (tvocsflstr.trim().equals(""))
		{
			out.println("<BR>���������["+row+"]��Ŀ���["+xmbh+"]����[TVOC�ͷ���]Ϊ��");
			return;
		}
		else{
			tvocsfl=Double.parseDouble(tvocsflstr.trim());
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=xmbh%>
        <input name="xmbh" type="hidden" value="<%=xmbh%>" >
      </td>
      <td><%=xmmc%>
      </td>
      <td><%=glflmc%>
        <input name="glflbm" type="hidden" value="<%=glflbm%>" >
      </td>
      <td><%=wlllbzmc%>
        <input name="wlllbz" type="hidden" value="<%=wlllbz%>" >
      </td>
      <td><%=wlbm%>
        <input name="wlbm" type="hidden" value="<%=wlbm%>" >
      </td>
      <td><%=glmc%>
        <input name="glmc" type="hidden" value="<%=glmc%>" >
      </td>
      <td><%=pp%>
        <input name="pp" type="hidden" value="<%=pp%>" >
      </td>
      <td><%=xh%>
        <input name="xh" type="hidden" value="<%=xh%>" >
      </td>
      <td><%=gg%>
        <input name="gg" type="hidden" value="<%=gg%>" >
      </td>
      <td><%=xl%>
        <input name="xl" type="hidden" value="<%=xl%>" >
      </td>
      <td><%=jqsfl%>
        <input name="jqsfl" type="hidden" value="<%=jqsfl%>" >
      </td>
      <td><%=bsfl%>
        <input name="bsfl" type="hidden" value="<%=bsfl%>" >
      </td>
      <td><%=tvocsfl%>
        <input name="tvocsfl" type="hidden" value="<%=tvocsfl%>" >
      </td>
      <td><%=jldwmc%>
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td><%=xhl%>
        <input name="xhl" type="hidden" value="<%=xhl%>" >
      </td>
      <td><%=dj%>
        <input name="dj" type="hidden" value="<%=dj%>" >
      </td>
      <td  align="left"><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
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
        <input type="button"  value="����" onClick="f_do(editform)" name="bc">
        <input type="reset"  value="�������" onClick="bc.disabled=false;">
        <input type="reset"  value="����">
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
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
