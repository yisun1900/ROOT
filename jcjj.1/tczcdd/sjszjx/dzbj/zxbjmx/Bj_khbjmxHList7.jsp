<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
<!--<style>
@media print{
	INPUT {display:none}
}
</style>
-->
</head>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String xh=null;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String jldwmc=null;
double dj=0;
double sl=0;
double qye=0;

double zcf=0;
double cldj=0;
double shf=0;
double ysf=0;
double jxdj=0;
double qtf=0;
double rgdj=0;
double bj=0;

String  xuhao=null;
String gycl=null;
String flmcgg=null;
String bjbz=null;
double xjqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;
double allzj=0;

double allzcf=0;
double allfcf=0;
double allrgf=0;
double allshf=0;
double allysf=0;
double alljxf=0;
double allqtf=0;

String khxm=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String ssfgs=null;
String dzbjbz=null;
String fwmj=null;
String  zxdm=null;
Reader is=null;
BufferedReader br=null;


try {
	conn=cf.getConnection();

	
    String ysshbz="";
	String bjdysq="";
	int bjdycs=0;
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs,ysshbz,bjdysq,bjdycs,zxdm";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		zxdm=cf.fillNull(rs.getString("zxdm"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));//�Ƿ�����Ԥ�����  B��������ˣ�C���������룻Y�����ͨ����M�����δͨ����S���޸ķ�����Ȩ
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//���۴�ӡ��Ȩ  0��δ��Ȩ��1���ɵ�����2���ɴ�ӡ
		bjdycs=rs.getInt("bjdycs");//���۴�ӡ����
	}
	rs.close();
	ps.close();
	
	
	String sjsdh="";
	//���ʦ�绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_sqbm";
	ls_sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' and sq_yhxx.zwbm in('23','04') and yhmc ='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	
	//���[Ԥ�����]���Ƿ�������ӡ��������������������������������ʼ
	String sfqyyssh="";
	String getbjdysq="";
	ls_sql="SELECT sfqyyssh,bjdysq";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfqyyssh=cf.fillNull(rs.getString("sfqyyssh"));//�Ƿ�����Ԥ�����  Y�����ã�N��������
		getbjdysq=cf.fillNull(rs.getString("bjdysq"));//���۴�ӡ�Ƿ�����Ȩ  1��������Ȩ��2��ֻ��һ����Ȩ��3��ÿ�δ�ӡ������Ȩ
	}
	rs.close();
	ps.close();

	if (sfqyyssh.equals("Y"))//�Ƿ�����Ԥ�����  Y�����ã�N��������
	{
		if (!ysshbz.equals("Y"))//B��������ˣ�C���������룻Y�����ͨ����M�����δͨ����S���޸ķ�����Ȩ
		{
			out.println("����[Ԥ�����]δͨ�������ܴ�ӡ����");
			return;
		}
	}
	//���[Ԥ�����]���Ƿ�������ӡ��������������������������������ʼ
