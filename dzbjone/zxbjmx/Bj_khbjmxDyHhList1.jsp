<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<style>
@media print{
	INPUT {display:none}
}
</style>

</head>


<%
String khbh=request.getParameter("khbh");


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
String gycl=null;
String flmcgg=null;
String bjbz=null;
double xjqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;
double allzj=0;

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

Reader is=null;
BufferedReader br=null;


try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs,fwmj";
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
		fwmj=cf.fillNull(rs.getString("fwmj"));
	}
	rs.close();
	ps.close();

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


	dzbj.NewDzbj dzbj=new dzbj.NewDzbj();
	//����:  lx 9�����ȫ����1����鵥�ۣ�2��������ƣ�3����鹤�ղ��ϼ�飻4����鱨�ۼ���5������ѡ��Ŀ��6����鲻������Ŀ��7����������Ŀ
	String retStr=dzbj.checkBjjb(conn,khbh,9);
	if (!retStr.equals("0"))
	{
		%>
		<SCRIPT language=javascript >
		<!--
//			alert("���ӱ��ۼ�����\r\n<%=retStr%>");
		//-->
		</SCRIPT>
		<%
	}

%>
<body >

<TABLE border="0" cellspacing="0" cellpadding="0" width="100%" cellspacing="0 style='FONT-SIZE: 14px'">

<THEAD bgcolor="#FFFFFF" style="display:table-header-group;font-weight:bold">
<tr><td>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td align="left" colspan="8" ><img src="/images/tubiao.jpg" width="80%"></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" >�ͻ�������<%=khxm%></td>
    <td colspan="3" >���̸����ˣ�</td>
    <td >�� �� ʦ��<%=sjs%></td>
	<td >�Ƶ����ڣ�<%=cf.today()%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="8"  >�ͻ���ַ��<%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" >�ͻ��绰��<%=lxfs%></td>
	<td >���������<%=fwmj%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td  width="6%" align="center">���</td>
    <td  width="18%" align="center">��Ŀ����</td>
    <td  width="7%" align="center">��λ</td>
    <td  width="6%" align="center">����</td>
	<td  width="7%" align="center">����</td>
    <td  width="8%" align="center">��Ԫ��</td>
    <td  width="48%" align="center" >��������������˵��</td>
  </tr>
</table>

</td></tr>
</THEAD>

<TBODY>
<tr><td>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>

	
	
<%
	int i=0;
	ls_sql="SELECT bj_fjxx.jgwzbm";
	ls_sql+=" FROM bj_fjxx ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by bj_fjxx.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		xjsl=0;
		xjqye=0;
		
	
		//�������
		%> 
		  <tr bgcolor="#CCCCCC"> 
			<td colspan="7"> 
			  <div align="left"><%=jgwzmc%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				</div>			</td>
		  </tr>
		<%

		//���������Ŀ��ϸ
		ls_sql="SELECT bj_bjxmmx.xh xh,trim(bj_bjxmmx.xmbh)||DECODE(bjlx,'1','','2','��') xmbh,xmmc,jldwmc,bj_bjxmmx.dj,bj_gclmx.sl,bj_gclmx.sl*bj_bjxmmx.dj as je,gycl,bj_bjxmmx.flmcgg,bj_bjxmmx.bz";
		ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" order by bj_gclmx.fjnxh,bj_bjxmmx.xh";
	//	out.println(ls_sql);
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
			gycl=cf.fillHtml(rs.getString("gycl"));
			flmcgg=cf.fillHtml(rs.getString("flmcgg"));
			bjbz=cf.fillHtml(rs.getString("bz"));

			xjsl+=sl;
			xjqye+=qye;

			allsl+=sl;
			allqye+=qye;

			
			row++;
			//���ÿ������
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td width="6%" align="center"><%=row%></td>
			
				<td width="18%" align="center"><%=xmmc%></td>
				<td width="7%" align="center"><%=jldwmc%></td>
				<td width="6%" align="center"><%=cf.formatDouble(sl)%></td>
				<td width="7%" align="center"><%=dj%></td>
				<td width="8%" align="center"><%=cf.formatDouble(qye,"#########.##")%></td>
				<td width="48%" align="left" ><%=gycl%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();

		//���������Ŀ��ϸ
		String zcmc=null;
		String jldwbm=null;
		String ppmc=null;
		String xinghao=null;
		double zcdj=0;
		double zcsl=0;
		double zcje=0;
		double ycf=0;
		double qtfyje=0;
		ls_sql="SELECT zcmc,jldwbm,ppmc,xinghao,dj,sum(sl) sl,sum(je) je,sum(ycf) ycf,sum(qtfyje) qtfyje";
		ls_sql+=" FROM jc_zcddmx ";
//		ls_sql+=" where khbh='"+khbh+"' and zcpzwzbm='"+jgwzmc+"'";
		ls_sql+=" group by zcmc,jldwbm,ppmc,xinghao,dj";
		ls_sql+=" order by zcmc";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			zcmc=cf.fillHtml(rs.getString("zcmc"));
		    jldwbm=cf.fillHtml(rs.getString("jldwbm"));
		    ppmc=cf.fillHtml(rs.getString("ppmc"));
		    xinghao=cf.fillHtml(rs.getString("xinghao"));

			zcdj=rs.getDouble("dj");
			zcsl=rs.getDouble("sl");
			zcje=rs.getDouble("je");
			ycf=rs.getDouble("ycf");
			qtfyje=rs.getDouble("qtfyje");

			xjsl+=zcsl;
			xjqye+=zcje;

			allsl+=zcsl;
			allqye+=zcje;


			row++;
			//���ÿ������
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td width="6%" align="center"><%=row%></td>
			
				<td width="18%" align="center"><%=zcmc%></td>
				<td width="7%" align="center"><%=jldwbm%></td>
				<td width="6%" align="center"><%=cf.formatDouble(sl)%></td>
				<td width="7%" align="center"><%=dj%></td>
				<td width="8%" align="center"><%=cf.formatDouble(zcje,"#########.##")%></td>
				<td width="48%" align="left" ><%=ppmc%>,<%=xinghao%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();


		%> 
		
	 <tr bgcolor="#FFFFFF"> 
			<td colspan="7"> 
			 
			С�ƣ�<%=cf.formatDouble(xjqye,"#########.##")%>Ԫ		</td>
		  </tr> <%
	}
	
	rs1.close();
	ps1.close();
