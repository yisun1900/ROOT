<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�����µ����ı���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF" style="FONT-SIZE:16">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletConfig().getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String dqbm = null;
String getcldlbm=null;
String getclxlbm=null;
String getppmc=null;


String[][] outStr=null; 
String bgcolor=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;


String xuhao=null;
String ppmc=null;
String cllbbm=null;
String clbm=null;
String nbbm=null;
String clmc=null;
String xh=null;
String gg=null;
String clysbm=null;
String jldwbmstr=null;
String bzjldwbmstr=null;
String bzggstr=null;
String lsjstr=null;
String xsjstr=null;
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
String sftjcpstr=null;
String sftjcp=null;
String zp=null;
String cpsm=null;


String jldwbm="";
String bzjldwbm="";
double bzgg=0;
double lsj=0;
double xsj=0;
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
	getcldlbm =up.getParameter("cldlbm");
	getclxlbm =up.getParameter("clxlbm");
	getppmc =up.getParameter("ppmc");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\jcjj\\zcbj\\impdata\\"+yhdlm+".txt";
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
<form method="post" action="SaveImpAddData.jsp" name="editform" target="_blank">
  <div align="center">�����µ����ı��ۣ�������<%=dqmc%>����ע�⣺<font color="#FF0000">��ɫ��¼��ʾ��[��Ʒ�ơ��������ơ��ͺ�]�Ѵ���</font></div>