/*
	//���[��ӡ��Ȩ]���Ƿ�ɴ�ӡ���ۣ���������������������������ʼ
	String sfkdybj="";
	ls_sql="select sfkdybj";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfkdybj=cf.fillNull(rs.getString("sfkdybj"));//�Ƿ�ɴ�ӡ����  Y������Ȩ��ӡ��N��������Ȩ��ӡ��M�����ܴ�ӡ
	}
	rs.close();
	ps.close();

	if (sfkdybj.equals("M"))//M�����ܴ�ӡ
	{
		out.println("��������Ȩ��ӡ����");
		return;
	}
	else if (sfkdybj.equals("Y"))//Y������Ȩ��ӡ
	{
		if (getbjdysq.equals("2"))//2��ֻ��һ����Ȩ
		{
			if ( !bjdysq.equals("1") && !bjdysq.equals("2"))//0��δ��Ȩ��1���ɵ�����2���ɴ�ӡ
			{
				out.println("����������Ȩ���ܴ�ӡ���ۣ�Ŀǰδ��Ȩ");
				return;
			}
		}
		else if (getbjdysq.equals("3"))//3��ÿ�δ�ӡ������Ȩ
		{
			if ( !bjdysq.equals("1") && !bjdysq.equals("2"))//0��δ��Ȩ��1���ɵ�����2���ɴ�ӡ
			{
				out.println("����������Ȩ���ܴ�ӡ���ۣ�Ŀǰδ��Ȩ");
				return;
			}
			else{
				if (bjdycs>=2)
				{
					out.println("����ÿ����Ȩֻ�ܴ�ӡ���Σ�Ŀǰ�ѳ������ƣ�"+bjdycs+"����������Ȩ");
					return;
				}
			}
		}
		else{
			out.println("��������Ȩ���ܴ�ӡ���ۣ��ڡ����ӱ��۲�����ά�� ��ģ�飬���������۴�ӡ�Ƿ�����Ȩ�����ò���ȷ");
			return;
		}
	}*/
	//���[��ӡ��Ȩ]���Ƿ�������ӡ����������������������������������

	dzbj.Dzbj dzbj=new dzbj.Dzbj();

	//��飺��ͬ��ֵ��������������������������������ʼ
	double gethdzsjz=0;
	ls_sql="SELECT sum(zsjz)";
	ls_sql+=" FROM crm_khzsxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gethdzsjz=rs.getDouble(1);//����;�ֵ
	}
	rs.close();
	ps.close();

	double getqye=dzbj.getZhBjje(conn,khbh,"sxyd");//��ȡ���ۺ󡻵��ӱ��۽�ֱ�ӷѣ������շѣ���������������ҵ������Ŀ
	double getguanlif=dzbj.getZhGlfJe(conn,khbh,"yz");//��ȡ�ۺ󡺹����ѽ�

	double gethtjz=dzbj.getHtjz(conn,khbh,"yz");//��ͬ��ֵ�����̷ѣ�����ҵ�������ѣ��������м���������;�ֵ�����ʹ���ȯ

	if (gethtjz<0)
	{
		out.println("���󣡺�ͬ��ֵΪ��ֵ��"+gethtjz);
		return;
	}
	//��飺��ͬ��ֵ����������������������������������


	//��飺����ۿۣ�������������������������������ʼ
	String kzdzfs="";
	double zdmll=0;
	double zkl=0;
	ls_sql="SELECT kzdzfs,zkl,zdmll";
	ls_sql+=" FROM sq_yhxx";
    ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kzdzfs=rs.getString("kzdzfs");
		zkl=rs.getDouble("zkl");//����ۿ�
		zdmll=rs.getDouble("zdmll");//ǩ�����ë����
	}
	rs.close();
	ps.close();

	if (kzdzfs.equals("1"))//1������ë���ʣ�2�������ۿ�
	{
		double getsgcbj=dzbj.getCbj(conn,khbh,"yz");//ʩ���ɱ���
		//ë���ʣ�����ͬ��ֵ���ɱ��ۣ��º�ͬ��ֵ
		double getmll=cf.round((gethtjz-getsgcbj)*100/gethtjz,2);

		//�Ƿ��гɹ��ĵ����ۿۼ�¼
		int tzkcount=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_tzzkjl";
		ls_sql+=" where khbh='"+khbh+"' and clzt in('2','4')";//1��δ���ۿۣ�2��ֱ���޸��ۿ۳ɹ���3����������4������ͨ���Ѹ��ۿۣ�5������δͨ��
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tzkcount=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (tzkcount==0)//�޵����ۿۼ�¼��������ʦ���ë���ʣ��Ƿ����Ҫ��
		{
			if (getmll<zdmll || getmll>100)
			{
				out.println("����ë���ʳ�������Ȩ��");
				return;
			}
		}
	}
	//��飺����ۿۣ���������������������������������



	oracle.sql.CLOB  clob=null;

	ls_sql="select dzbjbz";
	ls_sql+=" from  bj_dzbjbz";
	ls_sql+=" where  (dwbh='"+ssfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clob=(oracle.sql.CLOB)rs.getClob("dzbjbz");
	}
	rs.close();
	ps.close();

	dzbjbz="";

	if(clob!=null){
		is=clob.getCharacterStream();
		br=new BufferedReader(is);
		String s=br.readLine();
		while(s!=null)
		{
			dzbjbz+=s+",";
			s=br.readLine();
		}

		br.close();
		is.close();
	}

	if (dzbjbz==null)
	{
		dzbjbz="";
	}
	if (dzbjbz.length()>1)
	{
		dzbjbz=dzbjbz.substring(0,dzbjbz.length()-1);
	}
	else{
		dzbjbz="";
	}


%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>