%> 
  		


  	 <tr bgcolor="#FFFFFF" align="center"  height="31"> 
    
	<td colspan="2">ֱ�ӹ��̿</td>
	<td colspan="2"><%=cf.formatDouble(allqye,"#########.##")%>Ԫ</td>
	
 
	<td align="right"  colspan="2" >����ѣ�</td>
	<td align="left"  >10%</td>
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
	ls_sql="SELECT sfxmbm,sfxmmc,DECODE(sflx,'1','����ֱ�ӷѰٷֱ�','2','�̶����(�ɸ�)','3','˰��','4','�̶����(���ɸ�)','5','�����','6','���ķѰٷֱ�','7','���̼����ķѰٷֱ�') sflx,sfbfb,sfje,bz,DECODE(sfbxx,'1','��ѡ','2','�Ǳ�ѡ') sfbxx,DECODE(sfjrqye,'1','����','2','������') sfjrqye,DECODE(jrsjbz,'1','����','2','������') jrsjbz,DECODE(jrglfbz,'1','����','2','������') jrglfbz,zqsfje,dxzkl,DECODE(sfkdz,'N','���ɴ���','Y','�ɴ���') sfkdz,zdzk";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
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

		allsfje+=zqsfje;
		temp++;

		%> 
	
		  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
	
			<td colspan="2"><%=sfxmmc%>��</td>
		
			<td colspan="2"><%=cf.formatDouble(zqsfje,"#########.##")%>Ԫ</td>
				
			<td align="left" colspan="2" >&nbsp;</td>
			<td align="left"  >&nbsp;</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	allzj=allsfje+allqye;

%> 
  
  <tr bgcolor="#FFFFFF"> 
    <td align="left" colspan="7">�� �ƣ�<%=cf.formatDouble(allzj,"#########.##")%>Ԫ</td>
  </tr>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
  <td colspan="7" height="42"></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
  <td colspan="7" height="42">1���˱��۲�����ҵ���������κη��ð���װ��Ѻ����ҵ���������κηѾ��ɼ׷��е���							
							
  <br>2����˾�Ų������κ��˵Ŀ�ͷ��ŵ��						
  <br>3�����й��̿�����������ͻ����뽻����˾���񲿣����ͻ�����������޹���Ա�����ֱ�Ӿ�����ʧ������ʧ��˾�Ų�����							
							
  <br>4��������˾����׷�ɳ��ǽӦ��������������׷�ִ�ⲻ����������ģ������ɼ׷���ȫ���𣬹�˾�����κ����Ρ�							
							
  <br>5��������˾����׷�������������ˮ��������׷�ִ�ⲻ����ˮ����ģ������ɼ׷���ȫ����������˾�����κ����Ρ�							
							
  <br>6��ʩ��������������Ŀ����ʵ��ʩ����Ŀ���㹤�̿���ڿͻ�ԭ����ɵļ����Ծ�������ȡ10%�ļ������ѡ�							
							
  <br>7��ˮ�繤�����޷�Ԥ�㣬���ֳ�ʵ��ʩ��������Ϊ׼���㡣							
  <br>8���ͻ�װ�޷��ݵ��κι��������ҷ�ʩ�����壩�����Ӱ���ҷ�ʩ���������ǲ�ж����������������취�������ɵĹ������ڣ�ҵ�����ге����á�							
							
  <br>9����Ԥ����ʩ��ͼ��δ��֮ǰ�����׷��ο�����Ϊ˫��ǩ��ʩ����ͬ�Ĳο����ݣ��ҷ���������ʩ��ͼֽ���ò��Ϻͼӹ�������ϵ���޶���Ŀ���۵�Ȩ����ʩ��ͼֽ���׷�ǩ�ֺ��Դ��޸ĵĹ���Ԥ�㱨��Ϊ˫��ǩ����ͬ�ĸ�������Ԥ�����ͬ����ͬ�ȵķ���Ч�ʡ�							
							
							
  <br>10����Ԥ�㲻�����֡����֡������������������ղ�������ߡ��ƾߡ�ǽ��ש��ʯ�ġ�ľ�ذ塢���ء��������տ���©�籣�����صȡ�							
							
  <br>11����װ������Ŀ�����ʵ������Ϊ׼��							
  <br>12����Ԥ�㼰��ע��Ϊ��ͬ�ĸ��������ͬ����ͬ�ȵķ���Ч����
  							
  <br><br><br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp�׷�ǩ�֣����£���&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp�ҷ�ǩ�֣����£���&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							
  <br><br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp��&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp��&nbsp&nbsp&nbsp&nbsp��&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp��&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp��&nbsp&nbsp&nbsp&nbsp��&nbsp&nbsp&nbsp&nbsp

</td>
					

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






