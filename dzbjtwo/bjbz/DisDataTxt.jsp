<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*'%>
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

String bjbbh = null;
String bjjbbm = null;
String dqbm = null;

String bjjbmc=null;
String dqmc=null;
String jzbzmc=null;

String[][] outStr=null; 
String bgcolor=null;
String xmdlbm=null;
String xmxlbm=null;
String xmbh=null;
String xmmc=null;
String sfbxxstr=null;
String sfbxx=null;
String smbm=null;
String jldwbm=null;
String bjStr=null;
String clbjStr=null;
String rgbjStr=null;
String jxbjStr=null;
String sgdbjStr=null;
String mark=null;
String gycl=null;
String flmcgg=null;
String bz=null;
String glxmbh=null;
String xh=null;
String sfxycl=null;
String sfxyclstr=null;
String sfxyyjd=null;
String sfxyyjdstr=null;

double oldbj=0;
double bj=0;
double clbj=0;
double rgbj=0;
double jxbj=0;
double sgdbj=0;

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
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">
    <p>������ӱ��� </p>
    <p><font color="#FF0000"><b>��ע�⣺</b></font><b>�汾��</b><font color="#FF0000"><b>[<%=bjbbh%>]</b></font><b>�����ۼ���</b><font color="#FF0000"><b>[<%=bjjbmc%>]��</b></font><b>����</b><font color="#FF0000"><b>[<%=dqmc%>]
	<BR>����Ŀ�Ѵ��ڣ�������滻�������������</b></font></p>
  </div>
	<input type="hidden" name="bjjbbm" value="<%=bjjbbm%>">
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
	<input type="hidden" name="bjbbh" value="<%=bjbbh%>">
  <table width="240%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="3%">��Ŀ����</td>
      <td width="4%">��ĿС��</td>
	  <td width="5%"><font color="#CC0000">��Ŀ���*</font></td>
      <td width="10%">��Ŀ����</td>
      <td width="2%">�Ƿ��ѡ</td>
      <td width="4%">����</td>
      <td width="2%">������λ</td>
	  <td width="3%"><font color="#CC0000">����Ԥ���*</font></td>
	  <td width="3%"><font color="#CC0000">���ķ�*</font></td>
	  <td width="3%"><font color="#CC0000">�˹���*</font></td>
	  <td width="3%"><font color="#CC0000">��е��*</font></td>
	  <td width="3%"><font color="#CC0000">���̻�������*</font></td>
      <td width="21%"><font color="#CC0000">��������������˵��*</font></td>
      <td width="13%">�������ƹ��</td>
      <td width="9%">��ע</td>
      <td width="6%">������Ŀ���</td>
      <td width="2%">�������</td>
      <td width="2%">�Ƿ���Ҫ����</td>
      <td width="2%">�Ƿ���Ԥ����</td>
    </tr>
    <%
	//���ļ�
	outStr=cf.readTxt(filename,"\t"); 

	String[] xmbhStr=new String[outStr.length-1];

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
		if (len<19)
		{
			out.println("�����������°�Excelģ��");
			return;
		}

		xmdlbm=outStr[i][0].trim();
		xmxlbm=outStr[i][1].trim();
		xmbh=outStr[i][2].trim();

		xmbhStr[i-1]=xmbh;

		xmmc=outStr[i][3].trim();
		sfbxxstr=outStr[i][4].trim();
		smbm=outStr[i][5].trim();
		jldwbm=outStr[i][6].trim();
		bjStr=outStr[i][7].trim();
		clbjStr=outStr[i][8].trim();
		rgbjStr=outStr[i][9].trim();
		jxbjStr=outStr[i][10].trim();
		sgdbjStr=outStr[i][11].trim();
		gycl=outStr[i][12].trim();
		flmcgg=outStr[i][13].trim();
		bz=outStr[i][14].trim();
		glxmbh=outStr[i][15].trim();
		xh=outStr[i][16].trim();
		sfxyclstr=outStr[i][17].trim();
		sfxyyjdstr=outStr[i][18].trim();

		mark="";

		if (xmbh.equals(""))
		{
			out.println("�������к�["+row+"]������Ŀ���Ϊ��");
			return;
		}



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


		if (bjStr.equals(""))
		{
			bj=0;
		}
		else{
			try{
				bj=Double.parseDouble(bjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>����������[����Ԥ���:"+bjStr+"]��������:"+e);
				return;
			}
		}
		if (bj==0)
		{
			out.println("<P>���ѣ���Ŀ���["+xmbh+"][����Ԥ���]Ϊ0");
		}

		if (clbjStr.equals(""))
		{
			clbj=0;
		}
		else{
			try{
				clbj=Double.parseDouble(clbjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>[���ķ�:"+clbjStr+"]��������:"+e);
				return;
			}
		}

		if (rgbjStr.equals(""))
		{
			rgbj=0;
		}
		else{
			try{
				rgbj=Double.parseDouble(rgbjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>[�˹���:"+rgbjStr+"]��������:"+e);
				return;
			}
		}

		if (jxbjStr.equals(""))
		{
			jxbj=0;
		}
		else{
			try{
				jxbj=Double.parseDouble(jxbjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>[��е��:"+jxbjStr+"]��������:"+e);
				return;
			}
		}

		if (sgdbjStr.equals(""))
		{
			sgdbj=0;
		}
		else{
			try{
				sgdbj=Double.parseDouble(sgdbjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>[���̻�������:"+sgdbjStr+"]��������:"+e);
				return;
			}
		}

		if (cf.round(clbj+rgbj+jxbj,2)!=0)//���ã����ķѡ��˹��ѡ���е��,����
		{
			if (bj!=cf.round(clbj+rgbj+jxbj,2))
			{
				out.println("<P>������������Ŀ���["+xmbh+"][����Ԥ��ۣ�"+bj+"]������(���ķ�+�˹���+��е��:"+cf.round(clbj+rgbj+jxbj,2)+")");
				return;
			}
		}

		oldbj=0;
		String oldbjStr="";
		sql=" select bj" ;
		sql+=" from bj_jzbjb " ;
		sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			oldbj = rs.getDouble("bj");

			if (oldbj!=bj)
			{
				oldbjStr="<BR><font color=\"#FF0000\">��ԭ"+oldbj+"��</font>";
			}
			else{
				oldbjStr="";
			}

			mark="<BR><font color=\"#FF0000\">���Ѵ��ڣ�</font>";
		}
		rs.close();
		ps.close();

		if (!xh.equals(""))
		{
			Double.parseDouble(xh);
		}

		if (sfbxxstr.equals("�ر���"))
		{
			sfbxxstr="<font color=\"#FF0000\">"+sfbxxstr+"</font>";
			sfbxx="1";
		}
		else if (sfbxxstr.equals("������"))
		{
			sfbxxstr="<font color=\"#CC00CC\">"+sfbxxstr+"</font>";
			sfbxx="2";
		}
		else if (sfbxxstr.equals("��ѡ��"))
		{
			sfbxx="3";
		}
		else if (sfbxxstr.equals("������"))
		{
			sfbxxstr="<font color=\"#0000FF\">"+sfbxxstr+"</font>";
			sfbxx="9";
		}
		else{
			out.println("��������Ŀ���["+xmbh+"]����[�Ƿ��ѡ��]ֻ��Ϊ���ر���������ѡ��������ĿǰΪ["+sfbxxstr+"]");
			return;
		}

		if (sfxyclstr.equals(""))
		{
			sfxycl="N";
		}
		else if (sfxyclstr.equals("��Ҫ"))
		{
			sfxycl="Y";
		}
		else if (sfxyclstr.equals("��"))
		{
			sfxycl="N";
		}
		else{
			out.println("��������Ŀ���["+xmbh+"]����[�Ƿ���Ҫ����]ֻ��Ϊ����Ҫ���񡿣�ĿǰΪ["+sfxyclstr+"]");
			return;
		}

		if (sfxyyjdstr.equals(""))
		{
			sfxyyjd="N";
		}
		else if (sfxyyjdstr.equals("��Ҫ"))
		{
			sfxyyjd="Y";
		}
		else if (sfxyyjdstr.equals("��"))
		{
			sfxyyjd="N";
		}
		else{
			out.println("��������Ŀ���["+xmbh+"]����[�Ƿ���Ԥ����]ֻ��Ϊ����Ҫ���񡿣�ĿǰΪ["+sfxyyjdstr+"]");
			return;
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=outStr[i][0]%> 
        <input name="xmdlbm" type="hidden" value="<%=xmdlbm%>">
      </td>
      <td><%=outStr[i][1]%> 
        <input name="xmxlbm" type="hidden" value="<%=xmxlbm%>">
      </td>
      <td> <%=xmbh%><%=mark%>
        <input name="xmbh" type="hidden" value="<%=xmbh%>" >
      </td>
	  <td align="center"> <%=xmmc%>
        <input name="xmmc" type="hidden" value="<%=xmmc%>" >
      </td>
	  <td align="center"> <%=sfbxxstr%>
        <input name="sfbxx" type="hidden" value="<%=sfbxx%>" >
      </td>
      <td> <%=outStr[i][5]%>
        <input name="smbm" type="hidden" value="<%=smbm%>" >
      </td>
      <td> <%=outStr[i][6]%>
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td> <%=bj%><%=oldbjStr%>
        <input name="bj" type="hidden" value="<%=bj%>" >
      </td>
      <td> <%=clbj%>
        <input name="clbj" type="hidden" value="<%=clbj%>" >
      </td>
      <td> <%=rgbj%>
        <input name="rgbj" type="hidden" value="<%=rgbj%>" >
      </td>
      <td> <%=jxbj%>
        <input name="jxbj" type="hidden" value="<%=jxbj%>" >
      </td>
      <td> <%=sgdbj%>
        <input name="sgdbj" type="hidden" value="<%=sgdbj%>" >
      </td>
      <td align="left"><%=gycl%>
        <input name="gycl" type="hidden" value="<%=gycl%>" >
      </td>
      <td align="left"><%=flmcgg%>
        <input name="flmcgg" type="hidden" value="<%=flmcgg%>" >
      </td>
      <td align="left"><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
      </td>
      <td ><%=glxmbh%>
        <input name="glxmbh" type="hidden" value="<%=glxmbh%>" >
      </td>
      <td ><%=xh%>
        <input name="xh" type="hidden" value="<%=xh%>" >
      </td>
      <td ><%=sfxyclstr%>
        <input name="sfxycl" type="hidden" value="<%=sfxycl%>" >
      </td>
      <td ><%=sfxyyjdstr%>
        <input name="sfxyyjd" type="hidden" value="<%=sfxyyjd%>" >
      </td>
    </tr>
    <%
	}

	int cfxh=0;
	for (int i=0;i<row ;i++ )
	{
		for (int j=i+1;j<row ;j++ )
		{
			if (xmbhStr[i].equals(xmbhStr[j]))
			{
				cfxh++;
				out.println("<BR>"+cfxh+":���ѣ���Ŀ����ظ���"+xmbhStr[i]);
			}
		}
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