<TABLE border="0" cellspacing="0" cellpadding="0" width="100%" cellspacing="0 style='FONT-SIZE: 14px'">

<THEAD bgcolor="#FFFFFF" style="display:table-header-group;font-weight:bold">
<tr><td>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

 <tr bgcolor="#FFFFFF"> 
 <td colspan="4" align="right" style='FONT-SIZE: 24px' ><B>�����˼�װ�ι�˾</B> &nbsp;</td>
 <td colspan="4" align="left" style='FONT-SIZE: 20px' > &nbsp;<B>���������ϸ</B></td>
 
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="8"    height="10"></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" >�ͻ�������<%=khxm%></td>
    <td colspan="2" >�ͻ��绰��<%=lxfs%></td>
	<td colspan="2" >���ʦ�绰��<%=sjsdh%></td>
    <td colspan="2" >���̵�ַ��<%=fwdz%></td>
</tr>
   <tr bgcolor="#FFFFFF"> 
    <td colspan="8"    height="10"></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td  width="3%" align="center">���</td>
    <td  width="10%" align="center">��Ŀ����</td>
    <td  width="5%" align="center">��λ</td>
    <td  width="4%" align="center">����</td>
	
	<td  width="5%" align="center">����</td>
	<td  width="5%" align="center">����</td>
	<td  width="5%" align="center">�˹�</td>
	<td  width="5%" align="center">���</td>
	
	<td  width="5%" align="center">����</td>
	<td  width="5%" align="center">��е</td>
	<td  width="5%" align="center">����</td>
	<td  width="5%" align="center">�ϼ�</td>
  
    <td  width="28%" align="center" >��������������˵��</td>
  </tr>
</table>

</td></tr>
</THEAD>

<TBODY>
<tr><td>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>

	
	
<%
	int i=0;

	ls_sql="SELECT bj_fjxxh.jgwzbm,DECODE(xuhao,'1','һ','2','��','3','��','4','��','5','��','6','��','7','��','8','��','9','��','10','ʮ','11','ʮһ','12','ʮ��') xuhao";
	ls_sql+=" FROM bj_fjxxh ";
    ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
	ls_sql+=" order by bj_fjxxh.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");
        xuhao=rs1.getString("xuhao");
	
		xjsl=0;
		xjqye=0;
		
		ls_sql="SELECT sum(bj_gclmxh.sl) sl,sum(bj_gclmxh.sl*bj_bjxmmxh.dj) as je";
		ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_bjxmmxh.khbh='"+khbh+"' and bj_gclmxh.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xjsl=rs.getDouble("sl");
			xjqye=rs.getDouble("je");
		}
		rs.close();
		ps.close();

		allsl+=xjsl;
		allqye+=xjqye;
		
		//�������
		%> 
		  <tr bgcolor="#CCCCCC"> 
		  <td colspan="1"> 
			  <div align="center"><%=xuhao%></div>			</td>
			<td colspan="12"> 
			  <div align="left"><%=jgwzmc%>:<%=xjqye%></div>			</td>
			  
		  </tr>
		  
		<%

		//�����Ŀ��ϸ
		ls_sql="SELECT bj_bjxmmxh.xh xh,trim(bj_bjxmmxh.xmbh)||DECODE(bjlx,'1','','2','��') xmbh,xmmc,jldwmc,bj_bjxmmxh.dj,bj_gclmxh.sl,bj_gclmxh.sl*bj_bjxmmxh.dj as je,gycl,bj_bjxmmxh.flmcgg,bj_bjxmmxh.bz,bj_bjxmmxh.zcf,bj_bjxmmxh.cldj,bj_bjxmmxh.shf,bj_bjxmmxh.qtf,bj_bjxmmxh.ysf,bj_bjxmmxh.rgdj,bj_bjxmmxh.jxdj";
		ls_sql+=" FROM bj_bjxmmxh,jdm_jldwbm,bj_gclmxh,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_bjxmmxh.khbh='"+khbh+"' and bj_gclmxh.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
		ls_sql+=" order by bj_gclmxh.fjnxh,bj_bjxmmxh.xh";
		//out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		
	
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
		    xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			
			zcf=rs.getDouble("zcf");
			cldj=rs.getDouble("cldj");
			shf=rs.getDouble("shf");
			qtf=rs.getDouble("qtf");
			rgdj=rs.getDouble("rgdj");
			ysf=rs.getDouble("ysf");
			jxdj=rs.getDouble("jxdj");
			//bj=rs.getDouble("bj");
			
			gycl=cf.fillHtml(rs.getString("gycl"));
			flmcgg=cf.fillHtml(rs.getString("flmcgg"));
			bjbz=cf.fillHtml(rs.getString("bz"));

			allzcf+=zcf*sl;
			allfcf+=cldj*sl;
			allrgf+=rgdj*sl;
			allshf+=shf*sl;
			allysf+=ysf*sl;
			alljxf+=jxdj*sl;
		    allqtf+=qtf*sl;
    

			row++;
			//���ÿ������
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td width="3%" align="center"><%=row%></td>
			
				<td width="10%" align="center"><%=xmmc%></td>
				<td width="5%" align="center"><%=jldwmc%></td>
				<td width="4%" align="center"><%=cf.formatDouble(sl)%></td>
				
				<td width="5%" align="center"> <%=zcf%>&nbsp;</td>
				<td width="5%" align="center"><%=cldj%> &nbsp;</td>
				<td width="5%" align="center"><%=rgdj%> &nbsp;</td>
				<td width="5%" align="center"> <%=shf%> &nbsp;</td>
				
				<td width="5%" align="center"> <%=ysf%> &nbsp;</td>
				<td width="5%" align="center"> <%=jxdj%> &nbsp;</td>
				<td width="5%" align="center"> <%=qtf%> &nbsp;</td>
				<td width="5%" align="center"> <%=cf.formatDouble(qye,"#########.##")%> &nbsp;</td>
				<td width="28%" align="left" ><%=gycl%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();
		
	}
	
	rs1.close();
	ps1.close();
	
	    
