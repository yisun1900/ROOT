<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�����µ����ı���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF" style="FONT-SIZE:16">

<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletConfig().getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String[] dqbm = null;
String zcbmfs = null;


String[][] outStr=null; 
String bgcolor=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;


String xuhao=null;
String ppmc=null;
String cldlbm=null;
String clxlbm=null;
String cllbbm=null;
String clbm=null;
String nbbm=null;
String clmc=null;
String xh=null;
String gg=null;
String clysbm=null;
String jldwbmstr=null;
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

String zdxsjstr=null;
double zdxsj=0;
String yjjrblstr=null;
double yjjrbl=0;
String jsfsstr="";
String jsfs="";
String cxjsblstr=null;
double cxjsbl=0;
String xsfsstr="";
String xsfs="";
String cxyjjrblstr=null;
double cxyjjrbl=0;

String dqmc="";

String bzjldwbm=null;
String bzggStr=null;
String djzlStr=null;
String clcdStr=null;
String clkdStr=null;
String clgdStr=null;
String cgzqStr=null;
String bzqStr=null;
String bztxqStr=null;
String zdkcslStr=null;
String zdkcjeStr=null;

double djzl=0;
double clcd=0;
double clkd=0;
double clgd=0;
int bzgg=0;
int cgzq=0;
int bzq=0;
int bztxq=0;
double zdkcsl=0;
double zdkcje=0;

String cglb=null;
String cglbstr=null;

int count=0;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	dqbm =up.getParameterValues("dqbm");
	zcbmfs =up.getParameter("zcbmfs");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\jcjj\\zcbj\\impdata\\"+yhdlm+".txt";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	for (int i=0;i<dqbm.length ;i++ )
	{
		sql=" select dqmc" ;
		sql+=" from dm_dqbm " ;
		sql+=" where dqbm='"+dqbm[i]+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			dqmc+= rs.getString(1)+"��";			    
		}
		rs.close();
		ps.close();
	}

	
	%> 
