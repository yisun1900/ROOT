<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�滻ȫ�����ı���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletConfig().getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String dqbm = null;


String[][] outStr=null; 
String bgcolor=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;


String xuhao=null;
String zcdlbm=null;
String zcxlbm=null;
String dwbh=null;
String zclbbm=null;
String zcbm=null;
String zcmc=null;
String xh=null;
String gg=null;
String zcysbm=null;
String jldwbmstr=null;
String lsjstr=null;
String yhjstr=null;
String sfbhpjstr=null;
String pjtsstr=null;
String cxhdblstr=null;
String cbjstr=null;
String jsblstr=null;
String cxcbjstr=null;
String lscxhdblstr=null;

String cpjb=null;
String sfyhstr=null;
String sfycxstr=null;
String cxjstr=null;
String cxkssjstr=null;
String cxjzsjstr=null;
String fgsx=null;
String cd=null;
String bz=null;
String zp=null;
String cpsm=null;


String jldwbm="";
double lsj=0;
double yhj=0;
double cbj=0;
double jsbl=0;
double cxj=0;
java.sql.Date cxkssj=null;
java.sql.Date cxjzsj=null;
double cxhdbl=0;
int pjts=0;
String sfycx="N";
String sfbhpj="N";
String sfyh="N";
double cxcbj=0;
double lscxhdbl=0;

String dqmc="";


int count=0;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	dqbm =up.getParameter("dqbm");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\jcjj\\zcbj\\impdata\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	sql=" select dqmc" ;
	sql+=" from dm_dqbm " ;
	sql+=" where dqbm='"+dqbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		dqmc = rs.getString(1);			    
	}
	rs.close();
	ps.close();

	%> 
