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
String xmbh=null;
String xmmc=null;

String getbjjbbm=null;
String bjjbmc=null;
String glflbm=null;
String glflmc=null;
String lx=null;
String lxstr=null;
String glfxclbm=null;
String glfxclmc=null;
String xl=null;

String xhlstr=null;
double xhl=0;
String wlllbz=null;
String wlllbzmc=null;
String bz=null;

String jldwbm="";
String jldwmc="";
String pp="";
String xh="";
String gg="";
double dj=0;

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
		<td width="2%">���</td>
		<td width="4%">��Ŀ���</td>
		<td width="11%">��Ŀ����</td>

		<td width="3%">���Ϸ���</td>
		<td width="4%">�赽��������</td>
		<td width="5%">���ϱ���</td>
		<td width="10%">��������</td>
		<td width="7%"><font color="#0000FF">Ʒ��</font></td>
		<td width="6%"><font color="#0000FF">�ͺ�</font></td>
		<td width="8%"><font color="#0000FF">���</font></td>
		<td width="3%">������λ</td>
		<td width="4%">����</td>
		<td width="4%"><font color="#0000FF">����</font></td>
		<td  width="3%">����</td>
		<td width="17%" align="left">��ע</td>
    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

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

		int len=outStr[i].length;
		if (len<10)
		{
			out.println("�����������°�Excelģ��");
			return;
		}

		xmbh=outStr[i][0].trim();
		xmmc=outStr[i][1].trim();
		glflmc=outStr[i][2].trim();
		wlllbzmc=outStr[i][3].trim();
		glfxclbm=outStr[i][4].trim();
		glfxclmc=outStr[i][5].trim();
		jldwmc=outStr[i][6].trim();
		xhlstr=outStr[i][7].trim();
		lxstr=outStr[i][8].trim();
		bz=outStr[i][9].trim();


		String yxmmc="";
		if (xmbh.equals(""))
		{
			out.println("<BR>���������["+row+"]��Ŀ���["+xmbh+"]����[��Ŀ���]Ϊ��");
			return;
		}
		else{
			sql=" select xmmc" ;
			sql+=" from bj_jzbjb " ;
			sql+=" where xmbh='"+xmbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				yxmmc = rs.getString("xmmc");			    
			}
			else{
				out.println("<BR>���󣡣������["+row+"]��Ŀ���["+xmbh+"]�������ڵ�[��Ŀ���]��"+xmbh);
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
			if (!yxmmc.equals(xmmc))
			{
				xmmc=yxmmc;
				out.println("<BR>���棡���["+row+"]��Ŀ���["+xmbh+"]��[��Ŀ����]����ȷ��ϵͳ�Զ���������ȷ���ƣ�["+yxmmc+"]");
			}
		}



		if (glflmc.equals(""))
		{
			out.println("<BR>���������["+row+"]��Ŀ���["+xmbh+"]����[���Ϸ���]Ϊ��");
			return;
		}
		else{
			sql=" select glflbm" ;
			sql+=" from bdm_glflbm " ;
			sql+=" where glflmc='"+glflmc+"'" ;
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

			if (glflbm.equals("1"))//����
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


		if (glfxclmc.equals(""))
		{
			out.println("<BR>���������["+row+"]��Ŀ���["+xmbh+"]����[��������]Ϊ��");
			return;
		}


		String getclmc="";
		String getjldwbm="";
		pp="";
		xh="";
		gg="";
		dj=0;

		if (glflbm.equals("1"))//����
		{
			if (glfxclbm.equals(""))
			{
				out.println("<BR>���󣡣������["+row+"]��Ŀ���["+xmbh+"]��[���ϱ���]Ϊ��");
				return;
			}

			sql=" select clmc,jldwbm,cbj,ppmc,xh,gg" ;
			sql+=" FROM jxc_clbm,jxc_cljgb ";
			sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm ";
			sql+=" and jxc_cljgb.dqbm='"+dqbm+"'";
			sql+=" and jxc_clbm.nbbm='"+glfxclbm+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				getclmc = rs.getString("clmc");			    
				getjldwbm = rs.getString("jldwbm");			    
				dj = rs.getDouble("cbj");			    
				pp = rs.getString("ppmc");			    
				xh = rs.getString("xh");			    
				gg = rs.getString("gg");			    
			}
			else{
				out.println("<BR>���󣡣������["+row+"]��Ŀ���["+xmbh+"]�������ڵ�[���ϱ���]��"+glfxclbm);
				return;
			}
			rs.close();
			ps.close();

			if (!getclmc.equals(glfxclmc))
			{
				glfxclmc=getclmc;
				out.println("<BR>���棡���["+row+"]��Ŀ���["+xmbh+"]��[��������]����ȷ��ϵͳ�Զ���������ȷ���ƣ�["+getclmc+"]");
			}
			if (!getjldwbm.equals(jldwmc))
			{
				jldwmc=getjldwbm;
				out.println("<BR>���棡���["+row+"]��Ŀ���["+xmbh+"]��[������λ]����ȷ��ϵͳ�Զ���������ȷ���ƣ�["+getjldwbm+"]");
			}
		}


		if (lxstr.equals("��ӡ"))//1����ӡ��2������ӡ
		{
			lx="1";
		}
		else if (lxstr.equals("����ӡ"))
		{
			lx="2";
		}
		else{
			lx="1";
		}

		if (jldwmc.equals(""))
		{
			out.println("<BR>���������["+row+"]��Ŀ���["+xmbh+"]����[������λ]Ϊ��");
			return;
		}
		else{
			sql=" select jldwbm" ;
			sql+=" from jdm_jldwbm " ;
			sql+=" where jldwmc='"+jldwmc+"'" ;
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

		if (xhlstr.equals(""))
		{
			out.println("<BR>���������["+row+"]��Ŀ���["+xmbh+"]����[������]Ϊ��");
			return;
		}
		else{
			xhl=Double.parseDouble(xhlstr);
		}



		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
       <td><%=i%>      </td>
     <td><%=xmbh%>
        <input name="xmbh" type="hidden" value="<%=xmbh%>" >      </td>
      <td><%=xmmc%>      </td>
      <td><%=glflmc%>
        <input name="glflbm" type="hidden" value="<%=glflbm%>" >      </td>
      <td><%=wlllbzmc%>
        <input name="wlllbz" type="hidden" value="<%=wlllbz%>" >      </td>
      <td><%=glfxclbm%>
        <input name="glfxclbm" type="hidden" value="<%=glfxclbm%>" >      </td>
      <td><%=glfxclmc%>
        <input name="glfxclmc" type="hidden" value="<%=glfxclmc%>" >      </td>
      <td><%=pp%></td>
      <td><%=xh%></td>
      <td><%=gg%></td>
      <td><%=jldwmc%>
        <input name="jldwbm" type="hidden" value="<%=jldwmc%>" >      </td>
      <td><%=xhl%>
        <input name="xhl" type="hidden" value="<%=xhl%>" >      </td>
      <td><%=dj%></td>
      <td><%=lxstr%>
        <input name="lx" type="hidden" value="<%=lx%>" >      </td>
      <td  align="left"><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >      </td>
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
        <input type="reset"  value="����">      </td>
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
