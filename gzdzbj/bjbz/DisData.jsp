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

String oldbj=null;
String mark=null;
String bj=null;
String cbenj=null;
String sgdbj=null;
String dqmc=null;
String[][] outStr=null; 
String bgcolor=null;
String bjjbbm = null;
String bjjbmc=null;
String ls=null;
String dqbm=null;
String xmbh=null;
String xmmc=null;
String sfbxxstr=null;
String sfbxx=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
String gycl=null;
//********************************+++++++++++++++++++++
String clf=null;
String zcyl=null;//A����������
String zcdj=null;//A�����ĵ���
String zcf=null;//A�����ķ�
String rgf=null;//A���˹���
String jjf=null;//A����е��
String glfbl=null;//A������Ѱٷֱ�
String zcmc=null;//A����������
String zcgg=null;//A�����Ĺ��

String sfxyclstr=null;
String sfxycl=null;

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

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();



	//out.print(yhdlm);
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
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">
    <p>������ӱ��� </p>
    <p><font color="#FF0000"><b>��ע�⣺</b></font><b>���ۼ���</b><font color="#FF0000"><b>[<%=bjjbmc%>]��</b><b>����</b><font color="#FF0000"><b>[<%=dqmc%>]</b></font></p>
  </div>
	<input type="hidden" name="bjjbbm" value="<%=bjjbbm%>">
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
  <table width="180%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="2%">���</td>
	<td  width="5%">��Ŀ����</td>
	<td  width="6%">��ĿС��</td>
	<td  width="5%">��Ŀ���</td>
	<td  width="7%">��Ŀ����</td>
	<td  width="3%">�Ƿ��ѡ</td>
	<td  width="3%">������������λ</td>
	<td  width="5%">����</td>
	<td  width="4%">�ɱ���</td>
	<td  width="4%">ʩ���ӱ���</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="3%">�Ƿ���Ҫ����</td>
	<td  width="7%">��������</td>
	<td  width="7%">���Ĺ��</td>
	<td  width="4%">���ķ�</td>
	<td  width="4%">���ķ�</td>
	<td  width="3%">�˹���</td>
	<td  width="3%">��е��</td>
	<td  width="3%">����Ѱٷֱ�</td>
	<td  width="18%">��������������˵��</td>

    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(filename); 
	
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

		if (outStr[i][1].equals(""))
		{
			out.println("����!��"+i+"��[����]Ϊ��,����������Զ�������");
			break;
		}

		xmdlbm=outStr[i][0].trim();
		xmxlbm=outStr[i][1].trim();
		xmbh=outStr[i][2].trim();
		xmmc=outStr[i][3].trim();
		sfbxxstr=outStr[i][4].trim();
		jldwbm=outStr[i][5].trim();
		smbm=outStr[i][6].trim();
		cbenj=outStr[i][7].trim();
		sgdbj=outStr[i][8].trim();
		bj=outStr[i][9].trim();

		sfxyclstr=outStr[i][10].trim();
		zcmc=outStr[i][11].trim();
		zcgg=outStr[i][12].trim();
		zcf=outStr[i][13].trim();
		clf=outStr[i][14].trim();
		rgf=outStr[i][15].trim();
		jjf=outStr[i][16].trim();
		glfbl=outStr[i][17].trim();
		gycl=outStr[i][18].trim();

		oldbj="";
		mark="";

		sql=" select bj" ;
		sql+=" from bj_gzbjb " ;
		sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"'" ;
