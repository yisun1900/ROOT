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

String ppmc = null;
String dqbm = null;

String bjjbmc=null;
String dqmc=null;

String[][] outStr=null; 
String bgcolor=null;
String mark=null;

String tccpdlbm=null;
String cldlmc=null;
String tccplbbm=null;
String clxlmc=null;
String cpbm=null;
String sku=null;
String cpmc=null;
String xh=null;
String gg=null;
String jldw=null;
String xdjldw=null;
String xdbStr=null;
String djStr=null;
String sfkgdjStr=null;
String sfkgdj=null;
String jsfsStr=null;
String jsjStr=null;
String jsblStr=null;
String jjfsStr=null;
String shStr=null;
String gysmc=null;
String sfxclxs=null;
String sfxclxsStr=null;
String sfyx=null;
String sfyxStr=null;
String yxkssj=null;
String yxjzsj=null;
String cxjsjStr=null;
String cxjsblStr=null;


String sfycx=null;
String sfycxStr=null;
String cxkssj=null;
String cxjssj=null;
String cxjStr=null;
String jsfs=null;
String jjfs=null;

double xdb=0;
double dj=0;
double jsj=0;
double jsbl=0;
double cxjsj=0;
double cxjsbl=0;
double sh=0;
double cxj=0;

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

	ppmc =up.getParameter("ppmc");
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
    �����ײ����ı���
    <P><font color="#FF0000"><b>��ע�⣺</b></font>Ʒ��<font color="#FF0000"><b>[<%=ppmc%>]��</b></font><b>����</b><font color="#FF0000"><b>[<%=dqmc%>]
	 ��ע�⣺��Ҫ�ظ�����</b></font>
  </div>
	<input type="hidden" name="ppmc" value="<%=ppmc%>">
	<input type="hidden" name="dqbm" value="<%=dqbm%>">

  <table width="230%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="5%">Ʒ��</td>
      <td width="9%">��Ӧ��</td>
      <td width="4%">��Ʒ����</td>
      <td width="4%">��Ʒ���</td>
	  <td width="4%">��Ʒ����</td>
      <td width="7%">��Ʒ����</td>
      <td width="7%">�ͺ�</td>
      <td width="6%">���</td>
	  <td width="3%">���ۼ�����λ</td>
	  <td width="3%">�µ�������λ</td>
	  <td width="3%">�µ���</td>
	  <td width="3%">��ģ�%��</td>
	  <td width="3%">�Ƿ��账��С��</td>
	  <td width="3%">����</td>
	  <td width="2%">�Ƿ�ɸĵ���</td>
		<td  width="3%">���㷽ʽ</td>
		<td  width="2%">�����</td>
		<td  width="2%">�������</td>
		<td  width="3%">�Ƽ۷�ʽ</td>
		<td  width="2%">�Ƿ��д���</td>
		<td  width="3%">������ʼʱ��</td>
		<td  width="3%">��������ʱ��</td>
		<td  width="3%">������</td>
		<td  width="2%">���������</td>
		<td  width="2%">�����������</td>
		<td  width="3%">�Ƿ���Ч</td>
		<td  width="3%">��Ч��ʼʱ��</td>
		<td  width="3%">��Ч����ʱ��</td>
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
		if (len<26)
		{
			out.println("�����������°�Excelģ��");
			return;
		}

		ppmc=outStr[i][0].trim();
		gysmc=outStr[i][1].trim();
		cldlmc=outStr[i][2].trim();
		clxlmc=outStr[i][3].trim();
		cpbm=outStr[i][4].trim();
		cpmc=outStr[i][5].trim();
		xh=outStr[i][6].trim();
		gg=outStr[i][7].trim();
		jldw=outStr[i][8].trim();
		xdjldw=outStr[i][9].trim();
		xdbStr=outStr[i][10].trim();
		shStr=outStr[i][11].trim();
		sfxclxsStr=outStr[i][12].trim();
		djStr=outStr[i][13].trim();
		sfkgdjStr=outStr[i][14].trim();

		jsfsStr=outStr[i][15].trim();
		jsjStr=outStr[i][16].trim();
		jsblStr=outStr[i][17].trim();
		jjfsStr=outStr[i][18].trim();

		sfycxStr=outStr[i][19].trim();
		cxkssj=outStr[i][20].trim();
		cxjssj=outStr[i][21].trim();
		cxjStr=outStr[i][22].trim();
		cxjsjStr=outStr[i][23].trim();
		cxjsblStr=outStr[i][24].trim();

		sfyxStr=outStr[i][25].trim();
		yxkssj=outStr[i][26].trim();
		yxjzsj=outStr[i][27].trim();

		mark="";

		if (cpmc.equals(""))
		{
			out.println("��Ʒ����Ϊ�գ��������ݱ�����");
			return;
		}

		sql=" select cldlbm" ;
		sql+=" from jxc_cldlbm " ;
		sql+=" where cldlmc='"+cldlmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			tccpdlbm = rs.getString("cldlbm");			    
		}
		else{
			out.println("<BR>�к�["+row+"]���󣡲����ڵ�[��Ʒ����]��"+cldlmc);
//			return;
		}
		rs.close();
		ps.close();

		sql=" select clxlbm" ;
		sql+=" from jxc_clxlbm " ;
		sql+=" where clxlmc='"+clxlmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			tccplbbm = rs.getString("clxlbm");			    
		}
		else{
			out.println("<BR>�к�["+row+"]���󣡲����ڵ�[��Ʒ�������]:"+clxlmc);
//			return;
		}
		rs.close();
		ps.close();



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

		sql=" select jldwmc" ;
		sql+=" from jdm_jldwbm " ;
		sql+=" where jldwmc='"+xdjldw+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			xdjldw = rs.getString("jldwmc");			    
		}
		else{
			out.println("<BR>�к�["+row+"]���󣡲����ڵ�[�µ�������λ]��"+xdjldw);
//			return;
		}
		rs.close();
		ps.close();



		if (xdbStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[�µ���]����Ϊ��");
//			return;
		}
		else{
			try{
				xdb=Double.parseDouble(xdbStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[�µ���:"+xdbStr+"]��������:"+e);
//				return;
			}
		}
		if (shStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[���]����Ϊ��");
//			return;
		}
		else{
			try{
				sh=Double.parseDouble(shStr.trim());
				if (sh<0 || sh>100)
				{
					out.println("<BR>�к�["+row+"]����[���]ֻ����0��100֮�䣺"+shStr);
//					return;
				}
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[���:"+shStr+"]��������:"+e);
//				return;
			}
		}


		if (djStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[����]����Ϊ��");
//			return;
		}
		else{
			try{
				dj=Double.parseDouble(djStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[����:"+djStr+"]��������:"+e);
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

		if (jsblStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[�������]����Ϊ��");
//			return;
		}
		else{
			try{
				jsbl=Double.parseDouble(jsblStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[�������:"+jsblStr+"]��������:"+e);
//				return;
			}
		}


		if (sfkgdjStr.equals("�ɸ�"))
		{
			sfkgdj="Y";
		}
		else if (sfkgdjStr.equals("��"))
		{
			sfkgdj="N";
		}
		else{
			out.println("�к�["+row+"]����[�Ƿ�ɸĵ���]ֻ��Ϊ���ɸġ��񡿣�ĿǰΪ["+sfkgdjStr+"]");
//			return;
		}

		if (jsfsStr.equals("�����"))
		{
			jsfs="1";//1������ۣ�2���������
		}
		else if (jsfsStr.equals("�������"))
		{
			jsfs="2";
		}
		else{
			out.println("�к�["+row+"]����[���㷽ʽ]ֻ��Ϊ������ۡ������������ĿǰΪ["+jsfsStr+"]");
//			return;
		}

		if (jjfsStr.equals("�����"))
		{
			jjfs="1";//1����������������ۣ���2�����������������Ƽۣ���3���ײ�ѡ��
		}
		else if (jjfsStr.equals("�����Ƽ�"))
		{
			jjfs="2";
		}
		else if (jjfsStr.equals("�ײ�ѡ��"))
		{
			jjfs="3";
		}
		else{
			out.println("�к�["+row+"]����[���㷽ʽ]ֻ��Ϊ������ۡ������Ƽۡ��ײ�ѡ�䡿��ĿǰΪ["+jjfsStr+"]");
//			return;
		}


		if (sfxclxsStr.equals("����ȡ��"))
		{
			sfxclxs="1";
		}
		else if (sfxclxsStr.equals("����ȡ��"))
		{
			sfxclxs="2";
		}
		else if (sfxclxsStr.equals("4��5��"))
		{
			sfxclxs="3";
		}
		else if (sfxclxsStr.equals("������"))
		{
			sfxclxs="4";
		}
		else{
			out.println("�к�["+row+"]����[�Ƿ��账��С��]ֻ��Ϊ������ȡ��������ȡ����4��5�룻��������ĿǰΪ["+sfxclxsStr+"]");
//			return;
		}

		if (sfycxStr.equals("�д���"))//Y���д�����N���޴���
		{
			sfycx="Y";
		}
		else if (sfyxStr.equals("�޴���"))
		{
			sfycx="N";
		}
		else{
			sfycx="N";
			sfycxStr="�޴���";
		}

		if (sfycx.equals("Y"))
		{
			if (cxkssj.equals(""))
			{
				out.println("<BR>�к�["+row+"]����[������ʼʱ��]����Ϊ��");
//				return;
			}
			else{
				try{
					java.sql.Date.valueOf(cxkssj.trim());
				}
				catch (Exception e){
					out.println("<BR>�к�["+row+"]����[������ʼʱ��:"+cxkssj+"]��������:"+e);
//					return;
				}
			}

			if (cxjssj.equals(""))
			{
				out.println("<BR>�к�["+row+"]����[��������ʱ��]����Ϊ��");
//				return;
			}
			else{
				try{
					java.sql.Date.valueOf(cxjssj.trim());
				}
				catch (Exception e){
					out.println("<BR>�к�["+row+"]����[��������ʱ��:"+cxjssj+"]��������:"+e);
//					return;
				}
			}

			if (cxjStr.equals(""))
			{
				out.println("<BR>�к�["+row+"]����[������]����Ϊ��");
//				return;
			}
			else{
				try{
					cxj=Double.parseDouble(cxjStr.trim());
				}
				catch (Exception e){
					out.println("<BR>�к�["+row+"]����[������:"+cxjStr+"]��������:"+e);
//					return;
				}
			}
			if (cxjsjStr.equals(""))
			{
				out.println("<BR>�к�["+row+"]����[���������]����Ϊ��");
	//			return;
			}
			else{
				try{
					cxjsj=Double.parseDouble(cxjsjStr.trim());
				}
				catch (Exception e){
					out.println("<BR>�к�["+row+"]����[���������:"+cxjsjStr+"]��������:"+e);
	//				return;
				}
			}

			if (cxjsblStr.equals(""))
			{
				out.println("<BR>�к�["+row+"]����[�����������]����Ϊ��");
	//			return;
			}
			else{
				try{
					cxjsbl=Double.parseDouble(cxjsblStr.trim());
				}
				catch (Exception e){
					out.println("<BR>�к�["+row+"]����[�����������:"+cxjsblStr+"]��������:"+e);
	//				return;
				}
			}
		}
		else{
			cxkssj="";
			cxjssj="";
			cxjStr="";
			cxj=0;
			cxjsj=0;
			cxjsbl=0;
		}

		if (sfyxStr.equals("��Ч"))//1����Զ��Ч��2����Ч��3���׶���Ч
		{
			sfyx="2";
		}
		else if (sfyxStr.equals("�׶���Ч"))
		{
			sfyx="3";
		}
		else{
			sfyx="1";
			sfyxStr="��Զ��Ч";
		}

		if (sfyx.equals("3"))
		{
			if (yxkssj.equals(""))
			{
				out.println("<BR>�к�["+row+"]����[��Ч��ʼʱ��]����Ϊ��");
//				return;
			}
			else{
				try{
					java.sql.Date.valueOf(yxkssj.trim());
				}
				catch (Exception e){
					out.println("<BR>�к�["+row+"]����[��Ч��ʼʱ��:"+yxkssj+"]��������:"+e);
//					return;
				}
			}

			if (yxjzsj.equals(""))
			{
				out.println("<BR>�к�["+row+"]����[��Ч����ʱ��]����Ϊ��");
//				return;
			}
			else{
				try{
					java.sql.Date.valueOf(yxjzsj.trim());
				}
				catch (Exception e){
					out.println("<BR>�к�["+row+"]����[��Ч����ʱ��:"+yxjzsj+"]��������:"+e);
//					return;
				}
			}

		}
		else{
			yxkssj="";
			yxjzsj="";
		}


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td ><%=ppmc%>
      </td>
      <td ><%=gysmc%>
        <input name="gysmc" type="hidden" value="<%=gysmc%>" >
      </td>
      <td><%=cldlmc%>
        <input name="tccpdlbm" type="hidden" value="<%=tccpdlbm%>">
      </td>
      <td><%=clxlmc%>
        <input name="tccplbbm" type="hidden" value="<%=tccplbbm%>">
      </td>
      <td> <%=cpbm%>
        <input name="cpbm" type="hidden" value="<%=cpbm%>" >
      </td>
	  <td> <%=cpmc%>
        <input name="cpmc" type="hidden" value="<%=cpmc%>" >
      </td>
      <td><%=xh%>
        <input name="xh" type="hidden" value="<%=xh%>" >
      </td>
      <td><%=gg%>
        <input name="gg" type="hidden" value="<%=gg%>" >
      </td>
      <td><%=jldw%>
        <input name="jldw" type="hidden" value="<%=jldw%>" >
      </td>
      <td> <%=xdjldw%>
        <input name="xdjldw" type="hidden" value="<%=xdjldw%>" >
      </td>
      <td><%=xdb%>
        <input name="xdb" type="hidden" value="<%=xdb%>" >
      </td>
      <td ><%=sh%>
        <input name="sh" type="hidden" value="<%=sh%>" >
      </td>
      <td ><%=sfxclxsStr%>
        <input name="sfxclxs" type="hidden" value="<%=sfxclxs%>" >
      </td>
      <td><%=dj%>
        <input name="dj" type="hidden" value="<%=dj%>" >
      </td>
      <td><%=sfkgdjStr%>
        <input name="sfkgdj" type="hidden" value="<%=sfkgdj%>" >
      </td>
      <td><%=jsfsStr%>
        <input name="jsfs" type="hidden" value="<%=jsfs%>" >
      </td>
      <td><%=jsj%>
        <input name="jsj" type="hidden" value="<%=jsj%>" >
      </td>
      <td><%=jsbl%>
        <input name="jsbl" type="hidden" value="<%=jsbl%>" >
      </td>
      <td><%=jjfsStr%>
        <input name="jjfs" type="hidden" value="<%=jjfs%>" >
      </td>

      <td ><%=sfycxStr%>
        <input name="sfycx" type="hidden" value="<%=sfycx%>" >
      </td>
      <td ><%=cxkssj%>
        <input name="cxkssj" type="hidden" value="<%=cxkssj%>" >
      </td>
      <td ><%=cxjssj%>
        <input name="cxjssj" type="hidden" value="<%=cxjssj%>" >
      </td>
      <td ><%=cxjStr%>
        <input name="cxj" type="hidden" value="<%=cxj%>" >
      </td>
      <td><%=cxjsj%>
        <input name="cxjsj" type="hidden" value="<%=cxjsj%>" >
      </td>
      <td><%=cxjsbl%>
        <input name="cxjsbl" type="hidden" value="<%=cxjsbl%>" >
      </td>

      <td ><%=sfyxStr%>
        <input name="sfyx" type="hidden" value="<%=sfyx%>" >
      </td>
      <td ><%=yxkssj%>
        <input name="yxkssj" type="hidden" value="<%=yxkssj%>" >
      </td>
      <td ><%=yxjzsj%>
        <input name="yxjzsj" type="hidden" value="<%=yxjzsj%>" >
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