%> 
  		
 <tr bgcolor="#FFFFFF" align="center"  height="25"> 
    
	<td colspan="2">С�ƣ�</td>
	<td colspan="2">&nbsp;</td>
	<td >&nbsp;<%=cf.formatDouble(allzcf,"#########.##")%></td>
	<td >&nbsp;<%=cf.formatDouble(allfcf,"#########.##")%></td>
	<td >&nbsp;<%=cf.formatDouble(allrgf,"#########.##")%></td>
    <td >&nbsp;<%=cf.formatDouble(allshf,"#########.##")%></td>
	<td >&nbsp;<%=cf.formatDouble(allysf,"#########.##")%></td>
	<td >&nbsp;<%=cf.formatDouble(alljxf,"#########.##")%></td>
	<td >&nbsp;<%=cf.formatDouble(allqtf,"#########.##")%></td>
	<td >&nbsp;<%=cf.formatDouble(allzcf+allfcf+allrgf+allshf+allysf+alljxf+allqtf,"#########.##")%></td>
	<td >&nbsp; </td>
  </tr>

  <tr bgcolor="#FFFFFF" align="center"  height="25"> 
    
	<td colspan="2">������ۣ�</td>
	<td colspan="2">&nbsp;</td>
	
 
	<td align="right"  colspan="8" >&nbsp; </td>
	<td >&nbsp; <%=cf.formatDouble(allqye,"#########.##")%>Ԫ</td>
  </tr>
  <%  
	double allsfje1=0;
	int temp1=0;

	String sfxmbm1=null;
	String sfxmmc1=null;
	String sflx1=null;
	double sfbfb1=0;
	double sfje1=0;
	double zqsfje1=0;
	ls_sql="SELECT sfxmbm,sfxmmc,DECODE(sflx,'1','����ֱ�ӷѰٷֱ�','2','�̶����(�ɸ�)','3','˰���ۺ󰴻������㣩','8','˰���ۺ��ۿۼ��㣩','4','�̶����(���ɸ�)','5','������','6','��˾�����İٷֱ�','7','�Թ����İٷֱ�','9','���ٷֱ�����Ʒ�') sflx,sfbfb,sfje,bz,DECODE(sfbxx,'1','��ѡ','2','�Ǳ�ѡ') sfbxx,DECODE(sfjrqye,'1','����','2','������') sfjrqye,DECODE(jrsjbz,'1','����','2','������') jrsjbz,DECODE(jrglfbz,'1','����','2','������') jrglfbz,zqsfje,dxzkl,DECODE(sfkdz,'N','���ɴ���','Y','�ɴ���') sfkdz,zdzk";
	ls_sql+=" FROM bj_sfxmmxh  ";
    ls_sql+=" where zjxxh='"+zjxxh+"' and bj_sfxmmxh.khbh='"+khbh+"' and  sfxmlx='5'";//5�����̹�����
    ls_sql+=" order by bj_sfxmmxh.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmbm1=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc1=cf.fillHtml(rs.getString("sfxmmc"));
		sflx1=cf.fillHtml(rs.getString("sflx"));
		sfbfb1=rs.getDouble("sfbfb");
		sfje1=rs.getDouble("sfje");
		zqsfje1=rs.getDouble("zqsfje");
		allsfje1+=sfje1;
		temp1++;

		%> 
	
  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
    
	<td colspan="2"><%=sfxmmc1%>��</td>
	<td colspan="2"><%=cf.formatDouble(sfje1,"#########.##")%>Ԫ</td>
	
 		<%
	}
	rs.close();
	ps.close();
	
	%>
	<td align="right"  colspan="8" >&nbsp; </td>
	<td align="left"  >&nbsp; </td>
  </tr>

	

    <tr bgcolor="#CCCCCC"> 
			<td colspan="13"> 
			  <div align="left">����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				</div>			</td>
			  
		  </tr>
  <%  
	double allsfje=0;
	int temp=0;

	String sfxmbm=null;
	String sfxmmc=null;
	String sflx=null;
	double sfbfb=0;
	double sfje=0;
	String bz=null;
	String sfbxx=null;
	String sfjrqye=null;
	String jrsjbz=null;
	String jrglfbz=null;
	double zqsfje=0;
	double dxzkl=0;
	String sfkdz=null;
	double zdzk=0;
	ls_sql="SELECT sfxmbm,sfxmmc,DECODE(sflx,'1','����ֱ�ӷѰٷֱ�','2','�̶����(�ɸ�)','3','˰���ۺ󰴻������㣩','8','˰���ۺ��ۿۼ��㣩','4','�̶����(���ɸ�)','5','������','6','��˾�����İٷֱ�','7','�Թ����İٷֱ�','9','���ٷֱ�����Ʒ�') sflx,sfbfb,sfje,bz,DECODE(sfbxx,'1','��ѡ','2','�Ǳ�ѡ') sfbxx,DECODE(sfjrqye,'1','����','2','������') sfjrqye,DECODE(jrsjbz,'1','����','2','������') jrsjbz,DECODE(jrglfbz,'1','����','2','������') jrglfbz,zqsfje,dxzkl,DECODE(sfkdz,'N','���ɴ���','Y','�ɴ���') sfkdz,zdzk";
	ls_sql+=" FROM bj_sfxmmxh  ";
    ls_sql+=" where zjxxh='"+zjxxh+"' and bj_sfxmmxh.khbh='"+khbh+"' and  sfxmlx not in('6','5')";
    ls_sql+=" order by bj_sfxmmxh.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		sflx=cf.fillHtml(rs.getString("sflx"));
		sfbfb=rs.getDouble("sfbfb");
		sfje=rs.getDouble("sfje");
		bz=cf.fillHtml(rs.getString("bz"));
		sfbxx=cf.fillHtml(rs.getString("sfbxx"));
		sfjrqye=cf.fillHtml(rs.getString("sfjrqye"));
		jrsjbz=cf.fillHtml(rs.getString("jrsjbz"));
		jrglfbz=cf.fillHtml(rs.getString("jrglfbz"));
		zqsfje=rs.getDouble("zqsfje");
		dxzkl=rs.getDouble("dxzkl");
		sfkdz=cf.fillHtml(rs.getString("sfkdz"));
		zdzk=rs.getDouble("zdzk");

		allsfje+=sfje;
		temp++;



	
		%> 
	
		  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
	
			<td colspan="2"><%=sfxmmc%></td>
		
			<td >��</td>
			<td >1</td>
			<td colspan="2"><%=cf.formatDouble(sfje,"#########.##")%>Ԫ</td>	
			<td align="left" colspan="6" >&nbsp;</td>
			<td align="left"  >&nbsp;<%=bz%></td>
		  </tr>
		  
		  
		<%
	}
	rs.close();
	ps.close();
	%>
	<tr bgcolor="#FFFFFF" align="center"  height="25"> 
    
	<td colspan="2">С�ƣ�</td>
	<td colspan="2">&nbsp;</td>
	<td colspan="5">&nbsp;</td>
 
	<td   colspan="3" >&nbsp;<%=cf.formatDouble(allsfje,"#########.##")%>Ԫ </td>
	<td align="left"  >&nbsp; </td>
  </tr>
	
          <%  
	double allsfje2=0;
	int temp2=0;

	String sfxmbm2=null;
	String sfxmmc2=null;
	String sflx2=null;
	double sfbfb2=0;
	double sfje2=0;
	String bz2=null;
	double zqsfje2=0;
	int count=0;
    ls_sql="select count(*)";
	ls_sql+=" from  bj_sfxmmxh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and sfxmlx='6' ";//6������˰��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)//��˰��
	{
		ls_sql="SELECT sfxmbm,sfxmmc,DECODE(sflx,'1','����ֱ�ӷѰٷֱ�','2','�̶����(�ɸ�)','3','˰���ۺ󰴻������㣩','8','˰���ۺ��ۿۼ��㣩','4','�̶����(���ɸ�)','5','������','6','��˾�����İٷֱ�','7','�Թ����İٷֱ�','9','���ٷֱ�����Ʒ�') sflx,sfbfb,sfje,bz,DECODE(sfbxx,'1','��ѡ','2','�Ǳ�ѡ') sfbxx,DECODE(sfjrqye,'1','����','2','������') sfjrqye,DECODE(jrsjbz,'1','����','2','������') jrsjbz,DECODE(jrglfbz,'1','����','2','������') jrglfbz,zqsfje,dxzkl,DECODE(sfkdz,'N','���ɴ���','Y','�ɴ���') sfkdz,zdzk";
		ls_sql+=" FROM bj_sfxmmxh  ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and bj_sfxmmxh.khbh='"+khbh+"' and sfxmlx='6'";
		ls_sql+=" order by bj_sfxmmxh.sfxmbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			sfxmbm2=cf.fillHtml(rs.getString("sfxmbm"));
			sfxmmc2=cf.fillHtml(rs.getString("sfxmmc"));
			sflx2=cf.fillHtml(rs.getString("sflx"));
			sfbfb2=rs.getDouble("sfbfb");
			sfje2=rs.getDouble("sfje");
			bz2=cf.fillHtml(rs.getString("bz"));
			zqsfje2=rs.getDouble("zqsfje");
		 
		 
			allsfje2+=sfje2;
			temp1++;
		
			%> 
			  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
				
				<td colspan="2">˰��</td>
				<td >��</td>
				<td >1</td>
				<td  colspan="2" >&nbsp; <%=cf.formatDouble(sfje2,"#########.##")%>Ԫ</td>
				<td align="left" colspan="6" >&nbsp;</td>
				<td align="left"  >&nbsp;<%=bz2%> </td>
			  </tr> 
			<%
		}

		rs.close();
		ps.close();
	}
	else//��˰����ʾ����
	{ 
		%> 
		<tr bgcolor="#FFFFFF" align="center"  height="31"> 
		<td colspan="2">˰��</td>
		<td >��</td>
		<td >1</td>
		<td  colspan="2" >&nbsp; 0</td>
		<td align="left" colspan="6" >&nbsp;</td>
		<td align="left"  >&nbsp; </td>
		</tr>
	   <% 
	}

	//allqye:���̷�
	//allsfje:������
	//allsfje1:������
	//allsfje2:˰��
  
	
	allzj=allqye+allsfje+allsfje1+allsfje2;
   	
	
	
%> 
  
  <tr bgcolor="#FFFFFF"> 
    <td align="left" colspan="14">�����ܼۣ�<%=cf.formatDouble(allzj,"#########.##")%>Ԫ</td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
  <td align="cenetr" width="2%" >ע������</td>
  <td colspan="6"  ><%=dzbjbz%></td>
  </tr>
</table>

</td></tr>
</TBODY>

</table>


</body>
</html>

<%
}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		br.close();
		is.close();

		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>





<script  LANGUAGE="javascript">
<!--
function KeyDown()
{ 

	if ((event.ctrlKey))
	{ //���� Ctrl+n
		event.returnValue=false;
		alert('��ֹ����') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //���� Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //���� shift+F10
		event.returnValue=false;
	}
}

//-->
</script>



