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

String cldlbm=null;
String clxlbm=null;
String nbbm=null;
String clmc=null;
String xh=null;
String gg=null;
String jldwbm=null;

String cbjstr=null;
String dfgsjgstr=null;
String dgzjgstr=null;
String xsfsstr=null;
String xsfs=null;
String zxqdlstr=null;
String sfcy=null;
String sfcystr=null;
String gysmc=null;

String mark=null;


double cbj=0;
double dfgsjg=0;
double dgzjg=0;
double zxqdl=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;
String dqbm = null;
String dqmc = null;

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

	sql=" select dqmc" ;
	sql+=" from dm_dqbm " ;
	sql+=" where dqbm='"+dqbm+"'" ;//0�����ģ�1������
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		dqmc = rs.getString(1);			    
	}
	rs.close();
	ps.close();

	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">ά���������ϼ۸񣨵�����<%=dqmc%>��</div>
  <table width="160%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="6%">���ϴ���</td>
	<td  width="11%">����С��</td>
	<td  width="6%">�ڲ�����</td>
	<td  width="11%">��������</td>
	<td  width="9%">�ͺ�</td>
	<td  width="9%">���</td>
	<td  width="4%">������λ</td>
      <td width="5%">�ɱ���</td>
      <td width="5%">�Էֹ�˾��</td>
      <td width="5%">�Թ�����</td>
      <td width="5%">���۷�ʽ</td>
      <td width="5%">��С����</td>
      <td width="4%">�Ƿ���</td>
      <td width="15%">��Ӧ��</td>
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
		if (len<10)
		{
			out.println("�����������°�Excelģ��");
			return;
		}

		cldlbm=outStr[i][0].trim();
		clxlbm=outStr[i][1].trim();
		nbbm=outStr[i][2].trim();
		clmc=outStr[i][3].trim();


		xh=outStr[i][4].trim();
		gg=outStr[i][5].trim();
		jldwbm=outStr[i][6].trim();

		cbjstr=outStr[i][7].trim();
		dfgsjgstr=outStr[i][8].trim();
		dgzjgstr=outStr[i][9].trim();
		xsfsstr=outStr[i][10].trim();
		zxqdlstr=outStr[i][11].trim();
		sfcystr=outStr[i][12].trim();
		gysmc=outStr[i][13].trim();

		mark="";

		if (nbbm.equals(""))
		{
			out.println("�������к�["+row+"]�����ڲ�����Ϊ��");
			return;
		}


		int count=0;
		sql=" select count(*)" ;
		sql+=" from jxc_clbm,jxc_cljgb " ;
		sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.nbbm='"+nbbm+"' and jxc_cljgb.dqbm='"+dqbm+"' and jxc_clbm.cllb='1'" ;//0�����ģ�1������
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
			out.println("�����������ڲ�����["+nbbm+"]������");
			return;
		}

		count=0;
		sql=" select count(*)" ;
		sql+=" from jxc_cldlbm " ;
		sql+=" where cldlmc='"+cldlbm+"' and cldllb in('2','3')" ;
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
			out.println("�������ڲ�����["+nbbm+"]���󣬲����ڵ�[���ϴ���]��"+cldlbm);
			return;
		}

		sql=" select count(*)" ;
		sql+=" from jxc_clxlbm " ;
		sql+=" where clxlmc='"+clxlbm+"' and cldlmc='"+cldlbm+"'" ;
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
			out.println("�������ڲ�����["+nbbm+"]���󣬲����ڵ�[����С��]��"+clxlbm);
			return;
		}



		if (jldwbm.equals(""))
		{
			out.println("�������ڲ�����["+nbbm+"]����[������λ]Ϊ��");
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
				out.println("�������ڲ�����["+nbbm+"]���󣬲����ڵ�[������λ]��"+jldwbm);
				return;
			}
		}


	
		if (cbjstr.equals(""))
		{
			cbj=0;
		}
		else{
			try{
				cbj=Double.parseDouble(cbjstr.trim());
			}
			catch (Exception e){
				out.println("<BR>�������ڲ�����["+nbbm+"]����[�ɱ���:"+cbjstr+"]��������:"+e);
				return;
			}
		}

		if (cbj==0)
		{
			out.println("<P>�ڲ�����["+nbbm+"]���ѣ��ɱ���Ϊ0");
		}



		if (dfgsjgstr.equals(""))
		{
			dfgsjg=0;
		}
		else{
			try{
				dfgsjg=Double.parseDouble(dfgsjgstr.trim());
			}
			catch (Exception e){
				out.println("<BR>�������ڲ�����["+nbbm+"]����[�Էֹ�˾��:"+dfgsjgstr+"]��������:"+e);
				return;
			}
		}
		if (dgzjgstr.equals(""))
		{
			dgzjg=0;
		}
		else{
			try{
				dgzjg=Double.parseDouble(dgzjgstr.trim());
			}
			catch (Exception e){
				out.println("<BR>�������ڲ�����["+nbbm+"]����[�Թ�����:"+dgzjgstr+"]��������:"+e);
				return;
			}
		}
		if (dgzjg==0)
		{
			out.println("<P>�ڲ�����["+nbbm+"]���ѣ��Թ�����Ϊ0");
		}

		if (xsfsstr.equals("����Ʒ"))
		{
			xsfs="1";
		}
		else if (xsfsstr.equals("�ֻ�����"))
		{
			xsfs="2";
		}
		else if (xsfsstr.equals("�ڻ�����"))
		{
			xsfs="3";
		}
		else if (xsfsstr.equals("��������"))
		{
			xsfs="4";
		}
		else{
			out.println("�������ڲ�����["+nbbm+"]����[�ɹ����]ֻ��Ϊ������Ʒ���ֻ����ۣ��ڻ����ۣ��������⡿��ĿǰΪ["+xsfsstr+"]");
			return;
		}

		if (zxqdlstr.equals(""))
		{
			zxqdl=0;
		}
		else{
			try{
				zxqdl=Double.parseDouble(zxqdlstr.trim());
			}
			catch (Exception e){
				out.println("<BR>�������ڲ�����["+nbbm+"]����[��С����:"+zxqdlstr+"]��������:"+e);
				return;
			}
		}

		if (sfcystr.equals("��"))
		{
			sfcy="Y";
		}
		else if (sfcystr.equals("��"))
		{
			sfcy="N";
		}
		else{
			out.println("�������ڲ�����["+nbbm+"]����[�ɹ����]ֻ��Ϊ���ǡ��񡿣�ĿǰΪ["+sfcystr+"]");
			return;
		}

		if (gysmc.equals(""))
		{
			out.println("�������ڲ�����["+nbbm+"]����[��Ӧ��]Ϊ��");
			return;
		}
		else{
			sql=" select count(*)" ;
			sql+=" from jxc_gysxx " ;
			sql+=" where gysmc='"+gysmc+"' and cllx in('2','3')" ;
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
				out.println("�������ڲ�����["+nbbm+"]���󣬲����ڵ�[��Ӧ��]��"+gysmc);
				return;
			}
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=cldlbm%>
        <input name="cldlbm" type="hidden" value="<%=cldlbm%>">
      </td>
      <td><%=clxlbm%>
        <input name="clxlbm" type="hidden" value="<%=clxlbm%>">
      </td>
      <td> <%=nbbm%><%=mark%>
        <input name="nbbm" type="hidden" value="<%=nbbm%>" >
      </td>
	  <td align="center"> <%=clmc%>
        <input name="clmc" type="hidden" value="<%=clmc%>" >
      </td>
	  <td align="center"> <%=xh%>
        <input name="xh" type="hidden" value="<%=xh%>" >
      </td>
      <td> <%=gg%>
        <input name="gg" type="hidden" value="<%=gg%>" >
      </td>
      <td><%=jldwbm%>
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td ><%=cbj%>
        <input name="cbj" type="hidden" value="<%=cbj%>" >
      </td>
      <td ><%=dfgsjg%>
        <input name="dfgsjg" type="hidden" value="<%=dfgsjg%>" >
      </td>
      <td ><%=dgzjg%>
        <input name="dgzjg" type="hidden" value="<%=dgzjg%>" >
      </td>
      <td ><%=xsfsstr%>
        <input name="xsfs" type="hidden" value="<%=xsfs%>" >
      </td>
      <td ><%=zxqdl%>
        <input name="zxqdl" type="hidden" value="<%=zxqdl%>" >
      </td>
      <td ><%=sfcystr%>
        <input name="sfcy" type="hidden" value="<%=sfcy%>" >
      </td>
      <td ><%=gysmc%>
        <input name="gysmc" type="hidden" value="<%=gysmc%>" >
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
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
		<input type="hidden" name="dqbm"  value="<%=dqbm%>" >
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
