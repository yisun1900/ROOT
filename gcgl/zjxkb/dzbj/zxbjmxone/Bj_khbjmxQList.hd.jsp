<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>

<%
ybl.common.PageObject  pageObj=new ybl.common.PageObject();
//pageObj.setType("EXCEL",response);

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
String oldjgwzmc="";
String jldwmc=null;
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
double xjqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;
double xjxmje=0;
double allzcje=0;
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
String bjjbmc=null;
String dqbm="";
double zcbjje=0;
double hbqye=0;


try {
	conn=cf.getConnection();
	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc";
	ls_sql+=" FROM crm_khxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(je)";
	ls_sql+=" FROM bj_zcbjmxq";
	ls_sql+=" where  khbh='"+khbh+"' and zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcbjje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//��ʼ��
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//��ȡ���ӱ��۽��
	zjqye=dzbj.getZjxQAllBjje(conn,khbh,zjxxh,"yz")+zcbjje;
    hbqye=dzbj.getZjxQBjje(conn,khbh,zjxxh,"yz","3");

%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center"> </div>
<table width="100%" border="0" cellpadding="1" cellspacing="0" bordercolor="#CCCCCC"  bgcolor="#FFFFFF" style='FONT-SIZE: 12px'>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td colspan="3" rowspan="3" ><img src="/images/tubiao.jpg" ></td>
    <td colspan="3" rowspan="4">&nbsp;</td>
    <td rowspan="2">��˾(�ܲ�)��ַ�������л��ȳǺ��ƴ�����¥ </td>
  </tr>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> </tr>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td  width="49%">�绰��0755-26948699 &nbsp;&nbsp;&nbsp; 0755-26948389 </td>
  </tr>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td colspan="3" >http://www.szhaida.com</td>
    <td  width="49%">���棺0755-26948608 </td>
  </tr>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td colspan="7"  align="center"> <b><font size="5">��<%=bjjbmc%>��Ԥ����</font></b> 
    </td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="1" cellspacing="0" bordercolor="#CCCCCC"  bgcolor="#FFFFFF" style='FONT-SIZE: 14px'>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td colspan="3" > �ͻ�������<%=khxm%></td>
    <td colspan="3">�� �� ʦ��<%=sjs%></td>
    <td  width="49%">����ܼƣ�<%=cf.formatDouble(zjqye,"#########.##")%>Ԫ
	�����ģ�<%=cf.formatDouble(zcbjje,"#########.##")%>Ԫ
	��������<%=cf.formatDouble(hbqye,"#########.##")%>Ԫ</td>
  </tr>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td colspan="3" >��ϵ��ʽ��<%=lxfs%></td>
    <td colspan="4">���̵ص㣺<%=fwdz%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td  width="4%"  align="center">���</td>
    <td  width="8%" align="center">��Ŀ���</td>
    <td  width="18%" align="center">��Ŀ����</td>
    <td  align="center">����:Ԫ/��λ</td>
    <td  width="5%" align="center">����</td>
    <td  width="8%" align="center">��Ԫ��</td>
    <td  width="49%" align="center">��������������˵��</td>
  </tr>
  <%
	int i=0;
	ls_sql="SELECT bj_fjxxq.jgwzbm";
	ls_sql+=" FROM bj_fjxxq ";
    ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
	ls_sql+=" order by bj_fjxxq.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		xjsl=0;
		xjqye=0;
		
		//�������
		%> 
  <tr bordercolor="#FFFFFF" bgcolor="#FFFFFF"> 
    <td colspan="7"> 
      <div align="center"><b><i><font size="3">�ṹλ�ã�<%=jgwzmc%></font></i></b></div>
    </td>
  </tr>
  <%

		//�����Ŀ��ϸ
		ls_sql="SELECT bj_bjxmmxq.xh xh,trim(bj_bjxmmxq.xmbh)||DECODE(bjlx,'1','','2','��') xmbh,xmmc,jldwmc,bj_bjxmmxq.dj,bj_gclmxq.sl,bj_gclmxq.sl*bj_bjxmmxq.dj as je,gycl";
		ls_sql+=" FROM bj_bjxmmxq,jdm_jldwbm,bj_gclmxq,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxq.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxq.khbh='"+khbh+"' and bj_gclmxq.jgwzbm='"+jgwzmc+"' and bj_bjxmmxq.zjxxh='"+zjxxh+"' and bj_gclmxq.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_bjxmmxq.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2','3')";
		ls_sql+=" and bj_bjxmmxq.khbh=bj_gclmxq.khbh and bj_bjxmmxq.dqbm=bj_gclmxq.dqbm and bj_bjxmmxq.xmbh=bj_gclmxq.xmbh";
		ls_sql+=" order by bj_bjxmmxq.xmpx";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
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


			xjsl+=sl;
			xjqye+=qye;
			allsl+=sl;
			allqye+=qye;
			xjxmje+=qye;


			row++;
			//���ÿ������
			%> 
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td width="4%" align="center"><%=row%></td>
    <td width="8%" align="center"><%=xmbh%></td>
    <td width="18%" align="center"><%=xmmc%></td>
    <td align="center"><%=dj%>/<%=jldwmc%></td>
    <td width="5%" align="center"><%=cf.formatDouble(sl)%></td>
    <td width="8%" align="center"><%=cf.formatDouble(qye,"#########.##")%></td>
    <td width="49%" align="left"><%=gycl%></td>
  </tr>
  <%
		}
		ps.close();
		rs.close();

		//���С��
		%> 
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td colspan="7" align="right"><b><i><font size="3"><%=oldjgwzmc%>С�ƣ�<%=cf.formatDouble(xjqye,"#########.##")%>Ԫ&nbsp;</font></i></b></td>
  </tr>
  <%
	
	}
	rs1.close();
	ps1.close();
