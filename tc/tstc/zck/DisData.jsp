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

String bjjbmc = null;
String bjjbbm = null;
String dqbm = null;

String dqmc=null;

String[][] outStr=null; 
String bgcolor=null;
String mark=null;

String cpbm=null;
String nbbm=null;
String cldl=null;
String clxl=null;
String cpmc=null;
String xh=null;
String gg=null;
String ppmc=null;
String gysmc=null;
String jldw=null;
String xdjldw=null;
String xdbStr=null;
String shStr=null;
String sfxclxs=null;
String sfxclxsStr=null;
String jsjStr=null;
String khxsdjStr=null;
String sjj1Str=null;
String sjj2Str=null;
String sjj3Str=null;
String sjj4Str=null;
String sjj5Str=null;
String sgddjStr=null;
String lx=null;
String lxStr=null;
String cxxmbm=null;
String lbxmbm=null;
String sfyx=null;
String sfyxStr=null;
String yxkssj=null;
String yxjzsj=null;
String xuhao=null;


double xdb=0;
double sh=0;
double jsj=0;
double khxsdj=0;
double sgddj=0;
double sjj1=0;
double sjj2=0;
double sjj3=0;
double sjj4=0;
double sjj5=0;

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
    <p>�����ײ����Ŀ�</p>
    <p><font color="#FF0000"><b>��ע�⣺</b></font>><b>����</b><font color="#FF0000"><b>[<%=dqmc%>]
	<P>ע�⣺��Ҫ�ظ�����</b></font></p>
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">

  <table width="200%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="4%">��Ʒ����</td>
      <td width="4%">�ڲ�����</td>
      <td width="4%">��Ʒ����</td>
	  <td width="4%">��ƷС��</td>
      <td width="4%">��Ʒ����</td>
      <td width="4%">�ͺ�</td>
      <td width="4%">���</td>
	  <td width="6%">Ʒ��</td>
	  <td width="6%">��Ӧ��</td>
	  <td width="3%">������λ</td>
	  <td width="3%">�µ�������λ</td>
	  <td width="3%">�µ���</td>
	  <td width="3%">���</td>
	  <td width="3%">�Ƿ��账��С��</td>

	  <td width="5%">�����Ŀ����</td>
	  <td width="5%">������Ŀ����</td>
	  <td width="4%">�Ƿ���Ч</td>
	  <td width="5%">��Ч��ʼʱ��</td>
	  <td width="5%">��Ч����ʱ��</td>
	  <td width="4%">�������</td>

	  <td width="3%">����</td>
	  <td width="3%">������׼�ײ�</td>
	  <td width="3%">�����</td>
	  <td width="3%">�ͻ����۵���</td>
      <td width="3%">ʩ���ӵ���</td>
      <td width="3%">������1</td>
      <td width="3%">������2</td>
      <td width="3%">������3</td>
      <td width="3%">������4</td>
      <td width="3%">������5</td>
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
		if (len<20)
		{
			out.println("�����������°�Excelģ��");
			return;
		}

		cpbm=outStr[i][0].trim();
		nbbm=outStr[i][1].trim();
		cldl=outStr[i][2].trim();
		clxl=outStr[i][3].trim();
		cpmc=outStr[i][4].trim();
		xh=outStr[i][5].trim();
		gg=outStr[i][6].trim();
		ppmc=outStr[i][7].trim();
		gysmc=outStr[i][8].trim();
		jldw=outStr[i][9].trim();
		xdjldw=outStr[i][10].trim();
		xdbStr=outStr[i][11].trim();
		shStr=outStr[i][12].trim();
		sfxclxsStr=outStr[i][13].trim();

		cxxmbm=outStr[i][14].trim();
		lbxmbm=outStr[i][15].trim();
		sfyxStr=outStr[i][16].trim();
		yxkssj=outStr[i][17].trim();
		yxjzsj=outStr[i][18].trim();
		xuhao=outStr[i][19].trim();
		lxStr=outStr[i][20].trim();
		bjjbmc=outStr[i][21].trim();

		jsjStr=outStr[i][22].trim();
		khxsdjStr=outStr[i][23].trim();
		sgddjStr=outStr[i][24].trim();

		sjj1Str=outStr[i][25].trim();
		sjj2Str=outStr[i][26].trim();
		sjj3Str=outStr[i][27].trim();
		sjj4Str=outStr[i][28].trim();
		sjj5Str=outStr[i][29].trim();

		mark="";

		if (cpmc.equals(""))
		{
			out.println("��Ʒ����Ϊ�գ��������ݱ�����");
			return;
		}

		sql=" select cldlmc" ;
		sql+=" from jxc_cldlbm " ;
		sql+=" where cldlmc='"+cldl+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			cldl = rs.getString("cldlmc");			    
		}
		else{
			out.println("<BR>�к�["+row+"]���󣡲����ڵ�[��Ʒ����]��"+cldl);
//			return;
		}
		rs.close();
		ps.close();

		sql=" select clxlmc" ;
		sql+=" from jxc_clxlbm " ;
		sql+=" where cldlmc='"+cldl+"' and clxlmc='"+clxl+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			clxl = rs.getString("clxlmc");			    
		}
		else{
			out.println("<BR>�к�["+row+"]���󣡲����ڵ�[��ƷС��]:"+clxl);
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
			out.println("<BR>�к�["+row+"]���󣡲����ڵ�[������λ]��"+jldw);
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
			out.println("<BR>�к�["+row+"]���󣡲����ڵ�[���ۼ���]��"+bjjbmc);
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
		if (khxsdjStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[�ͻ����۵���]����Ϊ��");
//			return;
		}
		else{
			try{
				khxsdj=Double.parseDouble(khxsdjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[�ͻ����۵���:"+khxsdjStr+"]��������:"+e);
//				return;
			}
		}
		if (sjj1Str.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[������1]����Ϊ��");
//			return;
		}
		else{
			try{
				sjj1=Double.parseDouble(sjj1Str.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[������1:"+sjj1Str+"]��������:"+e);
//				return;
			}
		}
		if (sjj2Str.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[������2]����Ϊ��");
//			return;
		}
		else{
			try{
				sjj2=Double.parseDouble(sjj2Str.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[������2:"+sjj2Str+"]��������:"+e);
//				return;
			}
		}
		if (sjj3Str.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[������3]����Ϊ��");
//			return;
		}
		else{
			try{
				sjj3=Double.parseDouble(sjj3Str.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[������3:"+sjj3Str+"]��������:"+e);
//				return;
			}
		}
		if (sjj4Str.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[������4]����Ϊ��");
//			return;
		}
		else{
			try{
				sjj4=Double.parseDouble(sjj4Str.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[������4:"+sjj4Str+"]��������:"+e);
//				return;
			}
		}
		if (sjj5Str.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[������5]����Ϊ��");
//			return;
		}
		else{
			try{
				sjj5=Double.parseDouble(sjj5Str.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[������5:"+sjj5Str+"]��������:"+e);
//				return;
			}
		}
		if (sgddjStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[ʩ���ӵ���]����Ϊ��");
//			return;
		}
		else{
			try{
				sgddj=Double.parseDouble(sgddjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[ʩ���ӵ���:"+sgddjStr+"]��������:"+e);
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

		if (lxStr.equals("�ײ���"))//1����׼�ײ��2�������3�������
		{
			lx="1";
		}
		else if (lxStr.equals("�ײ���"))//1����׼�ײ��2�������3�������
		{
			lx="4";
		}
		else if (lxStr.equals("������"))
		{
			lx="2";
		}
		else{
			lx="3";
			lxStr="�����";
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


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
	  <td> <%=cpbm%>
        <input name="cpbm" type="hidden" value="<%=cpbm%>" >
      </td>
	  <td> <%=nbbm%>
        <input name="nbbm" type="hidden" value="<%=nbbm%>" >
      </td>
      <td><%=cldl%>
        <input name="cldl" type="hidden" value="<%=cldl%>">
      </td>
      <td><%=clxl%>
        <input name="clxl" type="hidden" value="<%=clxl%>">
      </td>
      <td> <%=cpmc%>
        <input name="cpmc" type="hidden" value="<%=cpmc%>" >
      </td>
      <td ><%=xh%>
        <input name="xh" type="hidden" value="<%=xh%>" >
      </td>
      <td><%=gg%>
        <input name="gg" type="hidden" value="<%=gg%>" >
      </td>
      <td ><%=ppmc%>
        <input name="ppmc" type="hidden" value="<%=ppmc%>" >
      </td>
      <td ><%=gysmc%>
        <input name="gysmc" type="hidden" value="<%=gysmc%>" >
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
	  <td ><%=cxxmbm%>
        <input name="cxxmbm" type="hidden" value="<%=cxxmbm%>" >
      </td>
	  <td ><%=lbxmbm%>
        <input name="lbxmbm" type="hidden" value="<%=lbxmbm%>" >
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
      <td ><%=lxStr%>
        <input name="lx" type="hidden" value="<%=lx%>" >
      </td>
      <td ><%=bjjbmc%>
        <input name="bjjbbm" type="hidden" value="<%=bjjbbm%>" >
      </td>
      <td><%=jsj%>
        <input name="jsj" type="hidden" value="<%=jsj%>" >
      </td>
      <td><%=khxsdj%>
        <input name="khxsdj" type="hidden" value="<%=khxsdj%>" >
      </td>
	  <td><%=sgddj%>
        <input name="sgddj" type="hidden" value="<%=sgddj%>" >
      </td>
	  <td><%=sjj1%>
        <input name="sjj1" type="hidden" value="<%=sjj1%>" >
      </td>
	  <td><%=sjj2%>
        <input name="sjj2" type="hidden" value="<%=sjj2%>" >
      </td>
	  <td><%=sjj3%>
        <input name="sjj3" type="hidden" value="<%=sjj3%>" >
      </td>
	  <td><%=sjj4%>
        <input name="sjj4" type="hidden" value="<%=sjj4%>" >
      </td>
	  <td><%=sjj5%>
        <input name="sjj5" type="hidden" value="<%=sjj5%>" >
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
