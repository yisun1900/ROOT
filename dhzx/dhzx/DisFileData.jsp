<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������� </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

%>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;
String[][] outStr=null; 
String ls=null;

String khxm=null;
String xb=null;
String xbstr=null;
String lxfs=null;
String qtdh=null;
String cqbm=null;
String cqbmstr=null;
String xqbm=null;
String louhao=null;
String fwdz=null;
int fwmj=0;
String fwmjstr=null;

String xxlybm=null;
String xxlybmstr=null;
String xxlysm=null;
String sfxhf=null;
String sfxhfstr=null;
java.sql.Date hfrq=null;
String hfrqstr=null;
String jzbz=null;
String jzbzstr=null;
String khjl=null;
String sjs=null;
String ywy=null;
String dwmc=null;
String zxdm=null;
String fgsmc=null;
String fgsbh=null;

String clgw=null;
String hth=null;
double sjf=0;
String sjfstr=null;
double lfdj=0;
String lfdjstr=null;
java.sql.Date jsjfsj=null;
String jsjfsjstr=null;
java.sql.Date jlfdjsj=null;
String jlfdjsjstr=null;


java.sql.Date yjzxsj=null;
String yjzxsjstr=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrsjstr=null;
String zxdjbm=null;
String zxdjbmstr=null;


java.sql.Date ctsj=null;
String ctsjstr=null;
java.sql.Date jhctsj=null;
String jhctsjstr=null;

java.sql.Date cxgtsj=null;
String cxgtsjstr=null;
java.sql.Date jhcxgtsj=null;
String jhcxgtsjstr=null;

java.sql.Date csgtsj=null;
String csgtsjstr=null;
java.sql.Date jhcsgtsj=null;
String jhcsgtsjstr=null;

java.sql.Date sczbjsj=null;
String sczbjsjstr=null;
java.sql.Date jhzbjsj=null;
String jhzbjsjstr=null;

String khzyxz=null;



String bz=null;




Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	
	%> 