%> 
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td colspan="7" align="right"><i><b><font size="3">ֱ�ӷѺϼƣ�<%=cf.formatDouble(xjxmje,"#########.##")%>Ԫ</font></b></i></td>
  </tr>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
      <td colspan="7"> 
      <div align="center"><b><i><font size="3">�ۺ�ȡ��</font></i></b></div>
    </td>
  </tr>
  <%  
	double sfje=0;
	double allsfje=0;

	String sfxmmc=null;
	String bz=null;
	ls_sql="SELECT sfxmmc,sfje,bz";
	ls_sql+=" FROM bj_sfxmmxq  ";
    ls_sql+=" where bj_sfxmmxq.zjxxh='"+zjxxh+"' and bj_sfxmmxq.khbh='"+khbh+"'";
    ls_sql+=" order by bj_sfxmmxq.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		sfje=rs.getDouble("sfje");

		allsfje+=sfje;

		%> 
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td  width="4%" align="center">&nbsp;</td>
    <td  width="8%" align="center">&nbsp;</td>
    <td  width="18%" align="center"><%=sfxmmc%></td>
    <td align="center">&nbsp;</td>
    <td  width="5%" align="center">&nbsp;</td>
    <td  width="8%" align="center"><%=cf.formatDouble(sfje,"#########.##")%></td>
    <td  width="49%"><%=bz%></td>
  </tr>
  <%
	}
	rs.close();
	ps.close();
%> 
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td colspan="7" align="right"><i><b><font size="3">�ۺ�ȡ�Ѻϼƣ�<%=cf.formatDouble(allsfje,"#########.##")%>Ԫ</font></b></i></td>
  </tr>

<%
	if (zcbjje>0)
	{
		%>
		  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
			  <td colspan="7"> 
			  <div align="center"><b><i><font size="3">���ı���</font></i></b></div>
			</td>
		  </tr>
		  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF" align="center"> 
			<td  width="4%" >���</td>
			<td colspan="2"  width="26%" align="center">��������</td>
			<td align="center">����:Ԫ/��λ</td>
			<td  width="5%" align="center">����</td>
			<td  width="8%" align="center">���</td>
			<td  width="49%">��ע</td>
		  </tr>
		  <%  
			double zcje=0;

			String zcmc=null;
			String jldwbm=null;
			row=0;
			ls_sql="SELECT zcmc,jldwbm,dj,sl,je,bz";
			ls_sql+=" FROM bj_zcbjmxq  ";
			ls_sql+=" where bj_zcbjmxq.khbh='"+khbh+"' and bj_zcbjmxq.zjxxh='"+zjxxh+"'";
			ls_sql+=" order by bj_zcbjmxq.xh";
		//	out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				zcmc=cf.fillHtml(rs.getString("zcmc"));
				jldwbm=cf.fillHtml(rs.getString("jldwbm"));
				dj=rs.getDouble("dj");
				sl=rs.getDouble("sl");
				zcje=rs.getDouble("je");
				bz=cf.fillHtml(rs.getString("bz"));

				allzcje+=zcje;

				row++;

				%> 
		  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
			<td  width="4%" align="center"><%=row%></td>
			<td colspan="2"  width="26%" align="center"><%=zcmc%></td>
			<td align="center"><%=dj%>/<%=jldwbm%></td>
			<td  width="5%" align="center"><%=sl%></td>
			<td  width="8%" align="center"><%=cf.formatDouble(zcje,"#########.##")%></td>
			<td  width="49%"><%=bz%></td>
		  </tr>
		  <%
			}
			rs.close();
			ps.close();
		%> 
		  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
			<td colspan="7" align="right"><i><b><font size="3">���ı��ۺϼƣ�<%=cf.formatDouble(allzcje,"#########.##")%>Ԫ</font></b></i></td>
		  </tr>
		<%
	}

	allzj=allzcje+allsfje+xjxmje;
%>


  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
	<td colspan="7" align="right"><i><b><font size="3">�� �ƣ�<%=cf.formatDouble(allzj,"#########.##")%>Ԫ</font></b></i></td>
  </tr>


</table>
<table width="100%" border="0" cellpadding="1" cellspacing="0" bordercolor="#CCCCCC"  bgcolor="#FFFFFF" style='FONT-SIZE: 12px'>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td colspan="5" height="39">�׷�ǩ�֣�</td>
    <td colspan="2" height="39">�ҷ�ǩ�֣�</td>
  </tr>
</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("��������: " + e);
	return;
}
finally 
{
	try{
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