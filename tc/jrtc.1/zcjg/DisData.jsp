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

String bjjbbm = null;
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
String jsjStr=null;
String tccldjStr=null;
String sfkgdjStr=null;
String sfkgdj=null;

String shStr=null;
String sfcscp=null;
String sfcscpStr=null;
String xuhao=null;
String ppmc=null;
String gysmc=null;
String sfxclxs=null;
String sfxclxsStr=null;
String tcsjflbm=null;
String tcsjflmc=null;
String sfyx=null;
String sfyxStr=null;
String yxkssj=null;
String yxjzsj=null;
String cllx=null;


double xdb=0;
double dj=0;
double tccldj=0;
double jsj=0;
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

	String bjbbh=null;
	sql="select bjbbh";
	sql+=" from  bj_dzbjbb";
	sql+=" where dqbm='"+dqbm+"' and sfzybb='2'";//2����ǰ��
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=rs.getString("bjbbh");
	}
	rs.close();
	ps.close();

	double tlgbzjj=0;//Ϳ�ϸ�Ϊ��ֽ�Ӽ�
	sql="select tlgbzjj";
	sql+=" from  bj_tcjgb";
	sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tlgbzjj=rs.getDouble("tlgbzjj");
	}
	rs.close();
	ps.close();
	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">
    �����ײ����ı���
    <p><font color="#FF0000"><b>��ע�⣺</b></font>���ۼ���<font color="#FF0000"><b>[<%=bjjbmc%>]��</b></font><b>����</b><font color="#FF0000"><b>[<%=dqmc%>]
	��ע�⣺��Ҫ�ظ�����</b></font>
  </div>
	<input type="hidden" name="bjjbbm" value="<%=bjjbbm%>">
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
	<input type="hidden" name="tlgbzjj" value="<%=tlgbzjj%>">

  <table width="200%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="5%">Ʒ��</td>
      <td width="9%">��Ӧ��</td>
      <td width="5%">��Ʒ����</td>
      <td width="4%">��Ʒ���</td>
      <td width="4%">�ײ���������</td>
	  <td width="5%">��Ʒ����</td>
      <td width="3%">�Ƿ��в�Ʒ</td>
      <td width="4%">SKU��</td>
      <td width="7%">��Ʒ����</td>
      <td width="6%">�ͺ�</td>
      <td width="6%">���</td>
	  <td width="3%">���ۼ�����λ</td>
	  <td width="3%">�µ�������λ</td>
	  <td width="3%">�µ���</td>
	  <td width="3%">��ģ�%��</td>
	  <td width="3%">�Ƿ��账��С��</td>
	  <td width="3%">�ײ��ڵ���</td>
	  <td width="3%">�ײͳ�������</td>
	  <td width="3%">�Ƿ�ɸĵ���</td>
	  <td width="4%">�����</td>
	<td  width="3%">�Ƿ���Ч</td>
	<td  width="4%">��Ч��ʼʱ��</td>
	<td  width="4%">��Ч����ʱ��</td>
      <td width="3%">����</td>
      <td width="3%">��������</td>
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
		if (len<25)
		{
			out.println("�����������°�Excelģ��"+len);
			return;
		}

		ppmc=outStr[i][0].trim();
		gysmc=outStr[i][1].trim();
		cldlmc=outStr[i][2].trim();
		clxlmc=outStr[i][3].trim();
		tcsjflmc=outStr[i][4].trim();
		cpbm=outStr[i][5].trim();
		sfcscpStr=outStr[i][6].trim();
		sku=outStr[i][7].trim();
		cpmc=outStr[i][8].trim();
		xh=outStr[i][9].trim();
		gg=outStr[i][10].trim();
		jldw=outStr[i][11].trim();
		xdjldw=outStr[i][12].trim();
		xdbStr=outStr[i][13].trim();
		shStr=outStr[i][14].trim();
		sfxclxsStr=outStr[i][15].trim();
		djStr=outStr[i][16].trim();
		tccldjStr=outStr[i][17].trim();
		sfkgdjStr=outStr[i][18].trim();
		jsjStr=outStr[i][19].trim();

		sfyxStr=outStr[i][20].trim();
		yxkssj=outStr[i][21].trim();
		yxjzsj=outStr[i][22].trim();
		xuhao=outStr[i][23].trim();
		cllx=outStr[i][24].trim();

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

		if (tcsjflmc.equals(""))
		{
			tcsjflbm="";
		}
		else{
			sql=" select tcsjflbm" ;
			sql+=" from bj_tcsjflbm " ;
			sql+=" where tcsjflmc='"+tcsjflmc+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				tcsjflbm = rs.getString("tcsjflbm");			    
			}
			else{
				out.println("<BR>�к�["+row+"]���󣡲����ڵ�[�ײ���������]��"+tcsjflmc);
//				return;
			}
			rs.close();
			ps.close();
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

		if (xdb==0)
		{
			out.println("<BR>�к�["+row+"]����[�µ���]����Ϊ0");
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
			out.println("<BR>�к�["+row+"]����[�ײ��ڵ���]����Ϊ��");
//			return;
		}
		else{
			try{
				dj=Double.parseDouble(djStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[�ײ��ڵ���:"+djStr+"]��������:"+e);
//				return;
			}
		}

		if (tccldjStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[�ײͳ�������]����Ϊ��");
//			return;
		}
		else{
			try{
				tccldj=Double.parseDouble(tccldjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[�ײͳ�������:"+tccldjStr+"]��������:"+e);
//				return;
			}
		}


		if (tccplbbm.equals("64"))//ǽ��ı�ֽ
		{
			if (dj!=tlgbzjj)
			{
				out.println("<BR>�к�["+row+"]����Ϳ�ϸı�ֽ�۸���ȷ�������:"+dj+"�����汾:"+bjbbh+"�����ײͼ۸������Ϊ��"+tlgbzjj);
			}

			if (tccldj!=tlgbzjj)
			{
				out.println("<BR>�к�["+row+"]����Ϳ�ϸı�ֽ�۸���ȷ�������:"+tccldj+"�����汾:"+bjbbh+"�����ײͼ۸������Ϊ��"+tlgbzjj);
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

		if (jsj==0)
		{
			out.println("<BR>�к�["+row+"]���ѣ�[�����]Ϊ0");
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



		if (sfcscpStr.equals("��"))
		{
			sfcscp="Y";
		}
		else if (sfcscpStr.equals("��"))
		{
			sfcscp="N";
		}
		else{
			out.println("�к�["+row+"]����[�Ƿ��в�Ʒ]ֻ��Ϊ���ǡ��񡿣�ĿǰΪ["+sfcscpStr+"]");
//			return;
		}

		if (sfcscp.equals("Y"))
		{
			if (sku.equals(""))
			{
				out.println("�к�["+row+"]�����ǳ��в�Ʒ����������SKU��");
//				return;
			}
		}
		else{
			if (!sku.equals(""))
			{
				out.println("�к�["+row+"]���󣡷ǳ��в�Ʒ������ҪSKU��");
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
			out.println("�к�["+row+"]����[�Ƿ��账��С��]ֻ��Ϊ������ȡ��������ȡ����4��5�룻��������ĿǰΪ["+sfxclxsStr+"]");
//			return;
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

		if (cllx.equals(""))
		{
			out.println("<BR>�к�["+row+"]���ѣ�[��������]Ϊ�գ�Ĭ�Ͼɲ���");
			cllx="1";
		}
		else if (!cllx.equals("1") && !cllx.equals("2"))
		{
			out.println("<BR>�к�["+row+"]���ѣ�[��������]ֻ����1��2:"+cllx);
			cllx="1";
		}


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td ><%=ppmc%>
        <input name="ppmc" type="hidden" value="<%=ppmc%>" >
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
      <td> <%=tcsjflmc%>
        <input name="tcsjflbm" type="hidden" value="<%=tcsjflbm%>" >
      </td>
      <td> <%=cpbm%>
        <input name="cpbm" type="hidden" value="<%=cpbm%>" >
      </td>
      <td ><%=sfcscpStr%>
        <input name="sfcscp" type="hidden" value="<%=sfcscp%>" >
      </td>
	  <td > <%=sku%>
        <input name="sku" type="hidden" value="<%=sku%>" >
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
      <td><%=tccldjStr%>
        <input name="tccldj" type="hidden" value="<%=tccldj%>" >
      </td>
      <td><%=sfkgdjStr%>
        <input name="sfkgdj" type="hidden" value="<%=sfkgdj%>" >
      </td>
      <td><%=jsj%>
        <input name="jsj" type="hidden" value="<%=jsj%>" >
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
      <td ><%=cllx%>
        <input name="cllx" type="hidden" value="<%=cllx%>" >
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
