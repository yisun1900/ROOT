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
String bjjbbm = null;
String dqbm = null;

String bjjbmc=null;
String dqmc=null;
String jzbzmc=null;

String[][] outStr=null; 
String bgcolor=null;

String fxmbh=null;
String fxmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String xmbh=null;
String xmmc=null;
String smbm=null;
String jldwbm=null;
String bj=null;
String clbj=null;
String zcf=null;
String rgbj=null;
String ysf=null;
String jxbj=null;
String shf=null;
String qtf=null;
String oldbj=null;
String mark=null;
String gycl=null;
String flmcgg=null;
String bz=null;

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

	bjbbh =up.getParameter("bjbbh");
	bjjbbm =up.getParameter("bjjbbm");
	dqbm =up.getParameter("dqbm");

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
<form method="post" action="SaveLoadCfData.jsp" name="editform" target="_blank">
<div align="center">
    <p>�����ֱ��� </p>
    <p><font color="#FF0000"><b>��ע�⣺</b></font><b>���ۼ���</b><font color="#FF0000"><b>[<%=bjjbmc%>]��</b></font><b>����</b><font color="#FF0000"><b>[<%=dqmc%>]
	<BR>����Ŀ�Ѵ��ڣ�������滻�������������</b></font></p>
  </div>
	<input type="hidden" name="bjbbh" value="<%=bjbbh%>">
	<input type="hidden" name="bjjbbm" value="<%=bjjbbm%>">
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
  <table width="200%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	  <td width="4%"><font color="#CC0000">����Ŀ���*</font></td>
      <td width="9%">����Ŀ����</td>
      <td width="5%">��Ŀ����</td>
      <td width="5%">��ĿС��</td>
	  <td width="4%"><font color="#CC0000">����Ŀ���*</font></td>
      <td width="9%">����Ŀ����</td>
      <td width="4%">����</td>
      <td width="3%">������λ</td>
	  <td width="4%"><font color="#CC0000">����Ԥ���*</font></td>
	  <td width="3%"><font color="#CC0000">���ķ�*</font></td>
	  <td width="3%"><font color="#CC0000">���ķ�*</font></td>
	  <td width="3%"><font color="#CC0000">�˹���*</font></td>
	  <td width="3%"><font color="#CC0000">�����*</font></td>
	  <td width="3%"><font color="#CC0000">��е��*</font></td>
	  <td width="3%"><font color="#CC0000">��ķ�*</font></td>
	  <td width="3%"><font color="#CC0000">������*</font></td>
      <td width="12%">��������������˵��</td>
      <td width="12%">�������ƹ��</td>
      <td width="8%">��ע</td>

	</tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

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

		if (outStr[i][0].equals(""))
		{
			out.println("����!��"+i+"��[����]Ϊ��,����������Զ�������");
			break;
		}

		fxmbh=outStr[i][0].trim();
		fxmmc=outStr[i][1].trim();
		xmdlbm=outStr[i][2].trim();
		xmxlbm=outStr[i][3].trim();
		xmbh=outStr[i][4].trim();
		xmmc=outStr[i][5].trim();
		smbm=outStr[i][6].trim();
		jldwbm=outStr[i][7].trim();
		bj=outStr[i][8].trim();
		clbj=outStr[i][9].trim();
		zcf=outStr[i][10].trim();
		rgbj=outStr[i][11].trim();
		ysf=outStr[i][12].trim();
		jxbj=outStr[i][13].trim();
		shf=outStr[i][14].trim();
		qtf=outStr[i][15].trim();
		gycl=outStr[i][16].trim();
		flmcgg=outStr[i][17].trim();
		bz=outStr[i][18].trim();

		oldbj="";
		mark="";

		if (xmbh.equals(""))
		{
			out.println("�������к�["+row+"]������Ŀ���Ϊ��");
			return;
		}

		sql=" select bj" ;
		sql+=" from bj_jzbjcfb " ;
		sql+=" where dqbm='"+dqbm+"' and fxmbh='"+fxmbh+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			oldbj = rs.getDouble("bj")+"";

			if (!oldbj.equals(bj))
			{
				oldbj="<BR><font color=\"#FF0000\">��ԭ"+oldbj+"��</font>";
			}
			else{
				oldbj="";
			}

			mark="<BR><font color=\"#FF0000\">���Ѵ��ڣ�</font>";
		}
		rs.close();
		ps.close();


		sql=" select xmdlbm" ;
		sql+=" from bdm_xmdlbm " ;
		sql+=" where xmdlmc='"+xmdlbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			xmdlbm = rs.getString("xmdlbm");			    
		}
		else{
			out.println("��������Ŀ���["+xmbh+"]���󣬲����ڵ�[��Ŀ����]��"+xmdlbm);
			return;
		}
		rs.close();
		ps.close();

		sql=" select xmxlbm" ;
		sql+=" from bdm_xmxlbm " ;
		sql+=" where xmxlmc='"+xmxlbm+"' and xmdlbm='"+xmdlbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			xmxlbm = rs.getString("xmxlbm");			    
		}
		else{
			out.println("��������Ŀ���["+xmbh+"]���󣬲����ڵ�[��ĿС��]��"+xmxlbm);
			return;
		}
		rs.close();
		ps.close();


		if (!smbm.equals(""))
		{
			sql=" select smbm" ;
			sql+=" from bdm_smbm " ;
			sql+=" where smmc='"+smbm+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				smbm = rs.getString("smbm");			    
			}
			else{
				out.println("��������Ŀ���["+xmbh+"]���󣬲����ڵ�[����]��"+smbm);
				return;
			}
			rs.close();
			ps.close();
		}

		if (jldwbm.equals(""))
		{
			out.println("��������Ŀ���["+xmbh+"]����[������λ]Ϊ��");
			return;
		}
		else{
			sql=" select jldwbm" ;
			sql+=" from jdm_jldwbm " ;
			sql+=" where jldwmc='"+jldwbm+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				jldwbm = rs.getString("jldwbm");			    
			}
			else{
				out.println("��������Ŀ���["+xmbh+"]���󣬲����ڵ�[������λ]��"+jldwbm);
				return;
			}
			rs.close();
			ps.close();
		}


		if (bj.equals(""))
		{
			out.println("��������Ŀ���["+xmbh+"]����[����Ԥ���]Ϊ��");
			return;
		}

		Double.parseDouble(bj);

		if (clbj.equals(""))
		{
			out.println("��������Ŀ���["+xmbh+"]����[���Ϸ�]Ϊ��");
			return;
		}
		Double.parseDouble(clbj);

		if (clbj.equals(""))
		{
			out.println("��������Ŀ���["+xmbh+"]����[���Ϸ�]Ϊ��");
			return;
		}

		Double.parseDouble(clbj);

		if (rgbj.equals(""))
		{
			out.println("��������Ŀ���["+xmbh+"]����[�˹���]Ϊ��");
			return;
		}

		Double.parseDouble(rgbj);

		if (jxbj.equals(""))
		{
			out.println("��������Ŀ���["+xmbh+"]����[��е��]Ϊ��");
			return;
		}

		Double.parseDouble(jxbj);

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=fxmbh%> 
        <input name="fxmbh" type="hidden" value="<%=fxmbh%>">
      </td>
      <td><%=fxmmc%> 
        <input name="fxmmc" type="hidden" value="<%=fxmmc%>">
      </td>
      </td>
      <td><%=outStr[i][2]%> 
        <input name="xmdlbm" type="hidden" value="<%=xmdlbm%>">
      </td>
      <td><%=outStr[i][3]%> 
        <input name="xmxlbm" type="hidden" value="<%=xmxlbm%>">
      </td>
      <td> <%=outStr[i][4]%><%=mark%>
        <input name="xmbh" type="hidden" value="<%=xmbh%>" >
      </td>
	  <td align="center"> <%=outStr[i][5]%>
        <input name="xmmc" type="hidden" value="<%=xmmc%>" >
      </td>
      <td> <%=outStr[i][6]%>
        <input name="smbm" type="hidden" value="<%=smbm%>" >
      </td>
      <td> <%=outStr[i][7]%>
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td> <%=outStr[i][8]%><%=oldbj%>
        <input name="bj" type="hidden" value="<%=bj%>" >
      </td>
      <td> <%=clbj%>
        <input name="clbj" type="hidden" value="<%=clbj%>" >
      </td>
      <td> <%=zcf%>
        <input name="zcf" type="hidden" value="<%=zcf%>" >
      </td>
      <td> <%=rgbj%>
        <input name="rgbj" type="hidden" value="<%=rgbj%>" >
      </td>
      <td> <%=ysf%>
        <input name="ysf" type="hidden" value="<%=ysf%>" >
      </td>
      <td> <%=jxbj%>
			<input name="jxbj" type="hidden" value="<%=jxbj%>" >
      </td>
      <td> <%=shf%>
			<input name="shf" type="hidden" value="<%=shf%>" >
      </td>
      <td> <%=qtf%>
			<input name="qtf" type="hidden" value="<%=qtf%>" >
      </td>
      <td align="left"> <%=gycl%>
        <input name="gycl" type="hidden" value="<%=gycl%>" >
      </td>
      <td align="left"> <%=flmcgg%>
        <input name="flmcgg" type="hidden" value="<%=flmcgg%>" >
      </td>
      <td align="left"> <%=bz%>
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
