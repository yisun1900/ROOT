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
String jgwzbm=null;
String clxlmc=null;
String jldw=null;
String slStr=null;
String kbwlbm=null;
String kbcpbm=null;
String cpmc=null;
String xh=null;
String bz=null;
String djStr=null;
String sfkthStr=null;
String sfkscStr=null;
String sfkth=null;
String sfksc=null;

double sl=0;
double dj=0;

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
<form method="post" action="SaveLoadDataZc.jsp" name="editform" target="_blank">
<div align="center">
    <p>�ײͱ�׼������Ŀ</p>
    <p><font color="#FF0000"><b>��ע�⣺</b></font><b>�汾��</b><font color="#FF0000"><b>[<%=bjbbh%>]</b></font><b>��</b><b>����</b><font color="#FF0000"><b>[<%=dqmc%>]
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
	<input type="hidden" name="bjbbh" value="<%=bjbbh%>">


  <table width="110%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="6%">���ۼ���</td>
	<td  width="6%">����</td>
	<td  width="5%">�ṹλ��</td>
	<td  width="6%">�Ʊ����ϱ���</td>
	<td  width="9%">�Ʊ���Ʒ����</td>
	<td  width="12%">��Ʒ����</td>
	<td  width="12%">�ͺ�</td>
	<td  width="5%">������λ</td>
	<td  width="6%">��������</td>
	<td  width="8%">����</td>
	<td  width="7%">�Ƿ���滻</td>
	<td  width="7%">�Ƿ��ɾ��</td>
	<td  width="46%">��ע</td>
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

		bjjbmc=outStr[i][0].trim();
		hxmc=outStr[i][1].trim();
		jgwzbm=outStr[i][2].trim();
		kbwlbm=outStr[i][3].trim();
		kbcpbm=outStr[i][4].trim();
		cpmc=outStr[i][5].trim();
		xh=outStr[i][6].trim();
		jldw=outStr[i][7].trim();
		slStr=outStr[i][8].trim();
		djStr=outStr[i][9].trim();
		sfkthStr=outStr[i][10].trim();
		sfkscStr=outStr[i][11].trim();
		bz=outStr[i][12].trim();

		if (jgwzbm.equals(""))
		{
			out.println("�к�["+row+"]���󣡽ṹλ��Ϊ��");
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

		sql=" select jgwzmc" ;
		sql+=" from bdm_jgwzbm " ;
		sql+=" where jgwzmc='"+jgwzbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			jgwzbm = rs.getString("jgwzmc");			    
		}
		else{
			out.println("�к�["+row+"]���󣡲����ڵ�[�ṹλ��]��"+jgwzbm);
			return;
		}
		rs.close();
		ps.close();

		int count=0;
		sql="select count(*)";
		sql+=" from  tckb_zck";
		sql+=" where kbwlbm='"+kbwlbm+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			out.println("<BR>�к�["+row+"]���󣡲����ڵ�[�Ʊ����ϱ���]��"+kbwlbm);
//			return;
		}

		String getkbcpbm="";
		String getcpmc="";
		String getxh="";
		sql="select kbcpbm,cpmc,xh";
		sql+=" from  tckb_zck";
		sql+=" where kbwlbm='"+kbwlbm+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getkbcpbm=cf.fillNull(rs.getString("kbcpbm"));
			getcpmc=cf.fillNull(rs.getString("cpmc"));
			getxh=cf.fillNull(rs.getString("xh"));
		}
		rs.close();
		ps.close();

		if (!getkbcpbm.equals(kbcpbm))
		{
			out.println("<BR>�к�["+row+"]����[�Ʊ���Ʒ����]����ȷ��ӦΪ��"+getkbcpbm);
//			return;
		}

		if (!getcpmc.equals(cpmc))
		{
			out.println("<BR>�к�["+row+"]���ѣ�[��Ʒ����]����ȷ��ӦΪ��"+getcpmc);
//			return;
		}

		if (!getxh.equals(xh))
		{
			out.println("<BR>�к�["+row+"]���ѣ�[�ͺ�]����ȷ��ӦΪ��"+getxh);
//			return;
		}



		sl=0;
		if (slStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[��������]����Ϊ��");
			return;
		}
		else{
			try{
				sl=Double.parseDouble(slStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[��������:"+slStr+"]��������:"+e);
				return;
			}
		}

		if (djStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[����]����Ϊ��");
			return;
		}
		else{
			try{
				dj=Double.parseDouble(djStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[����:"+djStr+"]��������:"+e);
				return;
			}
		}

		if (sl==0)
		{
			slStr="";
		}
		if (dj==0)
		{
			djStr="";
		}

		if (sfkthStr.equals("�������滻"))
		{
			sfkth="Y";
		}
		else if (sfkthStr.equals("�����滻"))
		{
			sfkth="N";
		}
		else if (sfkthStr.equals("ͬ���滻"))
		{
			sfkth="T";
		}
		else{
			out.println("�к�["+row+"]����[�Ƿ���滻]ֻ��Ϊ���������滻�������滻��ͬ���滻����ĿǰΪ["+sfkthStr+"]");
			return;
		}

		if (sfkscStr.equals("��ɾ��"))
		{
			sfksc="Y";
		}
		else if (sfkscStr.equals("��"))
		{
			sfksc="N";
		}
		else{
			out.println("�к�["+row+"]����[�Ƿ��ɾ��]ֻ��Ϊ����ɾ�����񡿣�ĿǰΪ["+sfkscStr+"]");
			return;
		}
%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=bjjbmc%>
        <input name="bjjbbm" type="hidden" value="<%=bjjbbm%>" >
      </td>
      <td><%=hxmc%>
        <input name="hxbm" type="hidden" value="<%=hxbm%>">
      </td>
      <td><%=jgwzbm%>
        <input name="jgwzbm" type="hidden" value="<%=jgwzbm%>">
      </td>
      <td><%=kbwlbm%>
        <input name="kbwlbm" type="hidden" value="<%=kbwlbm%>" >
      </td>
      <td><%=kbcpbm%>
        <input name="kbcpbm" type="hidden" value="<%=kbcpbm%>">
      </td>
      <td><%=cpmc%>
      </td>
      <td><%=xh%>
      </td>
      </td>
      <td><%=jldw%>
        <input name="jldw" type="hidden" value="<%=jldw%>" >
      </td>
      <td><%=slStr%>
        <input name="sl" type="hidden" value="<%=sl%>" >
      </td>
      <td><%=djStr%>
        <input name="dj" type="hidden" value="<%=dj%>" >
      </td>
      <td><%=sfkthStr%>
        <input name="sfkth" type="hidden" value="<%=sfkth%>" >
      </td>
      <td><%=sfkscStr%>
        <input name="sfksc" type="hidden" value="<%=sfksc%>" >
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