<form method="post" action="SaveImpData.jsp" name="editform" target="_blank">
<div align="center">�滻ȫ�����ı��ۣ�������<%=dqmc%>��</div>
<input name="dqbm" type="hidden" value="<%=dqbm%>" >
  <table width="340%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="1%">�к�</td>
      <td width="1%">�������</td>
      <td width="3%">����</td>
	  <td width="3%">С��</td>
      <td width="4%">Ʒ�ƹ�Ӧ��</td>
      <td width="4%">Ʒ��</td>
      <td width="4%">��Ӧ��</td>
      <td width="3%">���ϵ��</td>
      <td width="2%">���ı���</td>
      <td width="5%">��������</td>
      <td width="5%">�ͺ�</td>
      <td width="4%">���</td>
      <td width="3%">��ɫ</td>
      <td width="1%">������λ</td>
      <td width="3%">�г����</td>
      <td width="3%">�����޼�</td>
      <td width="3%">�����</td>
      <td width="2%">�������</td>
      <td width="2%">��������</td>
      <td width="1%">�д���</td>
      <td width="3%">������ʼʱ��</td>
      <td width="3%">��������ʱ��</td>
      <td width="3%">������</td>
      <td width="3%">���������</td>
      <td width="2%">�����ڼ�������</td>
      <td width="1%">�������</td>
      <td width="1%">�������</td>
      <td width="1%">�Ƿ��л�</td>
      <td width="3%">��Ʒ����</td>
      <td width="4%">�������</td>
      <td width="7%">��Ʒ˵��</td>
      <td width="2%">����</td>
      <td width="3%">��Ƭ����</td>
      <td width="6%">��ע</td>
    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(5001,filename); 


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

		if (outStr[i][0]==null || outStr[i][0].equals(""))
		{
			out.println("����!��"+i+"��[����]Ϊ��,����������Զ�������");
			break;
		}

		xuhao=outStr[i][0].trim();
		zcdlbm=outStr[i][1].trim();
		zcxlbm=outStr[i][2].trim();
		dwbh=outStr[i][3].trim();
		zclbbm=outStr[i][4].trim();
		zcbm=outStr[i][5].trim();
		zcmc=outStr[i][6].trim();
		xh=outStr[i][7].trim();
		gg=outStr[i][8].trim();
		zcysbm=outStr[i][9].trim();
		jldwbmstr=outStr[i][10].trim();

		lsjstr=outStr[i][11].trim();
		yhjstr=outStr[i][12].trim();
		cbjstr=outStr[i][13].trim();
		jsblstr=outStr[i][14].trim();
		cxhdblstr=outStr[i][15].trim();
		sfycxstr=outStr[i][16].trim();
		cxkssjstr=outStr[i][17].trim();
		cxjzsjstr=outStr[i][18].trim();
		cxjstr=outStr[i][19].trim();
		cxcbjstr=outStr[i][20].trim();

		lscxhdblstr=outStr[i][21].trim();
		sfbhpjstr=outStr[i][22].trim();
		pjtsstr=outStr[i][23].trim();
		sfyhstr=outStr[i][24].trim();
		cpjb=outStr[i][25].trim();
		fgsx=outStr[i][26].trim();
		cpsm=outStr[i][27].trim();
		cd=outStr[i][28].trim();
		zp=outStr[i][29].trim();
		bz=outStr[i][30].trim();

		if (zcmc.equals(""))
		{
			out.println("<BR>���������["+xuhao+"]�����������Ʋ���Ϊ��");
			return;
		}


		//���Ĵ���
		if (zcdlbm!=null && !zcdlbm.equals(""))
		{
			sql=" select count(*)" ;
			sql+=" from jdm_zcdlbm " ;
			sql+=" where zcdlmc='"+zcdlbm+"'" ;
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
				out.println("<BR>���������["+xuhao+"]���󣬲����ڵ�[���Ĵ���]��"+zcdlbm);
				return;
			}
		}
		else{
			out.println("<BR>���������["+xuhao+"]����[���Ĵ���]����Ϊ��");
			return;
		}
		//����С��
		if (zcxlbm!=null && !zcxlbm.equals(""))
		{
			sql=" select count(*)" ;
			sql+=" from jdm_zcxlbm " ;
			sql+=" where zcxlmc='"+zcxlbm+"' and zcdlmc='"+zcdlbm+"'" ;
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
				out.println("<BR>���������["+xuhao+"]���󣬲����ڵ�[����С��]��"+zcxlbm);
				return;
			}
		}
		else{
			out.println("<BR>���������["+xuhao+"]����[����С��]����Ϊ��");
			return;
		}

		//Ʒ��
		String ppmc=null;
		String gys=null;
		if (dwbh!=null && !dwbh.equals(""))
		{
			sql=" select ppmc,gys" ;
			sql+=" from sq_gysxx " ;
			sql+=" where gysmc='"+dwbh+"' and dqbm='"+dqbm+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				ppmc = rs.getString("ppmc");			    
				gys = rs.getString("gys");			    
			}
			else{
				rs.close();
				ps.close();
				out.println("<BR>���������["+xuhao+"]���󣬲����ڵ�[Ʒ�ƹ�Ӧ������]��"+dwbh);
				return;
			}
			rs.close();
			ps.close();

		}
		else{
			out.println("<BR>���������["+xuhao+"]����[Ʒ�ƹ�Ӧ������]����Ϊ��");
			return;
		}

		//������λ
		jldwbm="";
		if (jldwbmstr!=null && !jldwbmstr.equals(""))
		{
			sql=" select jldwmc" ;
			sql+=" from jdm_jldwbm " ;
			sql+=" where jldwmc='"+jldwbmstr+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				jldwbm = rs.getString(1);			    
			}
			else
			{
				out.println("<BR>���������["+xuhao+"]���󣬲����ڵ�[������λ]��"+jldwbmstr);
				return;
			}

			rs.close();
			ps.close();

		}
		else{
			out.println("<BR>���������["+xuhao+"]����[������λ]����Ϊ��");
			return;
		}


		//�г����
		lsj=0;
		if (lsjstr!=null && !lsjstr.trim().equals(""))
		{
			try{
				lsj=Double.parseDouble(lsjstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[�г����]�����֣�" + lsjstr);
				return;
			}
		}
		//�����޼�
		yhj=0;
		if (yhjstr!=null && !yhjstr.trim().equals(""))
		{
			try{
				yhj=Double.parseDouble(yhjstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[�����޼�]�����֣�" + yhjstr);
				return;
			}
		}
		//�����
		cbj=0;
		if (cbjstr!=null && !cbjstr.trim().equals(""))
		{
			try{
				cbj=Double.parseDouble(cbjstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[�����]�����֣�" + cbjstr);
				return;
			}
		}
		//�������
		jsbl=0;
		if (jsblstr!=null && !jsblstr.trim().equals(""))
		{
			try{
				jsbl=Double.parseDouble(jsblstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[�������]�����֣�" + jsblstr);
				return;
			}
		}
		//������
		cxj=0;
		if (cxjstr!=null && !cxjstr.trim().equals(""))
		{
			try{
				cxj=Double.parseDouble(cxjstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[������]�����֣�" + cxjstr);
				return;
			}
		}
		//������ʼʱ��
		cxkssj=null;
		if (cxkssjstr!=null && !cxkssjstr.trim().equals(""))
		{
			try{
				cxkssj=java.sql.Date.valueOf(cxkssjstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[������ʼʱ��]�����ڣ�" + cxkssjstr);
				return;
			}
		}
		//��������ʱ��
		cxjzsj=null;
		if (cxjzsjstr!=null && !cxjzsjstr.trim().equals(""))
		{
			try{
				cxjzsj=java.sql.Date.valueOf(cxjzsjstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[��������ʱ��]�����ڣ�" + cxjzsjstr);
				return;
			}
		}
		//��������
		cxhdbl=0;
		if (cxhdblstr!=null && !cxhdblstr.trim().equals(""))
		{
			try{
				cxhdbl=Double.parseDouble(cxhdblstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[��������]�����֣�" + cxhdblstr);
				return;
			}
		}
		//���������
		cxcbj=0;
		if (cxcbjstr!=null && !cxcbjstr.trim().equals(""))
		{
			try{
				cxcbj=Double.parseDouble(cxcbjstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[���������]�����֣�" + cxcbjstr);
				return;
			}
		}
		//�����ڼ�������
		lscxhdbl=0;
		if (lscxhdblstr!=null && !lscxhdblstr.trim().equals(""))
		{
			try{
				lscxhdbl=Double.parseDouble(lscxhdblstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[������������]�����֣�" + lscxhdblstr);
				return;
			}
		}


		//�Ƿ��д���
		sfycx="N";
		if (sfycxstr!=null && !sfycxstr.equals(""))
		{
			if (sfycxstr.equals("��"))
			{
				sfycx="Y";
			}
			else if (sfycxstr.equals("��"))
			{
				sfycx="N";
			}
			else{
				out.println("<BR>���������["+xuhao+"]����[�Ƿ��д���]ֻ���ǡ��ǡ��򡾷񡿣�"+sfycxstr);
				return;
			}
		}

		if (sfycx.equals("Y"))
		{
			//������
			if (cxjstr==null || cxjstr.trim().equals(""))
			{
				out.print("���["+xuhao+"]������Ϊ�д�����[������]������");
				return;
			}
			//������ʼʱ��
			if (cxkssjstr==null || cxkssjstr.trim().equals(""))
			{
				out.print("���["+xuhao+"]������Ϊ�д�����[������ʼʱ��]������");
				return;
			}
			//��������ʱ��
			if (cxjzsjstr==null || cxjzsjstr.trim().equals(""))
			{
				out.print("���["+xuhao+"]������Ϊ�д�����[��������ʱ��]������");
				return;
			}
			if (cxcbjstr==null || cxcbjstr.trim().equals(""))
			{
				out.print("���["+xuhao+"]������Ϊ�д�����[���������]������");
				return;
			}
			if (lscxhdblstr==null || lscxhdblstr.trim().equals(""))
			{
				out.print("���["+xuhao+"]������Ϊ�д�����[������������]������");
				return;
			}
		}
		else{
			//������
			if (cxjstr!=null && !cxjstr.trim().equals("") && !cxjstr.trim().equals("0"))
			{
				out.print("���["+xuhao+"]������Ϊû�д�����������[������]");
				return;
			}
			//������ʼʱ��
			if (cxkssjstr!=null && !cxkssjstr.trim().equals(""))
			{
				out.print("���["+xuhao+"]������Ϊû�д�����������[������ʼʱ��]");
				return;
			}
			//��������ʱ��
			if (cxjzsjstr!=null && !cxjzsjstr.trim().equals(""))
			{
				out.print("���["+xuhao+"]������Ϊû�д�����������[��������ʱ��]");
				return;
			}
			if (cxcbjstr!=null && !cxcbjstr.trim().equals("") && !cxcbjstr.trim().equals("0"))
			{
				out.print("���["+xuhao+"]������Ϊû�д�����������[���������]");
				return;
			}
			if (lscxhdblstr!=null && !lscxhdblstr.trim().equals("") && !lscxhdblstr.trim().equals("0"))
			{
				out.print("���["+xuhao+"]������Ϊû�д�����������[������������]");
				return;
			}
		}
		
		//�Ƿ�������
		sfbhpj="N";
		if (sfbhpjstr!=null && !sfbhpjstr.equals(""))
		{
			if (sfbhpjstr.equals("��"))
			{
				sfbhpj="Y";
			}
			else if (sfbhpjstr.equals("��"))
			{
				sfbhpj="N";
			}
			else{
				out.println("<BR>���������["+xuhao+"]����[�Ƿ�������]ֻ���ǡ��ǡ��򡾷񡿣�"+sfbhpjstr);
				return;
			}
		}
		//�������
		pjts=0;
		if (pjtsstr!=null && !pjtsstr.trim().equals(""))
		{
			try{
				pjts=Integer.parseInt(pjtsstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[�������]�����֣�" + pjtsstr);
				return;
			}
		}
		//�Ƿ��л�
		sfyh="N";
		if (sfyhstr!=null && !sfyhstr.equals(""))
		{
			if (sfyhstr.equals("��"))
			{
				sfyh="Y";
			}
			else if (sfyhstr.equals("��"))
			{
				sfyh="N";
			}
			else{
				out.println("<BR>���������["+xuhao+"]����[�Ƿ��л�]ֻ���ǡ��ǡ��򡾷񡿣�"+sfyhstr);
				return;
			}
		}

%> 


	
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=i%></td>
      <td><%=xuhao%> 
        <input name="xuhao" type="hidden" value="<%=xuhao%>">
      </td>
      <td><%=zcdlbm%> 
        <input name="zcdlbm" type="hidden" value="<%=zcdlbm%>">
      </td>
      <td><%=zcxlbm%>
        <input name="zcxlbm" type="hidden" value="<%=zcxlbm%>" >
      </td>
      <td><%=dwbh%>
        <input name="dwbh" type="hidden" value="<%=dwbh%>" >
      </td>
      <td><%=ppmc%>
        <input name="ppmc" type="hidden" value="<%=ppmc%>" >
      </td>
      <td><%=gys%>
        <input name="gys" type="hidden" value="<%=gys%>" >
      </td>
      <td><%=zclbbm%>
        <input name="zclbbm" type="hidden" value="<%=zclbbm%>" >
      </td>
	  <td ><%=zcbm%>
        <input name="zcbm" type="hidden" value="<%=zcbm%>" >
      </td>
      <td><%=zcmc%>
        <input name="zcmc" type="hidden" value="<%=zcmc%>" >
      </td>
	  <td><%=xh%>
        <input name="xh" type="hidden" value="<%=xh%>" >
      </td>
      <td><%=gg%>
        <input name="gg" type="hidden" value="<%=gg%>" >
      </td>
	  <td><%=zcysbm%>
        <input name="zcysbm" type="hidden" value="<%=zcysbm%>" >
      </td>
      <td><%=jldwbmstr%>
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td><%=cf.round(lsj,2)%>
        <input name="lsj" type="hidden" value="<%=cf.round(lsj,2)%>" >
      </td>
      <td ><%=cf.round(yhj,2)%>
        <input name="yhj" type="hidden" value="<%=cf.round(yhj,2)%>" >
      </td>
      <td><%=cbj%>
        <input name="cbj" type="hidden" value="<%=cf.round(cbj,2)%>" >
      </td>
      <td><%=jsblstr%>%
        <input name="jsbl" type="hidden" value="<%=jsbl%>" >
      </td>
      <td><%=cxhdblstr%>%
        <input name="cxhdbl" type="hidden" value="<%=cxhdbl%>" >
      </td>
      <td><%=sfycxstr%>
        <input name="sfycx" type="hidden" value="<%=sfycx%>" >
      </td>
      <td><%=cxkssjstr%>
        <input name="cxkssj" type="hidden" value="<%=cxkssjstr%>" >
      </td>
      <td><%=cxjzsjstr%>
        <input name="cxjzsj" type="hidden" value="<%=cxjzsjstr%>" >
      </td>
      <td><%=cxjstr%>
        <input name="cxj" type="hidden" value="<%=cxj%>" >
      </td>
      <td><%=cxcbjstr%>
        <input name="cxcbj" type="hidden" value="<%=cxcbj%>" >
      </td>
      <td><%=lscxhdblstr%>%
        <input name="lscxhdbl" type="hidden" value="<%=lscxhdbl%>" >
      </td>
      <td><%=sfbhpjstr%>
        <input name="sfbhpj" type="hidden" value="<%=sfbhpj%>" >
      </td>
      <td><%=pjtsstr%>
        <input name="pjts" type="hidden" value="<%=pjts%>" >
      </td>
      <td><%=sfyhstr%>
        <input name="sfyh" type="hidden" value="<%=sfyh%>" >
      </td>
      <td><%=cpjb%>
        <input name="cpjb" type="hidden" value="<%=cpjb%>" >
      </td>
      <td><%=fgsx%>
        <input name="fgsx" type="hidden" value="<%=fgsx%>" >
      </td>
      <td align="left"><%=cpsm%>
        <input name="cpsm" type="hidden" value="<%=cpsm%>" >
      </td>
      <td><%=cd%>
        <input name="cd" type="hidden" value="<%=cd%>" >
      </td>
      <td align="left"><%=zp%>
        <input name="zp" type="hidden" value="<%=zp%>" >
      </td>
      <td align="left"><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
      </td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("���["+xuhao+"]����" + e);
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
        <input type="button"  value="����" name="bc" onClick="f_do(editform)">
        <input type="button"  value="���̰�ť����" name="cxbc"  onClick="bc.disabled=false;cxbc.disabled=true" disabled>
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
	FormName.bc.disabled=true;
	FormName.cxbc.disabled=false;
	return true;
}
//-->
</SCRIPT>