<input name="dqbm" type="hidden" value="<%=dqbm%>" >
  <table width="340%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="1%">�к�</td>
      <td width="1%">�������</td>
      <td width="3%">��Ʒ��</td>
      <td width="3%">Ʒ��</td>
      <td width="5%">��Ӧ��</td>
      <td width="4%">���ϵ��</td>
      <td width="2%">���ı���</td>
      <td width="2%">�ڲ�����</td>
      <td width="5%">��������</td>
      <td width="5%">�ͺ�</td>
      <td width="4%">���</td>
      <td width="3%">��ɫ</td>
      <td width="1%">������λ</td>
      <td width="2%">��װ������λ</td>
      <td width="2%">��װ���</td>
      <td width="3%">�г����</td>
      <td width="3%">���ۼ�</td>
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
      <td width="5%">��Ʒ˵��</td>
      <td width="2%">����</td>
      <td width="2%">�Ƿ��Ƽ���Ʒ</td>
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
		ppmc=outStr[i][1].trim();
		cllbbm=outStr[i][2].trim();
		clbm=outStr[i][3].trim();
		nbbm=outStr[i][4].trim();
		clmc=outStr[i][5].trim();
		xh=outStr[i][6].trim();
		gg=outStr[i][7].trim();
		clysbm=outStr[i][8].trim();
		jldwbmstr=outStr[i][9].trim();
		bzjldwbmstr=outStr[i][10].trim();

		bzggstr=outStr[i][11].trim();
		lsjstr=outStr[i][12].trim();
		xsjstr=outStr[i][13].trim();
		cbjstr=outStr[i][14].trim();
		jsblstr=outStr[i][15].trim();
		cxhdblstr=outStr[i][16].trim();
		sfycxstr=outStr[i][17].trim();
		cxkssjstr=outStr[i][18].trim();
		cxjzsjstr=outStr[i][19].trim();
		cxjstr=outStr[i][20].trim();

		cxcbjstr=outStr[i][21].trim();
		lscxhdblstr=outStr[i][22].trim();
		sfbhpjstr=outStr[i][23].trim();
		pjtsstr=outStr[i][24].trim();
		sfyhstr=outStr[i][25].trim();
		cpjb=outStr[i][26].trim();
		fgsx=outStr[i][27].trim();
		cpsm=outStr[i][28].trim();
		cd=outStr[i][29].trim();
		sftjcpstr=outStr[i][30].trim();

		zp=outStr[i][31].trim();
		bz=outStr[i][32].trim();

		if (clmc.equals(""))
		{
			out.println("<BR>���������["+xuhao+"]�����������Ʋ���Ϊ��");
			return;
		}

		if (!getppmc.equals(ppmc))
		{
//			out.println("<BR>���������["+xuhao+"]����[��Ʒ������]��һ�£�ѡ��"+getppmc+"�������롾"+ppmc+"��");
//			return;
		}



		//Ʒ��
		String scsmc=null;
		String gysmc=null;
		String cldlbm=null;
		String clxlbm=null;
		if (ppmc!=null && !ppmc.equals(""))
		{
			sql=" select scsmc,clxl" ;
			sql+=" from jxc_ppxx " ;
			sql+=" where ppmc='"+ppmc+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				scsmc = rs.getString("scsmc");			    
				clxlbm = rs.getString("clxl");			    
			}
			else{
				rs.close();
				ps.close();
				out.println("<BR>���������["+xuhao+"]���󣬲����ڵ�[��Ʒ������]����"+ppmc+"��");
				return;
			}
			rs.close();
			ps.close();

			sql=" select jxc_ppgysdzb.gysmc" ;
			sql+=" from jxc_ppxx,jxc_ppgysdzb " ;
			sql+=" where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppxx.ppmc='"+ppmc+"' and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+dqbm+"')" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				gysmc = rs.getString("gysmc");			    
			}
			else{
				rs.close();
				ps.close();
				out.println("<BR>���������["+xuhao+"]���󣬲�����[��Ʒ�ƹ�Ӧ�̶��ձ�]����"+ppmc+"��");
				return;
			}
			rs.close();
			ps.close();


		}
		else{
			out.println("<BR>���������["+xuhao+"]����[��Ʒ������]����Ϊ��");
			return;
		}

		sql=" select cldlmc" ;
		sql+=" from jxc_clxlbm " ;
		sql+=" where clxlmc='"+clxlbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			cldlbm = rs.getString("cldlmc");			    
		}
		rs.close();
		ps.close();

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
		//��װ������λ
		bzjldwbm="";
		if (bzjldwbmstr!=null && !bzjldwbmstr.equals(""))
		{
			sql=" select jldwmc" ;
			sql+=" from jdm_jldwbm " ;
			sql+=" where jldwmc='"+bzjldwbmstr+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				bzjldwbm = rs.getString(1);			    
			}
			else
			{
				out.println("<BR>���������["+xuhao+"]���󣬲����ڵ�[��װ������λ]��"+bzjldwbmstr);
				return;
			}

			rs.close();
			ps.close();

		}
		else{
			out.println("<BR>���������["+xuhao+"]����[��װ������λ]����Ϊ��");
			return;
		}

		//��װ���
		bzgg=1;
		if (bzggstr!=null && !bzggstr.trim().equals(""))
		{
			try{
				bzgg=Double.parseDouble(bzggstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[��װ���]�����֣�" + bzggstr);
				return;
			}
		}
		if (bzgg<1)
		{
			out.print("���["+xuhao+"]����[��װ���]����С��1��");
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
		//���ۼ�
		xsj=0;
		if (xsjstr!=null && !xsjstr.trim().equals(""))
		{
			try{
				xsj=Double.parseDouble(xsjstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[���ۼ�]�����֣�" + xsjstr);
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
		else{
			out.print("<BR>���["+xuhao+"]����[��������]Ϊ��");
			return;
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
				out.print("<BR>���["+xuhao+"]������Ϊ�д�����[������]������");
				return;
			}
			//������ʼʱ��
			if (cxkssjstr==null || cxkssjstr.trim().equals(""))
			{
				out.print("<BR>���["+xuhao+"]������Ϊ�д�����[������ʼʱ��]������");
				return;
			}
			//��������ʱ��
			if (cxjzsjstr==null || cxjzsjstr.trim().equals(""))
			{
				out.print("<BR>���["+xuhao+"]������Ϊ�д�����[��������ʱ��]������");
				return;
			}
			if (cxcbjstr==null || cxcbjstr.trim().equals(""))
			{
				out.print("<BR>���["+xuhao+"]������Ϊ�д�����[���������]������");
				return;
			}
			if (lscxhdblstr==null || lscxhdblstr.trim().equals(""))
			{
				out.print("<BR>���["+xuhao+"]������Ϊ�д�����[�����ڼ�������]������");
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
		sfyh="Y";
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
		else{
			sfyh="Y";
		}

		//�Ƿ��Ƽ���Ʒ
		sftjcp="N";
		if (sftjcpstr!=null && !sftjcpstr.equals(""))
		{
			if (sftjcpstr.equals("��"))
			{
				sftjcp="Y";
			}
			else if (sftjcpstr.equals("��"))
			{
				sftjcp="N";
			}
			else{
				out.println("<BR>���������["+xuhao+"]����[�Ƿ��Ƽ���Ʒ]ֻ���ǡ��ǡ��򡾷񡿣�"+sftjcpstr);
				return;
			}
		}
		else{
			sftjcp="N";
		}

		if (xh.equals(""))
		{
			sql=" select count(*)" ;
			sql+=" from jxc_clbm,jxc_cljgb " ;
			sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.clmc='"+clmc+"' and jxc_clbm.ppmc='"+ppmc+"' and jxc_cljgb.dqbm='"+dqbm+"' and jxc_clbm.xh is null" ;
		}
		else{
			sql=" select count(*)" ;
			sql+=" from jxc_clbm,jxc_cljgb " ;
			sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.clmc='"+clmc+"' and jxc_clbm.ppmc='"+ppmc+"' and jxc_cljgb.dqbm='"+dqbm+"' and jxc_clbm.xh='"+xh+"'" ;
		}
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			bgcolor="#FF0000";
		}
%> 


	
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=i%></td>
      <td><%=xuhao%> 
        <input name="xuhao" type="hidden" value="<%=xuhao%>">
      </td>
      <td><%=ppmc%>
        <input name="ppmc" type="hidden" value="<%=ppmc%>" >
        <input name="cldlbm" type="hidden" value="<%=cldlbm%>" >
        <input name="clxlbm" type="hidden" value="<%=clxlbm%>" >
      </td>
      <td><%=scsmc%>
        <input name="scsmc" type="hidden" value="<%=scsmc%>" >
      </td>
      <td><%=gysmc%>
        <input name="gysmc" type="hidden" value="<%=gysmc%>" >
      </td>
      <td><%=cllbbm%>
        <input name="cllbbm" type="hidden" value="<%=cllbbm%>" >
      </td>
	  <td ><%=clbm%>
        <input name="clbm" type="hidden" value="<%=clbm%>" >
      </td>
	  <td ><%=nbbm%>
        <input name="nbbm" type="hidden" value="<%=nbbm%>" >
      </td>
      <td><%=clmc%>
        <input name="clmc" type="hidden" value="<%=clmc%>" >
      </td>
	  <td><%=xh%>
        <input name="xh" type="hidden" value="<%=xh%>" >
      </td>
      <td><%=gg%>
        <input name="gg" type="hidden" value="<%=gg%>" >
      </td>
	  <td><%=clysbm%>
        <input name="clysbm" type="hidden" value="<%=clysbm%>" >
      </td>
      <td><%=jldwbmstr%>
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td><%=bzjldwbmstr%>
        <input name="bzjldwbm" type="hidden" value="<%=bzjldwbm%>" >
      </td>
      <td><%=bzggstr%>
        <input name="bzgg" type="hidden" value="<%=bzgg%>" >
      </td>
      <td><%=cf.round(lsj,2)%>
        <input name="lsj" type="hidden" value="<%=cf.round(lsj,2)%>" >
      </td>
      <td ><%=cf.round(xsj,2)%>
        <input name="xsj" type="hidden" value="<%=cf.round(xsj,2)%>" >
      </td>
      <td><%=cf.round(cbj,2)%>
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
      <td><%=sftjcpstr%>
        <input name="sftjcp" type="hidden" value="<%=sftjcp%>" >
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

	rwe=null;
}
catch (Exception e) {
	out.print("���["+xuhao+"]����" + e);
	out.print("<BR>SQL=" + sql);
	return;
}
finally 
{
	outStr=null; 

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
	return true;
}
//-->
</SCRIPT>
