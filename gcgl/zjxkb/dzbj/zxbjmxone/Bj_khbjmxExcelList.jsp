<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>

<%
ybl.common.PageObject  pageObj=new ybl.common.PageObject();
pageObj.setType("EXCEL",response);

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


try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb";
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
	}
	rs.close();
	ps.close();

%>
<body >

<div align="center"> </div>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" ><span lang=EN-US><img src="tubiao.jpg" v:shapes="_x0000_i1025"></span></td>
    <td align="center" >&nbsp;</td>
    <td align="right" >http://www.yz-china.com</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="7" ><b><font size="5">Ԥ����</font></b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" >�ͻ�������<%=khxm%></td>
    <td colspan="3" >�� �� ʦ��<%=sjs%></td>
    <td >��ϵ��ʽ��<%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6">���̵ص㣺<%=fwdz%></td>
    <td align="left" >���̵ȼ���<%=bjjb%></td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"> 
    <td  width="4%" align="center">���</td>
    <td  width="8%" align="center">��Ŀ���</td>
    <td  width="18%" align="center">��Ŀ����</td>
    <td  width="9%" align="center">����:Ԫ/��λ</td>
    <td  width="6%" align="center">����</td>
    <td  width="8%" align="center">��Ԫ��</td>
    <td  width="47%" align="center">��������������˵��</td>
  </tr>
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
		
		ls_sql="SELECT sum(bj_gclmx.sl) sl,sum(bj_gclmx.sl*bj_bjxmmx.dj) as je";
		ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xjsl=rs.getDouble("sl");
			xjqye=rs.getDouble("je");
		}
		ps.close();
		rs.close();

		allsl+=xjsl;
		allqye+=xjqye;
		
		//�������
		%> 
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7"> 
      <div align="right"><b><i><font size="3">�ṹλ�ã�<%=jgwzmc%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        С�ƣ�<%=cf.formatDouble(xjqye,"#########.##")%>Ԫ</font></i></b></div>
    </td>
  </tr>
  <%

		//�����Ŀ��ϸ
		ls_sql="SELECT bj_bjxmmx.xh xh,trim(bj_bjxmmx.xmbh)||DECODE(bjlx,'1','','2','��') xmbh,xmmc,jldwmc,bj_bjxmmx.dj,bj_gclmx.sl,bj_gclmx.sl*bj_bjxmmx.dj as je,gycl";
		ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" order by bj_bjxmmx.xmpx,bj_bjxmmx.xh";
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

			row++;
			//���ÿ������
			%> 
  <tr bgcolor="#FFFFFF"> 
    <td align="center"><%=row%></td>
    <td align="center"><%=xmbh%></td>
    <td align="center"><%=xmmc%></td>
    <td align="center"><%=dj%>/<%=jldwmc%></td>
    <td align="center"><%=cf.formatDouble(sl)%></td>
    <td align="center"><%=cf.formatDouble(qye,"#########.##")%></td>
    <td align="left"><%=gycl%></td>
  </tr>
  <%
		}
		ps.close();
		rs.close();
	
	}
	rs1.close();
	ps1.close();
%> 
  <tr bgcolor="#FFFFFF"> 
    <td align="right" colspan="7"><i><b><font size="3">ֱ�ӷѺϼƣ�<%=cf.formatDouble(allqye,"#########.##")%>Ԫ</font></b></i></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" align="center"><b><i><font size="3">�ۺ�ȡ��</font></i></b></td>
  </tr>
  <%  
	double sfje=0;
	double allsfje=0;
	int temp=0;
	String sfxmmc=null;
	String bz=null;
	ls_sql="SELECT sfxmmc,sfje,bz";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		sfje=rs.getDouble("sfje");

		allsfje+=sfje;
		temp++;

		%> 
  <tr bgcolor="#FFFFFF" align="center" > 
    <td><%=temp%></td>
    <td colspan="2"><%=sfxmmc%></td>
    <td colspan="2">&nbsp;</td>
    <td><%=cf.formatDouble(sfje,"#########.##")%></td>
    <td align="left" ><%=bz%></td>
  </tr>
  <%
	}
	rs.close();
	ps.close();

	allzj=allsfje+allqye;

%> 
  <tr bgcolor="#FFFFFF"> 
    <td align="right" colspan="7"><i><b><font size="3">�ۺ�ȡ�Ѻϼƣ�<%=cf.formatDouble(allsfje,"#########.##")%>Ԫ</font></b></i></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" colspan="7"><i><b><font size="3">�� �ƣ�<%=cf.formatDouble(allzj,"#########.##")%>Ԫ</font></b></i></td>
  </tr>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">�׷�ǩ�֣�</td>
    <td colspan="2" height="42">�ҷ�ǩ�֣�</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" >��������г���ʵ��������������������������ʵ��ʩ�����Ϊ׼���㣬���ǽ��ǳ���л�������ǹ�����֧�֣�</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" >�ҾӲ�Ʒ���ֱ���˵����</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" > 
      <p>1���˵��ӱ�������Ϊ��Ʒ��׼�ߴ��ͳһ���ۣ��������ͻ�Ǳ��Ʒ�۸����мƼ۱�׼��</p>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" > 
      <p>2�������в�������������ȵļ۸�������в�����װ�ΰ塢��ܰ塢��ˮ������������ˮ�衢��������ͷ���Ҽ��ȣ��Ҿ߲��������������֡��¾��ȣ�ľ�Ų��������������ֵȡ�</p>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" >3����ϸ���ۼ�����۱��</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" >4����ҵ����ѣ����κ���Ŀ���κ���ʽ�ɼ׷�������</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" >5����ҵѺ�����κ���ʽ����Ŀ���ɼ׷������ɡ�</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" >6��ˮ����ɼ׷������ҷ�ʩ�������õ�ˮ������ɼ׷�֧����</td>
  </tr>
</table>
<br>
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






