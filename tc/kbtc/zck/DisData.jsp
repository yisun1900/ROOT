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
String mark=null;

String bjjbbm = null;
String bjjbmc=null;
String kbcpbm=null;
String kbwlbm=null;

String cpdl=null;
String cpxl=null;
String cpbm=null;
String cpmc=null;
String xh=null;
String gg=null;
String jldw=null;
String xdjldw=null;
String xdbStr=null;
String jsjStr=null;
String lsjStr=null;
String sjjStr=null;
String cllxStr=null;
String cllx=null;
String cptz=null;
String czlx=null;
String cpks=null;
String cplx=null;

String shStr=null;
String xuhao=null;
String ppmc=null;
String gysmc=null;
String sfxclxs=null;
String sfxclxsStr=null;
String sfyx=null;
String sfyxStr=null;
String yxkssj=null;
String yxjzsj=null;
String sfkgdjStr=null;
String sfkgdj=null;


double xdb=0;
double jsj=0;
double lsj=0;
double sjj=0;
double sh=0;

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
    �����ײ����ı���
    <p><font color="#FF0000"><b>��ע�⣺</b></font><b>����</b><font color="#FF0000"><b>[<%=dqmc%>]
	��ע�⣺��Ҫ�ظ�����</b></font>
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">

  <table width="280%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="3%">���ۼ���</td>
      <td width="3%">�Ʊ���Ʒ����</td>
      <td width="3%">�Ʊ����ϱ���</td>
      <td width="4%">Ʒ��</td>
      <td width="8%">��Ӧ��</td>
      <td width="4%">��Ʒ����</td>
      <td width="4%">��ƷС��</td>
	  <td width="3%">��Ʒ����</td>
      <td width="6%">��Ʒ����</td>
      <td width="5%">�ͺ�</td>
      <td width="5%">���</td>
      <td width="7%">��Ʒ����</td>
      <td width="5%">��������</td>
      <td width="5%">��Ʒ��ʽ</td>
      <td width="4%">��Ʒ����</td>
	  <td width="2%">���ۼ�����λ</td>
	  <td width="2%">�µ�������λ</td>
	  <td width="2%">�µ���</td>
	  <td width="2%">��ģ�%��</td>
	  <td width="2%">�Ƿ��账��С��</td>
	  <td width="2%">�����</td>
	  <td width="2%">���ۼ�</td>
	  <td width="2%">���ڼ�</td>
	  <td width="2%">��������</td>
	<td  width="2%">�Ƿ���Ч</td>
	<td  width="3%">��Ч��ʼʱ��</td>
	<td  width="3%">��Ч����ʱ��</td>
      <td width="2%">����</td>
      <td width="2%">�Ƿ�ɸĵ���</td>
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
		if (len<22)
		{
			out.println("�����������°�Excelģ��"+len);
			return;
		}

		bjjbmc=outStr[i][0].trim();
		kbcpbm=outStr[i][1].trim();
		kbwlbm=outStr[i][2].trim();
		ppmc=outStr[i][3].trim();
		gysmc=outStr[i][4].trim();
		cpdl=outStr[i][5].trim();
		cpxl=outStr[i][6].trim();
		cpbm=outStr[i][7].trim();
		cpmc=outStr[i][8].trim();
		xh=outStr[i][9].trim();
		gg=outStr[i][10].trim();


		cptz=outStr[i][11].trim();
		czlx=outStr[i][12].trim();
		cpks=outStr[i][13].trim();
		cplx=outStr[i][14].trim();
		jldw=outStr[i][15].trim();
		xdjldw=outStr[i][16].trim();
		xdbStr=outStr[i][17].trim();
		shStr=outStr[i][18].trim();
		sfxclxsStr=outStr[i][19].trim();
		jsjStr=outStr[i][20].trim();

		lsjStr=outStr[i][21].trim();
		sjjStr=outStr[i][22].trim();
		cllxStr=outStr[i][23].trim();
		sfyxStr=outStr[i][24].trim();
		yxkssj=outStr[i][25].trim();
		yxjzsj=outStr[i][26].trim();
		xuhao=outStr[i][27].trim();
		sfkgdjStr=outStr[i][28].trim();

		mark="";

		if (cpmc.equals(""))
		{
			out.println("��Ʒ����Ϊ�գ��������ݱ�����");
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
			out.println("���󣡱��ۼ��𲻴���");
			return;
		}
		rs.close();
		ps.close();



		sql=" select cldlmc" ;
		sql+=" from jxc_cldlbm " ;
		sql+=" where cldlmc='"+cpdl+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			cpdl = rs.getString("cldlmc");			    
		}
		else{
			out.println("<BR>�к�["+row+"]���󣡲����ڵ�[��Ʒ����]��"+cpdl);
//			return;
		}
		rs.close();
		ps.close();

		sql=" select clxlmc" ;
		sql+=" from jxc_clxlbm " ;
		sql+=" where cldlmc='"+cpdl+"' and clxlmc='"+cpxl+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			cpxl = rs.getString("clxlmc");			    
		}
		else{
			out.println("<BR>�к�["+row+"]���󣡲����ڵ�[��ƷС������]:"+cpxl);
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


		jsj=0;
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

		lsj=0;
		if (lsjStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[���ۼ�]����Ϊ��");
//			return;
		}
		else{
			try{
				lsj=Double.parseDouble(lsjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[���ۼ�:"+lsjStr+"]��������:"+e);
//				return;
			}
		}

		sjj=0;
		if (sjjStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[���ڼ�]����Ϊ��");
//			return;
		}
		else{
			try{
				sjj=Double.parseDouble(sjjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[���ڼ�:"+sjjStr+"]��������:"+e);
//				return;
			}
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
			out.println("<BR>�к�["+row+"]����[�Ƿ��账��С��]ֻ��Ϊ������ȡ��������ȡ����4��5�룻����������ĿǰΪ["+sfxclxsStr+"]");
//			return;
		}

		if (sfyxStr.equals("ֹͣ����"))//1���������ۣ�2��ֹͣ���ۣ�3���׶����ۣ�4����ǰ��ʵ
		{
			sfyx="2";
		}
		else if (sfyxStr.equals("�׶�����"))
		{
			sfyx="3";
		}
		else if (sfyxStr.equals("��ǰ��ʵ"))
		{
			sfyx="4";
		}
		else{
			sfyx="1";
			sfyxStr="��������";
		}

		if (sfyx.equals("3"))
		{
			if (yxkssj.equals(""))
			{
				out.println("<BR>�к�["+row+"]����[��Ч��ʼʱ��]����Ϊ��");
				return;
			}
			else{
				try{
					java.sql.Date.valueOf(yxkssj.trim());
				}
				catch (Exception e){
					out.println("<BR>�к�["+row+"]����[��Ч��ʼʱ��:"+yxkssj+"]��������:"+e);
					return;
				}
			}

			if (yxjzsj.equals(""))
			{
				out.println("<BR>�к�["+row+"]����[��Ч����ʱ��]����Ϊ��");
				return;
			}
			else{
				try{
					java.sql.Date.valueOf(yxjzsj.trim());
				}
				catch (Exception e){
					out.println("<BR>�к�["+row+"]����[��Ч����ʱ��:"+yxjzsj+"]��������:"+e);
					return;
				}
			}

		}
		else{
			yxkssj="";
			yxjzsj="";
		}

		if (cllxStr.equals("���ڲ�Ʒ"))
		{
			cllx="1";
		}
		else if (cllxStr.equals("�����Ʒ"))
		{
			cllx="2";
		}
		else{
			out.println("<BR>�к�["+row+"]����[��������]ֻ��Ϊ�����ڲ�Ʒ�������Ʒ����ĿǰΪ["+cllxStr+"]");
//			return;
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
			sfkgdjStr="��";
			sfkgdj="N";
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td ><%=bjjbmc%>
        <input name="bjjbbm" type="hidden" value="<%=bjjbbm%>" >
      </td>
      <td ><%=kbcpbm%>
        <input name="kbcpbm" type="hidden" value="<%=kbcpbm%>" >
      </td>
      <td ><%=kbwlbm%>
        <input name="kbwlbm" type="hidden" value="<%=kbwlbm%>" >
      </td>
      <td ><%=ppmc%>
        <input name="ppmc" type="hidden" value="<%=ppmc%>" >
      </td>
      <td ><%=gysmc%>
        <input name="gysmc" type="hidden" value="<%=gysmc%>" >
      </td>
      <td><%=cpdl%>
        <input name="cpdl" type="hidden" value="<%=cpdl%>">
      </td>
      <td><%=cpxl%>
        <input name="cpxl" type="hidden" value="<%=cpxl%>">
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
      <td><%=cptz%>
        <input name="cptz" type="hidden" value="<%=cptz%>" >
      </td>
      <td><%=czlx%>
        <input name="czlx" type="hidden" value="<%=czlx%>" >
      </td>
      <td><%=cpks%>
        <input name="cpks" type="hidden" value="<%=cpks%>" >
      </td>
      <td><%=cplx%>
        <input name="cplx" type="hidden" value="<%=cplx%>" >
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
      <td><%=jsj%>
        <input name="jsj" type="hidden" value="<%=jsj%>" >
      </td>
      <td><%=lsj%>
        <input name="lsj" type="hidden" value="<%=lsj%>" >
      </td>
      <td><%=sjj%>
        <input name="sjj" type="hidden" value="<%=sjj%>" >
      </td>
      <td><%=cllxStr%>
        <input name="cllx" type="hidden" value="<%=cllx%>" >
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
      <td ><%=xuhao%>
        <input name="xuhao" type="hidden" value="<%=xuhao%>" >
      </td>
      <td ><%=sfkgdjStr%>
        <input name="sfkgdj" type="hidden" value="<%=sfkgdj%>" >
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