//		out.println(sql);
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			oldbj = rs.getString("bj");

			oldbj="<BR><font color=\"#FF0000\">��ԭ"+oldbj+"��</font>";
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
			out.println("�������������["+i+"]����Ŀ���["+xmbh+"]�����ڵ�[��Ŀ����]��"+xmdlbm);
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
			out.println("�������������["+i+"]����Ŀ���["+xmbh+"]�����ڵ�[��ĿС��]��"+xmxlbm);
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
				out.println("�������������["+i+"]�����ڵ�[����]��"+smbm);
				return;
			}
			rs.close();
			ps.close();
		}

		if (jldwbm.equals(""))
		{
			out.println("�������������["+i+"]����Ŀ���["+xmbh+"][������λ]Ϊ��");
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
				out.println("�������������["+i+"]����Ŀ���["+xmbh+"]�����ڵ�[������λ]��"+jldwbm);
				return;
			}
			rs.close();
			ps.close();
		}


		if (bj.equals(""))
		{
			out.println("�������������["+i+"]����Ŀ���["+xmbh+"][�ͻ�����]Ϊ��");
			return;
		}

		Double.parseDouble(bj);

		if (sfbxxstr.equals("��ѡ"))
		{
			sfbxxstr="<font color=\"#FF0000\">"+sfbxxstr+"</font>";
			sfbxx="1";
		}
		else if (sfbxxstr.equals("�Ǳ�ѡ"))
		{
			sfbxx="2";
		}
		else if (sfbxxstr.equals("����ѡ"))
		{
			sfbxxstr="<font color=\"#0000FF\">"+sfbxxstr+"</font>";
			sfbxx="3";
		}
		else{
			out.println("��������Ŀ���["+xmbh+"]����[�Ƿ��ѡ��]ֻ��Ϊ����ѡ���Ǳ�ѡ������ѡ��");
			return;
		}

		if (sfxyclstr.equals("��Ҫ"))
		{
			sfxycl="1";//1����Ҫ��2������Ҫ
		}
		else if (sfxyclstr.equals("����Ҫ"))
		{
			sfxycl="2";
		}
		else{
			out.println("��������Ŀ���["+xmbh+"]����[�Ƿ���Ҫ����]ֻ��Ϊ����Ҫ������Ҫ��");
			return;
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=row%> 
        <input name="xh" type="hidden" value="<%=row%>">
      </td>
      <td><%=outStr[i][0]%> 
        <input name="xmdlbm" type="hidden" value="<%=xmdlbm%>">
      </td>
      <td><%=outStr[i][1]%> 
        <input name="xmxlbm" type="hidden" value="<%=xmxlbm%>">
      </td>
      <td> <%=outStr[i][2]%><%=mark%>
        <input name="xmbh" type="hidden" value="<%=xmbh%>" >
      </td>
	  <td align="center"> <%=outStr[i][3]%>
        <input name="xmmc" type="hidden" value="<%=xmmc%>" >
      </td>
	  <td align="center"> <%=sfbxxstr%>
        <input name="sfbxx" type="hidden" value="<%=sfbxx%>" >
      </td>
      <td> <%=outStr[i][5]%>
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td> <%=outStr[i][6]%>
        <input name="smbm" type="hidden" value="<%=smbm%>" >
      </td>
	  <td> <%=outStr[i][7]%>
        <input name="cbenj" type="hidden" value="<%=cbenj%>" >
      </td>
	  <td> <%=outStr[i][8]%>
        <input name="sgdbj" type="hidden" value="<%=sgdbj%>" >
      </td>
      <td> <%=outStr[i][9]%><%=oldbj%>
        <input name="bj" type="hidden" value="<%=bj%>" >
      </td>
	  <td> <%=sfxyclstr%>
        <input name="sfxycl" type="hidden" value="<%=sfxycl%>" >
      </td>
      <td> <%=outStr[i][11]%>
        <input name="zcmc" type="hidden" value="<%=zcmc%>" >
      </td>
      <td> <%=outStr[i][12]%>
        <input name="zcgg" type="hidden" value="<%=zcgg%>" >
      </td>
      <td align="left"> <%=outStr[i][13]%>
        <input name="zcf" type="hidden" value="<%=zcf%>" >
      </td>
	  <td align="left"> <%=outStr[i][14]%>
        <input name="clf" type="hidden" value="<%=clf%>" >
      </td>
	  <td align="left"> <%=outStr[i][15]%>
        <input name="rgf" type="hidden" value="<%=rgf%>" >
      </td>
	  <td align="left"> <%=outStr[i][16]%>
        <input name="jjf" type="hidden" value="<%=jjf%>" >
      </td>
	  <td align="left"> <%=outStr[i][17]%>
        <input name="glfbl" type="hidden" value="<%=glfbl%>" >
      </td>
	  <td align="left"> <%=outStr[i][18]%>
        <input name="gycl" type="hidden" value="<%=gycl%>" >
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
		if (f != null) f.close(); 
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
	return true;
}
//-->
</SCRIPT>