<form method="post" action="SaveDisFileData.jsp" name="editform" target="_blank">
<div align="center">����ͻ���Ϣ</div>
  <table width="450%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="0" cellspacing="1">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="1%">���</td>
      <td width="2%">�ͻ�����</td>
      <td width="1%">�Ա�</td>
	  <td width="3%">�ֻ�</td>
	  <td width="3%">�����绰</td>
	  <td width="2%">��������</td>
	  <td width="3%">С��</td>
	  <td width="3%">¥��</td>
	  <td width="7%">���ݵ�ַ</td>
      <td width="2%">���ڽ������</td>
      <td width="4%">��Ϣ��Դ</td>
      <td width="5%">��Ϣ��Դ˵��</td>
	  <td width="2%">�Ƿ���ط�</td>
	  <td width="2%">�ط�����</td>	 
	  <td width="2%">��װ��װ</td>	 
      <td width="2%">�ͻ�����</td>
      <td width="2%">�Ҿӹ���</td>
      <td width="2%">���ʦ</td>
      <td width="2%">ҵ��Ա</td>
	  <td width="3%">��ѯ����</td>
	  <td width="3%">�����ֹ�˾</td>
	  <td width="2%">Ԥ��װ��ʱ��</td>
	  <td width="2%">�ƻ���ƽ��ͼʱ��</td>
	  <td width="2%">ʵ��ƽ��ͼʱ��</td>
	  <td width="2%">�ƻ���Ч��ͼʱ��</td>
	  <td width="2%">ʵ��Ч��ͼʱ��</td>
	  <td width="2%">�ƻ���ʩ��ͼʱ��</td>
	  <td width="2%">ʵ��ʩ��ͼʱ��</td>
	  <td width="2%">�ƻ������ӱ���ʱ��</td>
	  <td width="2%">ʵ�����ӱ���ʱ��</td>
      <td width="2%">��ƺ�ͬ��</td>
	  <td width="2%">ʵ����Ʒ�</td>
	  <td width="2%">ʵ�ʽ���Ʒ�ʱ��</td>
	  <td width="2%">ʵ�ն���</td>
	  <td width="2%">ʵ�ʽ�����ʱ��</td>
	  <td width="2%">�ͻ���Դ����</td>
	  <td width="2%">¼����</td>
	  <td width="2%">¼��ʱ��</td>
	  <td width="3%">¼�벿��</td>
	  <td width="7%">��ע</td>
	

    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(filename); 
	String bgcolor="";
	String row="";

	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		
		row=outStr[i][0].trim();
		khxm=outStr[i][1].trim();
		xbstr=outStr[i][2].trim();
		lxfs=outStr[i][3].trim();
		qtdh=outStr[i][4].trim();
		cqbmstr=outStr[i][5].trim();
		xqbm=outStr[i][6].trim();
		louhao=outStr[i][7].trim();
		fwdz=outStr[i][8].trim();
		fwmjstr=outStr[i][9].trim();
		xxlybmstr=outStr[i][10].trim();

		xxlysm=outStr[i][11].trim();
		sfxhfstr=outStr[i][12].trim();
		hfrqstr=outStr[i][13].trim();
		jzbzstr=outStr[i][14].trim();
		khjl=outStr[i][15].trim();
		clgw=outStr[i][16].trim();
		sjs=outStr[i][17].trim();
		ywy=outStr[i][18].trim();
		dwmc=outStr[i][19].trim();
		fgsmc=outStr[i][20].trim();
		yjzxsjstr=outStr[i][21].trim();

		jhctsjstr=outStr[i][22].trim();
		ctsjstr=outStr[i][23].trim();
		jhcxgtsjstr=outStr[i][24].trim();
		cxgtsjstr=outStr[i][25].trim();
		jhcsgtsjstr=outStr[i][26].trim();
		csgtsjstr=outStr[i][27].trim();
		jhzbjsjstr=outStr[i][28].trim();
		sczbjsjstr=outStr[i][29].trim();

        hth=outStr[i][30].trim();
        sjfstr=outStr[i][31].trim();
        jsjfsjstr=outStr[i][32].trim();
        lfdjstr=outStr[i][33].trim();
        jlfdjsjstr=outStr[i][34].trim();
		khzyxz=outStr[i][35].trim();
		lrr=outStr[i][36].trim();

		lrsjstr=outStr[i][37].trim();
		zxdjbmstr=outStr[i][38].trim();
		bz=outStr[i][39].trim();

		if(khxm==null||khxm.equals(""))
		{
//			out.print("<BR>���ѣ���š�"+row+"���ͻ�����Ϊ�գ����������Զ�������");
			break;
		}

		//��顺�����ֹ�˾���Ƿ���ȷ
		String dqbm=null;
		sql="select dwbh,dqbm";
		sql+=" from  sq_dwxx";
		sql+=" where dwmc='"+fgsmc.trim()+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fgsbh=rs.getString("dwbh");
			dqbm=rs.getString("dqbm");
		}
		else{
			out.print("<BR>��š�"+row+"�����������ֹ�˾��"+fgsmc+"�������ڣ�");
			return;
		}
		rs.close();
		ps.close();

		//��顺��ѯ���桻�Ƿ���ȷ
		sql="select dwbh";
		sql+=" from  sq_dwxx";
		sql+=" where ssfgs='"+fgsbh+"' and dwmc='"+dwmc.trim()+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zxdm=rs.getString("dwbh");
		}
		else{
			out.print("<BR>��š�"+row+"��������ѯ���桺"+dwmc+"�������ڣ�");
			return;
		}
		rs.close();
		ps.close();

		//��顺¼�벿�š��Ƿ���ȷ
		sql="select dwbh";
		sql+=" from  sq_dwxx";
		sql+=" where dwmc='"+zxdjbmstr.trim()+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zxdjbm=rs.getString("dwbh");
		}
		else{
			out.print("<BR>��š�"+row+"������¼�벿�š�"+zxdjbmstr+"�������ڣ�");
			return;
		}
		rs.close();
		ps.close();

		//��顺�Ա��Ƿ���ȷ
		if (xbstr==null || xbstr.equals(""))//M;�У�W��Ů
		{
			out.print("<BR>��š�"+row+"�����󣡡��Ա𡻲���Ϊ�գ�");
			return;
		}
		else if (xbstr.trim().equals("��"))
		{
			xb="M";
		}
		else if (xbstr.trim().equals("Ů"))
		{
			xb="W";
		}
		else{
			out.print("<BR>��š�"+row+"�����󣡡��Ա𡻲���ȷ��ֻ���ǡ��С�Ů������֮һ��");
			return;
		}

		//��顺�����������Ƿ���ȷ
		if (cqbmstr==null || cqbmstr.equals(""))
		{
			cqbm="";
		}
		else{
			sql="select cqbm";
			sql+=" from  dm_cqbm";
			sql+=" where dqbm='"+dqbm+"' and cqmc='"+cqbmstr.trim()+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				cqbm=rs.getString("cqbm");
			}
			else{
				out.print("<BR>��š�"+row+"����������������"+cqbmstr+"�������ڣ�");
				return;
			}
			rs.close();
			ps.close();
		}

		//��顺���ݵ�ַ���Ƿ���ȷ
		if (fwdz==null || fwdz.equals(""))
		{
			out.print("<BR>��š�"+row+"�����󣡡����ݵ�ַ������Ϊ�գ�");
			return;
		}


		//��顺���ڽ���������Ƿ���ȷ
		if (fwmjstr==null || fwmjstr.equals(""))
		{
			fwmj=0;
		}
		else{
			try{
				fwmj=(int)Double.parseDouble(fwmjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+row+"���������ڽ��������"+fwmjstr+"�������������ͣ�");
				return;
			}
		}

		//��顺��Ϣ��Դ���Ƿ���ȷ
		if (xxlybmstr==null || xxlybmstr.equals(""))
		{
			xxlybm="";
		}
		else{
			sql="select xxlybm";
			sql+=" from  dm_xxlybm";
			sql+=" where xxlymc='"+xxlybmstr.trim()+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				xxlybm=rs.getString("xxlybm");
			}
			else{
				out.print("<BR>��š�"+row+"��������Ϣ��Դ��"+xxlybmstr+"�������ڣ�");
				return;
			}
			rs.close();
			ps.close();
		}

		//��顺�Ƿ���طá��Ƿ���ȷ
		if (sfxhfstr==null || sfxhfstr.equals(""))//Y����طã�N������ط�
		{
			out.print("<BR>��š�"+row+"�����󣡡��Ƿ���طá�����Ϊ�գ�");
			return;
		}
		else if (sfxhfstr.trim().equals("��ط�"))
		{
			sfxhf="Y";

			//��顺�ط����ڡ��Ƿ���ȷ
			if (hfrqstr==null || hfrqstr.equals(""))
			{
				out.print("<BR>��š�"+row+"�����󣡡��ط����ڡ�����Ϊ�գ�");
				return;
			}
			else{
				try{
					hfrq=java.sql.Date.valueOf(hfrqstr.trim());
				}
				catch (Exception e){
					out.print("<BR>��š�"+row+"�����󣡻ط����ڡ�"+hfrqstr+"�������������͸�ʽ��YYYY-MM-DD����");
					return;
				}
			}
		}
		else if (sfxhfstr.trim().equals("����ط�"))
		{
			sfxhf="N";
			hfrqstr="";
		}
		else{
			out.print("<BR>��š�"+row+"�����󣡡��Ƿ���طá�����ȷ��ֻ���ǡ���طá�����طá�����֮һ��");
			return;
		}

		//��顺��װ��װ���Ƿ���ȷ
		if (jzbzstr==null || jzbzstr.equals(""))//1����װ��2����װ
		{
			out.print("<BR>��š�"+row+"�����󣡡���װ��װ������Ϊ�գ�");
			return;
		}
		else if (jzbzstr.trim().equals("��װ"))
		{
			jzbz="1";
		}
		else if (jzbzstr.trim().equals("��װ"))
		{
			jzbz="2";
		}
		else{
			out.print("<BR>��š�"+row+"�����󣡡���װ��װ������ȷ��ֻ���ǡ���װ����װ������֮һ��");
			return;
		}

		int count=0;
		//��顺�ͻ��������Ƿ���ȷ
		if (khjl==null || khjl.equals(""))
		{
		}
		else{
			sql="select count(*)";
			sql+=" from  sq_yhxx";
			sql+=" where ssfgs='"+fgsbh+"' and zwbm='03' and yhmc='"+khjl.trim()+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count<1)
			{
				out.print("<BR>��š�"+row+"�����ѣ��ͻ�������"+khjl+"�������ڣ�");
//				return;
			}
		}

		//��顺�Ҿӹ��ʡ��Ƿ���ȷ
		if (clgw==null || clgw.equals(""))
		{
		}
		else{
			sql="select count(*)";
			sql+=" from  sq_yhxx";
			sql+=" where ssfgs='"+fgsbh+"' and zwbm='08' and yhmc='"+clgw.trim()+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count<1)
			{
				out.print("<BR>��š�"+row+"�����ѣ��Ҿӹ��ʡ�"+clgw+"�������ڣ�");
//				return;
			}
		}

		//��顺���ʦ���Ƿ���ȷ
		if (sjs==null || sjs.equals(""))
		{
		}
		else{
			sql="select count(*)";
			sql+=" from  sq_yhxx";
			sql+=" where dwbh='"+zxdm+"' and zwbm='04' and yhmc='"+sjs.trim()+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count<1)
			{
				out.print("<BR>��š�"+row+"�����ѣ����ʦ��"+sjs+"�������ڣ�");
//				return;
			}
		}

		//��顺ҵ��Ա���Ƿ���ȷ
		if (ywy==null || ywy.equals(""))
		{
		}
		else{
			sql="select count(*)";
			sql+=" from  sq_yhxx";
			sql+=" where ssfgs='"+fgsbh+"' and zwbm='19' and yhmc='"+ywy.trim()+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count<1)
			{
				out.print("<BR>��š�"+row+"�����ѣ�ҵ��Ա��"+ywy+"�������ڣ�");
//				return;
			}
		}

		//��顺Ԥ��װ��ʱ�䡻�Ƿ���ȷ
		if (yjzxsjstr==null || yjzxsjstr.equals(""))
		{
		}
		else{
			try{
				yjzxsj=java.sql.Date.valueOf(yjzxsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+row+"������Ԥ��װ��ʱ�䡺"+yjzxsjstr+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}


		//���[�ƻ���ƽ��ͼʱ��]�Ƿ���ȷ
		if (jhctsjstr==null || jhctsjstr.equals(""))
		{
		}
		else{
			try{
				jhctsj=java.sql.Date.valueOf(jhctsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+row+"�����󣡼ƻ���ƽ��ͼʱ�䡺"+jhctsjstr+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		//���[ʵ��ƽ��ͼʱ��]�Ƿ���ȷ
		if (ctsjstr==null || ctsjstr.equals(""))
		{
		}
		else{
			try{
				ctsj=java.sql.Date.valueOf(ctsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+row+"������ʵ��ƽ��ͼʱ�䡺"+ctsjstr+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		//���[�ƻ���Ч��ͼʱ��]�Ƿ���ȷ
		if (jhcxgtsjstr==null || jhcxgtsjstr.equals(""))
		{
		}
		else{
			try{
				jhcxgtsj=java.sql.Date.valueOf(jhcxgtsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+row+"�����󣡼ƻ���Ч��ͼʱ�䡺"+jhcxgtsjstr+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		//���[ʵ��Ч��ͼʱ��]�Ƿ���ȷ
		if (cxgtsjstr==null || cxgtsjstr.equals(""))
		{
		}
		else{
			try{
				cxgtsj=java.sql.Date.valueOf(cxgtsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+row+"������ʵ��Ч��ͼʱ�䡺"+cxgtsjstr+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}
		//���[�ƻ���ʩ��ͼʱ��]�Ƿ���ȷ
		if (jhcsgtsjstr==null || jhcsgtsjstr.equals(""))
		{
		}
		else{
			try{
				jhcsgtsj=java.sql.Date.valueOf(jhcsgtsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+row+"�����󣡼ƻ���ʩ��ͼʱ�䡺"+jhcsgtsjstr+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		//���[ʵ��ʩ��ͼʱ��]�Ƿ���ȷ
		if (csgtsjstr==null || csgtsjstr.equals(""))
		{
		}
		else{
			try{
				csgtsj=java.sql.Date.valueOf(csgtsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+row+"������ʵ��ʩ��ͼʱ�䡺"+csgtsjstr+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}
		//���[�ƻ������ӱ���ʱ��]�Ƿ���ȷ
		if (jhzbjsjstr==null || jhzbjsjstr.equals(""))
		{
		}
		else{
			try{
				jhzbjsj=java.sql.Date.valueOf(jhzbjsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+row+"�����󣡼ƻ������ӱ���ʱ�䡺"+jhzbjsjstr+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		//���[ʵ�����ӱ���ʱ��]�Ƿ���ȷ
		if (sczbjsjstr==null || sczbjsjstr.equals(""))
		{
		}
		else{
			try{
				sczbjsj=java.sql.Date.valueOf(sczbjsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+row+"������ʵ�����ӱ���ʱ�䡺"+sczbjsjstr+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		//��顺��ƺ�ͬ���Ƿ���ȷ
		if (sjfstr==null || sjfstr.equals(""))
		{
			sjf=0;
		}
		else{
			try{
				sjf=(int)Double.parseDouble(sjfstr.trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+row+"��������ƺ�ͬ��"+sjfstr+"�������������ͣ�");
				return;
			}
		}

		//��顺ʵ�ʽ���Ʒ�ʱ�䡻�Ƿ���ȷ
		if (jsjfsjstr==null || jsjfsjstr.equals(""))
		{
		}
		else{
			try{
				jsjfsj=java.sql.Date.valueOf(jsjfsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+row+"������ʵ�ʽ���Ʒ�ʱ�䡺"+jsjfsjstr+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		//��顺������Ƿ���ȷ
		if (lfdjstr==null || lfdjstr.equals(""))
		{
			lfdj=0;
		}
		else{
			try{
				lfdj=(int)Double.parseDouble(lfdjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+row+"�����󣡶����"+lfdjstr+"�������������ͣ�");
				return;
			}
		}

		//��顺ʵ�ʽ�����ʱ�䡻�Ƿ���ȷ
		if (jlfdjsjstr==null || jlfdjsjstr.equals(""))
		{
		}
		else{
			try{
				jlfdjsj=java.sql.Date.valueOf(jlfdjsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+row+"������ʵ�ʽ�����ʱ�䡺"+jlfdjsjstr+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		//��顺�ͻ���Դ���ʡ��Ƿ���ȷ
		if (khzyxz==null || khzyxz.equals(""))
		{
		}
		else{
			sql="select count(*)";
			sql+=" from  dm_khzyxzbm";
			sql+=" where khzyxz='"+khzyxz+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count<1)
			{
				out.print("<BR>��š�"+row+"�����󣡿ͻ���Դ���ʡ�"+khzyxz+"�������ڣ�");
				return;
			}
		}

		//��顺¼���ˡ��Ƿ���ȷ
		if (lrr==null || lrr.equals(""))
		{
			out.print("<BR>��š�"+row+"�����󣡡�¼���ˡ�����Ϊ�գ�");
			return;
		}

		//��顺¼��ʱ�䡻�Ƿ���ȷ
		if (lrsjstr==null || lrsjstr.equals(""))
		{
			out.print("<BR>��š�"+row+"�����󣡡�¼��ʱ�䡻����Ϊ�գ�");
			return;
		}
		else{
			try{
				lrsj=java.sql.Date.valueOf(lrsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>��š�"+row+"������¼��ʱ�䡺"+lrsjstr+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=row%> 
        <input name="row" type="hidden" value="<%=row%>">
      </td>
      <td><%=khxm%> 
        <input name="khxm" type="hidden" value="<%=khxm%>">
      </td>
      <td><%=xbstr%> 
        <input name="xb" type="hidden" value="<%=xb.trim()%>">
      </td>
      <td><%=lxfs%>
        <input name="lxfs" type="hidden" value="<%=lxfs%>" >
      </td>
      <td><%=qtdh%>
        <input name="qtdh" type="hidden" value="<%=qtdh%>" >
      </td>
	  <td><%=cqbmstr%>
        <input name="cqbm" type="hidden" value="<%=cqbm%>" >
      </td>
	  <td><%=xqbm%>
        <input name="xqbm" type="hidden" value="<%=xqbm%>" >
      </td>
	  <td><%=louhao%>
        <input name="louhao" type="hidden" value="<%=louhao%>" >
      </td>
	  <td><%=fwdz%>
        <input name="fwdz" type="hidden" value="<%=fwdz%>" >
      </td>
      <td><%=fwmj%>
        <input name="fwmj" type="hidden" value="<%=fwmj%>" >
      </td>
      <td><%=xxlybmstr%>
        <input name="xxlybm" type="hidden" value="<%=xxlybm%>" >
      </td>
      <td><%=xxlysm%>
        <input name="xxlysm" type="hidden" value="<%=xxlysm%>" >
      </td>
 	  <td > <%=sfxhfstr%>
        <input name="sfxhf" type="hidden" value="<%=sfxhf%>" >
      </td>
	  <td > <%=hfrqstr%>
        <input name="hfrq" type="hidden" value="<%=hfrqstr.trim()%>" >
      </td>
	  <td > <%=jzbzstr%>
        <input name="jzbz" type="hidden" value="<%=jzbz%>" >
      </td>
      <td><%=khjl%>
        <input name="khjl" type="hidden" value="<%=khjl%>" >
      </td>
	  <td><%=clgw%>
        <input name="clgw" type="hidden" value="<%=clgw%>" >
      </td>
      <td><%=sjs%>
        <input name="sjs" type="hidden" value="<%=sjs%>" >
      </td>
	   <td > <%=ywy%>
        <input name="ywy" type="hidden" value="<%=ywy%>" >
      </td>
	  <td><%=dwmc%>
        <input name="zxdm" type="hidden" value="<%=zxdm%>" >
      </td>
	  <td><%=fgsmc%>
        <input name="fgsbh" type="hidden" value="<%=fgsbh%>" >
      </td> 
	  <td><%=yjzxsjstr%>
        <input name="yjzxsj" type="hidden" value="<%=yjzxsjstr%>" >
      </td> 

	  <td><%=jhctsjstr%>
        <input name="jhctsj" type="hidden" value="<%=jhctsjstr%>" >
      </td> 
	  <td><%=ctsjstr%>
        <input name="ctsj" type="hidden" value="<%=ctsjstr%>" >
      </td> 
	  <td><%=jhcxgtsjstr%>
        <input name="jhcxgtsj" type="hidden" value="<%=jhcxgtsjstr%>" >
      </td> 
	  <td><%=cxgtsjstr%>
        <input name="cxgtsj" type="hidden" value="<%=cxgtsjstr%>" >
      </td> 
	  <td><%=jhcsgtsjstr%>
        <input name="jhcsgtsj" type="hidden" value="<%=jhcsgtsjstr%>" >
      </td> 
	  <td><%=csgtsjstr%>
        <input name="csgtsj" type="hidden" value="<%=csgtsjstr%>" >
      </td> 
	  <td><%=jhzbjsjstr%>
        <input name="jhzbjsj" type="hidden" value="<%=jhzbjsjstr%>" >
      </td> 
	  <td><%=sczbjsjstr%>
        <input name="sczbjsj" type="hidden" value="<%=sczbjsjstr%>" >
      </td> 

	  <td><%=hth%>
        <input name="hth" type="hidden" value="<%=hth%>" >
      </td> 
      <td><%=sjf%>
        <input name="sjf" type="hidden" value="<%=sjf%>" >
      </td> 
	  <td><%=jsjfsjstr%>
        <input name="jsjfsj" type="hidden" value="<%=jsjfsjstr%>" >
      </td> 
	  <td><%=lfdj%>
        <input name="lfdj" type="hidden" value="<%=lfdj%>" >
      </td> 
	  <td><%=jlfdjsjstr%>
        <input name="jlfdjsj" type="hidden" value="<%=jlfdjsjstr%>" >
      </td> 


	  <td><%=khzyxz%>
        <input name="khzyxz" type="hidden" value="<%=khzyxz%>" >
      </td> 


	  <td><%=lrr%>
        <input name="lrr" type="hidden" value="<%=lrr%>" >
      </td> 
	  <td><%=lrsjstr%>
        <input name="lrsj" type="hidden" value="<%=lrsjstr%>" >
      </td> 
	  <td><%=zxdjbmstr%>
        <input name="zxdjbm" type="hidden" value="<%=zxdjbm%>" >
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
	return;
}
finally 
{
	try{
		f.close();
		if (f != null) f.close(); 
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
        <input type="button"  value="����" onClick="f_do(editform)">
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
	return true;
}
//-->
</SCRIPT>