<form method="post" action="SaveImpAddData.jsp" name="editform" target="_blank">
  <div align="center">�����µ����ı��ۣ�������<%=dqmc%>����ע�⣺<font color="#FF0000">��ɫ��¼��ʾ��[���ı���]�Ѵ���</font></div>
  <table width="460%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="1%">���</td>
      <td width="2%">��Ʒ��</td>
      <td width="2%">���ϴ���</td>
      <td width="3%">����С��</td>
      <td width="3%">���ϵ��</td>
      <td width="2%">���ı���</td>
      <td width="2%">�ڲ�����</td>
      <td width="4%">��������</td>
      <td width="4%">�ͺ�</td>
      <td width="4%">���</td>
      <td width="2%">��ɫ</td>
      <td width="1%">������λ</td>

	  <td width="1%">��װ������λ</td>
	  <td width="2%">��װ���</td>
	  <td width="2%">��Ʒ������KG��</td>
	  <td width="1%">����(cm)</td>
	  <td width="1%">����(cm)</td>
      <td width="1%">�߶�(cm)</td>
      <td width="1%">�ɹ����ڣ��죩</td>
      <td width="1%">�����ڣ��죩</td>
      <td width="1%">���������ڣ��죩</td>

      <td width="2%">�г����</td>
      <td width="2%">���ۼ�</td>
      <td width="2%">��������޼�</td>
      <td width="2%">ҵ���������</td>
      <td width="2%">���㷽ʽ</td>
      <td width="2%">�����</td>
      <td width="1%">�������</td>
      <td width="1%">��������</td>
      <td width="1%">�д���</td>
      <td width="2%">������ʼʱ��</td>
      <td width="2%">��������ʱ��</td>
      <td width="2%">������</td>
      <td width="2%">���������</td>
      <td width="1%">�����������</td>
      <td width="1%">�����ڼ�������</td>
      <td width="1%">������ҵ���������</td>
      <td width="1%">�������</td>
      <td width="1%">�������</td>
      <td width="1%">�Ƿ��л�</td>
      <td width="2%">��Ʒ����</td>
      <td width="2%">�������</td>
      <td width="2%">��Ʒ˵��</td>
      <td width="2%">����</td>
      <td width="1%">�Ƿ��Ƽ���Ʒ</td>
      <td width="2%">���۷�ʽ</td>
      <td width="3%">��Ƭ����</td>
      <td width="5%">��ע</td>
      <td width="2%">��Ϳ������</td>
      <td width="2%">��Ϳ����</td>
      <td width="2%">�ɹ����</td>
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
		cldlbm=outStr[i][2].trim();
		clxlbm=outStr[i][3].trim();
		cllbbm=outStr[i][4].trim();
		clbm=outStr[i][5].trim();
		nbbm=outStr[i][6].trim();
		clmc=outStr[i][7].trim();
		xh=outStr[i][8].trim();
		gg=outStr[i][9].trim();
		clysbm=outStr[i][10].trim();

		jldwbmstr=outStr[i][11].trim();
		bzjldwbm=outStr[i][12].trim();
		bzggStr=outStr[i][13].trim();
		djzlStr=outStr[i][14].trim();
		clcdStr=outStr[i][15].trim();
		clkdStr=outStr[i][16].trim();
		clgdStr=outStr[i][17].trim();
		cgzqStr=outStr[i][18].trim();
		bzqStr=outStr[i][19].trim();
		bztxqStr=outStr[i][20].trim();


		lsjstr=outStr[i][21].trim();
		xsjstr=outStr[i][22].trim();
		zdxsjstr=outStr[i][23].trim();
		yjjrblstr=outStr[i][24].trim();
		jsfsstr=outStr[i][25].trim();
		cbjstr=outStr[i][26].trim();
		jsblstr=outStr[i][27].trim();
		cxhdblstr=outStr[i][28].trim();
		sfycxstr=outStr[i][29].trim();

		cxkssjstr=outStr[i][30].trim();
		cxjzsjstr=outStr[i][31].trim();
		cxjstr=outStr[i][32].trim();
		cxcbjstr=outStr[i][33].trim();
		cxjsblstr=outStr[i][34].trim();
		lscxhdblstr=outStr[i][35].trim();
		cxyjjrblstr=outStr[i][36].trim();
		sfbhpjstr=outStr[i][37].trim();
		pjtsstr=outStr[i][38].trim();
		sfyhstr=outStr[i][39].trim();

		cpjb=outStr[i][40].trim();
		fgsx=outStr[i][41].trim();
		cpsm=outStr[i][42].trim();
		cd=outStr[i][43].trim();
		sftjcpstr=outStr[i][44].trim();
		xsfsstr=outStr[i][45].trim();
		zp=outStr[i][46].trim();
		bz=outStr[i][47].trim();
		zdkcslStr=outStr[i][48].trim();
		zdkcjeStr=outStr[i][49].trim();
		cglbstr=outStr[i][50].trim();

		if (clmc.equals(""))
		{
			out.println("<BR>���������["+xuhao+"]�����������Ʋ���Ϊ��");
			return;
		}

		count=0;
		sql=" select count(*)" ;
		sql+=" from jxc_cldlbm " ;
		sql+=" where cldlmc='"+cldlbm+"'" ;
		sql+=" and cldllb in('1','3')" ;
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
			out.println("<BR>���������["+xuhao+"]���󣬲����ڵ�[���ϴ���]����"+cldlbm+"��");
		}

		count=0;

		sql=" select count(*)" ;
		sql+=" from jxc_clxlbm " ;
		sql+=" where cldlmc='"+cldlbm+"'" ;
		sql+=" and clxlmc='"+clxlbm+"'" ;
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
			out.println("<BR>���������["+xuhao+"]���󣬲��ϴ����в�����[����С��]����"+clxlbm+"��");
		}

		//Ʒ��
		String getcldlbm=null;
		if (ppmc!=null && !ppmc.equals(""))
		{
			sql=" select cldl" ;
			sql+=" from jxc_ppxx " ;
			sql+=" where ppmc='"+ppmc+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				getcldlbm = rs.getString("cldl");			    
			}
			else{
				out.println("<BR>���������["+xuhao+"]���󣬲����ڵ�[��Ʒ������]����"+ppmc+"��");
//				return;
			}
			rs.close();
			ps.close();

			if (!getcldlbm.equals(cldlbm))
			{
				out.println("<BR>���������["+xuhao+"]����[��Ʒ��]��[���ϴ���]�޶�Ӧ��ϵ");
//				return;
			}
		}
		else{
			out.println("<BR>���������["+xuhao+"]����[��Ʒ������]����Ϊ��");
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


		if (bzjldwbm.equals(""))
		{
			out.println("�������ڲ�����["+nbbm+"]����[��װ������λ]Ϊ��");
			return;
		}
		else{
			sql=" select count(*)" ;
			sql+=" from jdm_jldwbm " ;
			sql+=" where jldwmc='"+bzjldwbm+"'" ;
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
				out.println("<BR>�������ڲ�����["+nbbm+"]���󣬲����ڵ�[��װ������λ]��"+bzjldwbm);
				return;
			}
		}


		if (bzggStr.equals(""))
		{
			out.println("�������ڲ�����["+nbbm+"]����[��װ���]Ϊ��");
			return;
		}
		else{
			try{
				bzgg=Integer.parseInt(bzggStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�������ڲ�����["+nbbm+"]����[��װ���:"+bzggStr+"]��������:"+e);
				return;
			}
		}

		if (djzlStr.equals(""))
		{
			djzl=0;
		}
		else{
			try{
				djzl=Double.parseDouble(djzlStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�������ڲ�����["+nbbm+"]����[��Ʒ����:"+djzlStr+"]��������:"+e);
				return;
			}
		}

		if (clcdStr.equals(""))
		{
			clcd=0;
		}
		else{
			try{
				clcd=Double.parseDouble(clcdStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�������ڲ�����["+nbbm+"]����[����:"+clcdStr+"]��������:"+e);
				return;
			}
		}

		if (clkdStr.equals(""))
		{
			clkd=0;
		}
		else{
			try{
				clkd=Double.parseDouble(clkdStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�������ڲ�����["+nbbm+"]����[����:"+clkdStr+"]��������:"+e);
				return;
			}
		}

		if (clgdStr.equals(""))
		{
			clgd=0;
		}
		else{
			try{
				clgd=Double.parseDouble(clgdStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�������ڲ�����["+nbbm+"]����[�߶�:"+clgdStr+"]��������:"+e);
				return;
			}
		}

		if (cgzqStr.equals(""))
		{
			cgzq=0;
		}
		else{
			try{
				cgzq=Integer.parseInt(cgzqStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�������ڲ�����["+nbbm+"]����[�ɹ�����:"+cgzqStr+"]��������:"+e);
				return;
			}
		}

		if (bzqStr.equals(""))
		{
			bzq=0;
		}
		else{
			try{
				bzq=Integer.parseInt(bzqStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�������ڲ�����["+nbbm+"]����[������:"+bzqStr+"]��������:"+e);
				return;
			}
		}

		if (bztxqStr.equals(""))
		{
			bztxq=0;
		}
		else{
			try{
				bztxq=Integer.parseInt(bztxqStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�������ڲ�����["+nbbm+"]����[����������:"+bztxqStr+"]��������:"+e);
				return;
			}
		}
	
		
		
		//�г����
		lsj=0;
		if (lsjstr!=null && !lsjstr.trim().equals(""))
		{
			try{
				lsj=Double.parseDouble(lsjstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]������[�г����]�����֣�" + lsjstr);
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
				out.print("���["+xuhao+"]������[���ۼ�]�����֣�" + xsjstr);
				return;
			}
		}
		//��������޼�
		zdxsj=0;
		if (zdxsjstr!=null && !zdxsjstr.trim().equals(""))
		{
			try{
				zdxsj=Double.parseDouble(zdxsjstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]������[��������޼�]�����֣�" + zdxsjstr);
				return;
			}
		}
		//ҵ���������
		yjjrbl=100;
		if (yjjrblstr!=null && !yjjrblstr.trim().equals(""))
		{
			try{
				yjjrbl=Double.parseDouble(yjjrblstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]������[ҵ���������]�����֣�" + yjjrblstr);
				return;
			}
		}
		//���㷽ʽ
		jsfs="1";//1������ۣ�2���������
		if (jsfsstr!=null && !jsfsstr.equals(""))
		{
			if (jsfsstr.equals("�����"))
			{
				jsfs="1";
			}
			else if (jsfsstr.equals("�������"))
			{
				jsfs="2";
			}
			else{
				jsfsstr="�����";
				jsfs="1";
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
				out.print("���["+xuhao+"]������[�����]�����֣�" + cbjstr);
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
				out.print("���["+xuhao+"]������[�������]�����֣�" + jsblstr);
				return;
			}
		}
		if (jsfs.equals("1") && cbj==0)
		{
			out.print("<P>���ѣ����["+xuhao+"][�����]Ϊ0");
		}
		if (jsfs.equals("2") && jsbl==0)
		{
			out.print("<P>���ѣ����["+xuhao+"][�������]Ϊ0");
		}

		//������
		cxj=0;
		if (cxjstr!=null && !cxjstr.trim().equals(""))
		{
			try{
				cxj=Double.parseDouble(cxjstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]������[������]�����֣�" + cxjstr);
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
				out.print("���["+xuhao+"]������[������ʼʱ��]�����ڣ�" + cxkssjstr);
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
				out.print("���["+xuhao+"]������[��������ʱ��]�����ڣ�" + cxjzsjstr);
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
				out.print("���["+xuhao+"]������[��������]�����֣�" + cxhdblstr);
				return;
			}
		}
		else{
			cxhdbl=0;
		}

		//���������
		cxcbj=0;
		if (cxcbjstr!=null && !cxcbjstr.trim().equals(""))
		{
			try{
				cxcbj=Double.parseDouble(cxcbjstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]������[���������]�����֣�" + cxcbjstr);
				return;
			}
		}
		//�����������
		cxjsbl=0;
		if (cxjsblstr!=null && !cxjsblstr.trim().equals(""))
		{
			try{
				cxjsbl=Double.parseDouble(cxjsblstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]������[�����������]�����֣�" + cxjsblstr);
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
				out.print("���["+xuhao+"]������[������������]�����֣�" + lscxhdblstr);
				return;
			}
		}
		
		//������ҵ���������
		cxyjjrbl=100;
		if (cxyjjrblstr!=null && !cxyjjrblstr.trim().equals(""))
		{
			try{
				cxyjjrbl=Double.parseDouble(cxyjjrblstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]������[������ҵ���������]�����֣�" + cxyjjrblstr);
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
				out.print("<BR>���["+xuhao+"]��������Ϊ�д�����[������]������");
				return;
			}
			//������ʼʱ��
			if (cxkssjstr==null || cxkssjstr.trim().equals(""))
			{
				out.print("<BR>���["+xuhao+"]��������Ϊ�д�����[������ʼʱ��]������");
				return;
			}
			//��������ʱ��
			if (cxjzsjstr==null || cxjzsjstr.trim().equals(""))
			{
				out.print("<BR>���["+xuhao+"]��������Ϊ�д�����[��������ʱ��]������");
				return;
			}
			if (cxcbjstr==null || cxcbjstr.trim().equals(""))
			{
				out.print("<BR>���["+xuhao+"]��������Ϊ�д�����[���������]������");
				return;
			}
			if (lscxhdblstr==null || lscxhdblstr.trim().equals(""))
			{
				out.print("<BR>���["+xuhao+"]��������Ϊ�д�����[�����ڼ�������]������");
				return;
			}
			if (cxyjjrblstr==null || cxyjjrblstr.trim().equals(""))
			{
				out.print("<BR>���["+xuhao+"]��������Ϊ�д�����[������ҵ���������]������");
				return;
			}

			if (jsfs.equals("1") && cxcbj==0)
			{
				out.print("<P>���ѣ����["+xuhao+"][���������]Ϊ0");
			}
			if (jsfs.equals("2") && cxjsbl==0)
			{
				out.print("<P>���ѣ����["+xuhao+"][�����������]Ϊ0");
			}
		}
		else{
			//������
			if (cxjstr!=null && !cxjstr.trim().equals("") && !cxjstr.trim().equals("0"))
			{
				out.print("<BR>���["+xuhao+"]���ѣ���Ϊû�д�����������[������]");
				cxjstr="";
				cxj=0;
			}
			//������ʼʱ��
			if (cxkssjstr!=null && !cxkssjstr.trim().equals(""))
			{
				out.print("<BR>���["+xuhao+"]���ѣ���Ϊû�д�����������[������ʼʱ��]");
				cxkssjstr="";
			}
			//��������ʱ��
			if (cxjzsjstr!=null && !cxjzsjstr.trim().equals(""))
			{
				out.print("<BR>���["+xuhao+"]���ѣ���Ϊû�д�����������[��������ʱ��]");
				cxjzsjstr="";
			}
			if (cxcbjstr!=null && !cxcbjstr.trim().equals("") && !cxcbjstr.trim().equals("0"))
			{
				out.print("<BR>���["+xuhao+"]���ѣ���Ϊû�д�����������[���������]");
				cxcbjstr="";
				cxcbj=0;
			}
			if (lscxhdblstr!=null && !lscxhdblstr.trim().equals("") && !lscxhdblstr.trim().equals("0"))
			{
				out.print("<BR>���["+xuhao+"]���ѣ���Ϊû�д�����������[������������]");
				lscxhdblstr="";
				lscxhdbl=0;
			}
			if (cxyjjrbl!=0)
			{
				out.print("<BR>���["+xuhao+"]���ѣ���Ϊû�д�����������[������ҵ���������]:"+cxyjjrbl);
//				cxyjjrblstr="";
//				cxyjjrbl=0;
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
				out.print("���["+xuhao+"]������[�������]�����֣�" + pjtsstr);
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
			out.println("<BR>���������["+xuhao+"]����[�Ƿ��л�]Ϊ��");
			return;
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


		//���۷�ʽ
		xsfs="3";//1������Ʒ��2���ֻ����ۣ�3���ڻ����ۣ�4����������
		if (xsfsstr!=null && !xsfsstr.equals(""))
		{
			if (xsfsstr.equals("�ֻ�����"))
			{
				xsfs="2";
			}
			else if (xsfsstr.equals("�ڻ�����"))
			{
				xsfs="3";
			}
			else{
				xsfsstr="�ڻ�����";
				xsfs="3";
			}
		}
		
		
		//��Ϳ������
		zdkcsl=0;
		if (zdkcslStr!=null && !zdkcslStr.trim().equals(""))
		{
			try{
				zdkcsl=Double.parseDouble(zdkcslStr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]������[��Ϳ������]�����֣�" + zdkcslStr);
				return;
			}
		}

		
		//��Ϳ����
		zdkcje=0;
		if (zdkcjeStr!=null && !zdkcjeStr.trim().equals(""))
		{
			try{
				zdkcje=Double.parseDouble(zdkcjeStr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]������[��Ϳ����]�����֣�" + zdkcjeStr);
				return;
			}
		}

		
		if (cglbstr.equals("���Ųɹ�"))
		{
			cglb="J";
		}
		else if (cglbstr.equals("�ط��ɹ�"))
		{
			cglb="D";
		}
		else if (cglbstr.equals(""))
		{
			cglb="D";
			cglbstr="�ط��ɹ�";
			out.println("<BR>���["+xuhao+"]���ѣ�[�ɹ����]Ϊ�գ�Ĭ��Ϊ���ط��ɹ���");
		}
		else{
			out.println("<BR>���["+xuhao+"]������[�ɹ����]ֻ��Ϊ�����Ųɹ����ط��ɹ�����ĿǰΪ["+cglbstr+"]");
			return;
		}

		if (zcbmfs.equals("2"))//���ı��뵼��
		{
			if (clbm.equals(""))
			{
				out.println("<BR>���["+xuhao+"]������[���ı��롿Ϊ��");
//				return;
			}
			else if (clbm.length()!=13)
			{
				out.println("<BR>���["+xuhao+"]������[���ı��롿����ӦΪ13λ:"+clbm);
//				return;
			}
			else
			{
				if (!clbm.startsWith("ZC2"))
				{
					out.println("<BR>���["+xuhao+"]������[���ı��롿Ӧ���ԡ�ZC2����ͷ:"+clbm);
	//				return;
				}
				else{
					try
					{
						Integer.parseInt(clbm.substring(3,13));
					}
					catch(Exception e)
					{
						out.println("<BR>���["+xuhao+"]������[���ı��롿��10λӦ��������:"+clbm.substring(3,13));
		//				return;
					}
				}
			}
			sql=" select count(*)" ;
			sql+=" from jxc_clbm " ;
			sql+=" where  clbm='"+clbm+"'" ;
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
		}
		else{
			clbm="";
		}
%> 


	
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=xuhao%> 
        <input name="xuhao" type="hidden" value="<%=xuhao%>">
      </td>
      <td><%=ppmc%>
        <input name="ppmc" type="hidden" value="<%=ppmc%>" >
      </td>
      <td><%=cldlbm%>
        <input name="cldlbm" type="hidden" value="<%=cldlbm%>" >
      </td>
      <td><%=clxlbm%>
        <input name="clxlbm" type="hidden" value="<%=clxlbm%>" >
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
      <td><%=bzjldwbm%>
        <input name="bzjldwbm" type="hidden" value="<%=bzjldwbm%>" >
      </td>
      <td> <%=bzggStr%>
        <input name="bzgg" type="hidden" value="<%=bzgg%>" >
      </td>
      <td> <%=djzlStr%>
        <input name="djzl" type="hidden" value="<%=djzl%>" >
      </td>
      <td> <%=clcdStr%>
        <input name="clcd" type="hidden" value="<%=clcd%>" >
      </td>
      <td> <%=clkdStr%>
        <input name="clkd" type="hidden" value="<%=clkd%>" >
      </td>
      <td ><%=clgdStr%>
        <input name="clgd" type="hidden" value="<%=clgd%>" >
      </td>
      <td ><%=cgzqStr%>
        <input name="cgzq" type="hidden" value="<%=cgzq%>" >
      </td>
      <td ><%=bzqStr%>
        <input name="bzq" type="hidden" value="<%=bzq%>" >
      </td>
      <td ><%=bztxqStr%>
        <input name="bztxq" type="hidden" value="<%=bztxq%>" >
      </td>
      <td><%=cf.round(lsj,2)%>
        <input name="lsj" type="hidden" value="<%=cf.round(lsj,2)%>" >
      </td>
      <td ><%=cf.round(xsj,2)%>
        <input name="xsj" type="hidden" value="<%=cf.round(xsj,2)%>" >
      </td>
      <td ><%=zdxsj%>
        <input name="zdxsj" type="hidden" value="<%=zdxsj%>" >
      </td>
      <td ><%=yjjrbl%>
        <input name="yjjrbl" type="hidden" value="<%=yjjrbl%>" >
      </td>
      <td ><%=jsfsstr%>
        <input name="jsfs" type="hidden" value="<%=jsfs%>" >
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
      <td><%=cxjsbl%>
        <input name="cxjsbl" type="hidden" value="<%=cxjsbl%>" >
      </td>
      <td><%=lscxhdblstr%>%
        <input name="lscxhdbl" type="hidden" value="<%=lscxhdbl%>" >
      </td>
      <td><%=cxyjjrblstr%>%
        <input name="cxyjjrbl" type="hidden" value="<%=cxyjjrbl%>" >
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
      <td><%=xsfsstr%>
        <input name="xsfs" type="hidden" value="<%=xsfs%>" >
      </td>
      <td align="left"><%=zp%>
        <input name="zp" type="hidden" value="<%=zp%>" >
      </td>
      <td align="left"><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
      </td>
      <td ><%=zdkcslStr%>
        <input name="zdkcsl" type="hidden" value="<%=zdkcsl%>" >
      </td>
      <td ><%=zdkcjeStr%>
        <input name="zdkcje" type="hidden" value="<%=zdkcje%>" >
      </td>
      <td ><%=cglbstr%>
        <input name="cglb" type="hidden" value="<%=cglb%>" >
      </td>
    </tr>
    <%
	}

	rwe=null;
}
catch (Exception e) {
	out.print("���["+xuhao+"]������" + e);
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
      <td colspan="53"> 
<%
for (int i=0;i<dqbm.length ;i++ )
{
	%>
	<input name="dqbm" type="hidden" value="<%=dqbm[i]%>" >
	<%
}
%>
		<input name="zcbmfs" type="hidden" value="<%=zcbmfs%>" >
        <input type="button"  value="����" name="bc" onClick="f_do(editform)">
        <input type="button"  value="���´���" onClick="bc.disabled=false;">
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