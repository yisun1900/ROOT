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

String dqbm = null;
String dqmc=null;

String[][] outStr=null; 
String bgcolor=null;

String tcmc=null;
String jgwzbm=null;
String cpmc=null;
String xh=null;
String gg=null;
String ppmc=null;
String gysmc=null;
String jldw=null;
String ydjStr=null;
String tcdjStr=null;
String sjzjStr=null;
String jsjStr=null;
String bz=null;

double ydj=0;
double tcdj=0;
double sjzj=0;
double jsj=0;

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
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">
    <p>�����ײͱ�׼������Ŀ</p>
    <p><font color="#FF0000"><b>��ע�⣺</b></font> <b>����</b><font color="#FF0000"><b>[<%=dqmc%>]
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">

  <table width="160%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCCC" align="center"> 
	  <td width="4%">�ײ�����</td>
	  <td width="4%">����λ��</td>
      <td width="9%">��Ʒ����</td>
      <td width="9%">�ͺ�</td>
      <td width="9%">���</td>
      <td width="6%">Ʒ��</td>
      <td width="11%">��Ӧ������</td>
      <td width="3%">������λ</td>
      <td width="4%">ԭ����</td>
      <td width="4%">�ײ͵���</td>
      <td width="4%">�����ۼ�</td>
      <td width="4%">�����</td>
      <td width="19%">��ע</td>
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
		if (len<7)
		{
			out.println("�����������°�Excelģ��");
			return;
		}

		tcmc=outStr[i][0].trim();
		jgwzbm=outStr[i][1].trim();
		cpmc=outStr[i][2].trim();
		xh=outStr[i][3].trim();
		gg=outStr[i][4].trim();
		ppmc=outStr[i][5].trim();
		gysmc=outStr[i][6].trim();
		jldw=outStr[i][7].trim();
		ydjStr=outStr[i][8].trim();
		tcdjStr=outStr[i][9].trim();
		sjzjStr=outStr[i][10].trim();
		jsjStr=outStr[i][11].trim();
		bz=outStr[i][12].trim();


		if (cpmc.equals(""))
		{
			out.println("�к�["+row+"]����[��Ʒ����]Ϊ��");
			return;
		}


		int count=0;
		sql=" select count(*)" ;
		sql+=" from bdm_jgwzbm " ;
		sql+=" where jgwzmc='"+jgwzbm+"'" ;
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
			out.println("�к�["+row+"]���󣡲����ڵ�[����λ��]��"+jgwzbm);
//			return;
		}


		sql=" select ppmc" ;
		sql+=" from jxc_ppxx " ;
		sql+=" where ppmc='"+ppmc+"' and pplb in('1','3')" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			ppmc = rs.getString("ppmc");			    
		}
		else{
			out.println("<BR>�к�["+row+"]���󣡲����ڵ�[Ʒ��]��"+ppmc);
//			return;
		}
		rs.close();
		ps.close();

		sql=" select tcmc" ;
		sql+=" from bj_cltcmc " ;
		sql+=" where dqbm='"+dqbm+"' and tcmc='"+tcmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			tcmc = rs.getString("tcmc");			    
		}
		else{
			out.println("<BR>�к�["+row+"]���󣡲����ڵ�[�ײ�����]��"+tcmc);
//			return;
		}
		rs.close();
		ps.close();


		sql=" select gysmc" ;
		sql+=" from jxc_gysxx " ;
		sql+=" where gysmc='"+gysmc+"' and jxc_gysxx.dqbm='"+dqbm+"' and jxc_gysxx.sfhz='Y' and jxc_gysxx.cllx in('1','3')" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			gysmc = rs.getString("gysmc");			    
		}
		else{
			out.println("<BR>�к�["+row+"]���󣡲����ڵ�[��Ӧ��]��"+gysmc);
//			return;
		}
		rs.close();
		ps.close();

		sql=" select jldwmc" ;
		sql+=" from jdm_jldwbm " ;
		sql+=" where jldwmc='"+jldw+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			jldw = rs.getString("jldwmc");			    
		}
		else{
			out.println("<BR>�к�["+row+"]���󣡲����ڵ�[���ۼ�����λ]��"+jldw);
//			return;
		}
		rs.close();
		ps.close();

		if (ydjStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[ԭ����]����Ϊ��");
//			return;
		}
		else{
			try{
				ydj=Double.parseDouble(ydjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[ԭ����:"+ydjStr+"]��������:"+e);
//				return;
			}
		}
		if (tcdjStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[�ײ͵���]����Ϊ��");
//			return;
		}
		else{
			try{
				tcdj=Double.parseDouble(tcdjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[�ײ͵���:"+tcdjStr+"]��������:"+e);
//				return;
			}
		}
		if (sjzjStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[�����ۼ�]����Ϊ��");
//			return;
		}
		else{
			try{
				sjzj=Double.parseDouble(sjzjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[�����ۼ�:"+sjzjStr+"]��������:"+e);
//				return;
			}
		}
		if (jsjStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[�����]����Ϊ��");
//			return;
		}
		else{
			try{
				jsj=Double.parseDouble(jsjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[�����:"+jsjStr+"]��������:"+e);
//				return;
			}
		}


	  %> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=tcmc%>
        <input name="tcmc" type="hidden" value="<%=tcmc%>">
      </td>
      <td><%=jgwzbm%>
        <input name="jgwzbm" type="hidden" value="<%=jgwzbm%>">
      </td>
      <td><%=cpmc%>
        <input name="cpmc" type="hidden" value="<%=cpmc%>">
      </td>
      <td><%=xh%>
        <input name="xh" type="hidden" value="<%=xh%>" >
      </td>
      <td><%=gg%>
        <input name="gg" type="hidden" value="<%=gg%>" >
      </td>
      <td><%=ppmc%>
        <input name="ppmc" type="hidden" value="<%=ppmc%>" >
      </td>
      <td><%=gysmc%>
        <input name="gysmc" type="hidden" value="<%=gysmc%>" >
      </td>
      <td><%=jldw%>
        <input name="jldw" type="hidden" value="<%=jldw%>" >
      </td>
      <td><%=ydjStr%>
        <input name="ydj" type="hidden" value="<%=ydj%>" >
      </td>
      <td><%=tcdjStr%>
        <input name="tcdj" type="hidden" value="<%=tcdj%>" >
      </td>
      <td><%=sjzjStr%>
        <input name="sjzj" type="hidden" value="<%=sjzj%>" >
      </td>
      <td><%=jsjStr%>
        <input name="jsj" type="hidden" value="<%=jsj%>" >
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
