<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�깤���˵�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
String khbh=request.getParameter("khbh");

///////////////��������
String sgd=null;
String sgdmc=null;
String khlx=null;
String cxhdbm=null;
double zkl=0;
double wdzgce=0;
double qye=0;
double zjxje=0;
double zhzjxje=0;
double zqwgzj=0;
double zhwgzj=0;
double khsskze=0;
double glftd=0;
double glf=0;
double gdjskze=0;

///////////////���ۿ���Ŀ
double clf=0;
double bzclfbl=0;
double xbclk=0;
double psgjgff=0;
double ysf=0;
double wxjbfb=0;
double wxj=0;
double gcjxkk=0;
double sj=0;
double lbcb=0;
double kqtk=0;

///////////////������
double jkje=0;
double sqgz=0;
double gczxjl=0;
double ycfbk=0;

String jslx=null;
String jsr=null;
String jsdw=null;
String jssj=null;
String bz=null;


String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String hth=null;
String qyrq=null;
String kgrq=null;
String sjkgrq=null;
String jgrq=null;
String sjjgrq=null;
String sjwjrq=null;
String dwbh=null;
String fgsmc=null;
String zjxm=null;
String jzbz=null;
String zjxwcbz=null;
String fgsbh=null;
String gdjsjlh=null;

double wgzj=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	ls_sql="select gdjsjlh,sgd,khlx,cxhdbm,zkl,wdzgce,qye,zjxje,zhzjxje ";
	ls_sql+=" ,zqwgzj,zhwgzj,khsskze,glftd,glf,gdjskze,clf,bzclfbl,xbclk,psgjgff ";
	ls_sql+=" ,ysf,wxjbfb,wxj,gcjxkk,sj,lbcb,kqtk,jkje,sqgz,gczxjl ";
	ls_sql+=" ,ycfbk,jslx,jsdw,jsr,jssj,bz,jsjd,fkbz ";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where khbh='"+khbh+"' and jslx='1'";//1���깤���㣻2�����ڽ���
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gdjsjlh=cf.fillNull(rs.getString("gdjsjlh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		khlx=cf.fillNull(rs.getString("khlx"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		zkl=rs.getDouble("zkl");
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");

		zqwgzj=rs.getDouble("zqwgzj");
		zhwgzj=rs.getDouble("zhwgzj");
		khsskze=rs.getDouble("khsskze");
		glftd=rs.getDouble("glftd");
		glf=rs.getDouble("glf");
		gdjskze=rs.getDouble("gdjskze");
		clf=rs.getDouble("clf");
		bzclfbl=rs.getDouble("bzclfbl");
		xbclk=rs.getDouble("xbclk");
		psgjgff=rs.getDouble("psgjgff");

		ysf=rs.getDouble("ysf");
		wxjbfb=rs.getDouble("wxjbfb");
		wxj=rs.getDouble("wxj");
		gcjxkk=rs.getDouble("gcjxkk");
		sj=rs.getDouble("sj");
		lbcb=rs.getDouble("lbcb");
		kqtk=rs.getDouble("kqtk");
		jkje=rs.getDouble("jkje");
		sqgz=rs.getDouble("sqgz");
		gczxjl=rs.getDouble("gczxjl");

		ycfbk=rs.getDouble("ycfbk");
		jslx=cf.fillNull(rs.getString("jslx"));
		jsdw=cf.fillNull(rs.getString("jsdw"));
		jsr=cf.fillNull(rs.getString("jsr"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	ls_sql="select qye,zjxje,zhzjxje,fgsbh,jzbz,khxm,fwdz,lxfs,sjs,hth,qyrq,crm_khxx.dwbh,dwmc,crm_khxx.sgd,sgdmc,zjxm,kgrq,sjkgrq,jgrq,sjjgrq,sjwjrq";
	ls_sql+=" from  crm_khxx,sq_sgd,sq_dwxx";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.fgsbh=sq_dwxx.dwbh and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		fgsmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

		qye=rs.getDouble("qye");
		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");
	
	}
	rs.close();
	ps.close();

	wgzj=cf.doubleTrim(qye+zhzjxje);


	ls_sql="update crm_khxx set wgdybz='Y',wgdysj=SYSDATE ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

%>
<body bgcolor="#FFFFFF">
<table width="100%" border="1" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
  <tr> 
    <td colspan="6" align="center" height="28"><b>�� �� װ �� �� ��</b></td>
  </tr>
  <tr> 
    <td colspan="6" align="center" height="30"><b><%=fgsmc%>�깤���˵�</b></td>
  </tr>
  <tr> 
    <td colspan="2">����������<%=sgdmc%></td>
    <td colspan="2">��ͬ�ţ�<%=hth%></td>
    <td colspan="2" width="34%">�ͻ�����<%=khxm%>(<%=khbh%>)</td>
  </tr>
  <tr> 
    <td colspan="2">�깤��ۣ�<%=wgzj%></td>
    <td colspan="2">����ѱ�����<%=glftd%>%</td>
    <td colspan="2" width="34%">�ۿۻ��ɱ����ʣ�<%=zkl%></td>
  </tr>
  <tr> 
    <td colspan="2">�ͻ��μӻ��<%=cxhdbm%></td>
    <td colspan="2">���ʵ���ֹ�գ�<%=jssj%></td>
    <td colspan="2" width="34%">���˵���ӡ�գ�<%=cf.today()%></td>
  </tr>
  <tr> 
    <td colspan="6"><b>Ӧ�����ѣ�<%=gdjskze%>Ԫ�����У�</b></td>
  </tr>
</table>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="0" cellspacing="0">
  <tr>
    <td width="66%">
		
      <table width="100%" border="1" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
        <tr> 
          <td colspan="4" align="center"><b>�� �� �� �� Ŀ</b></td>
        </tr>
        <tr> 
          <td width="18%"> 
            <div align="center">��Ŀ����</div>          </td>
          <td width="15%"> 
            <div align="center">�ۿ��Ԫ��</div>          </td>
          <td width="17%"> 
            <div align="center">��Ŀ����</div>          </td>
          <td width="16%"> 
            <div align="center">�ۿ��Ԫ��</div>          </td>
        </tr>
        <tr> 
          <td width="18%" align="center">���Ϸѣ�</td>
          <td width="15%"><%=clf%></td>
          <td width="17%" align="center">���Ͽۿ</td>
          <td width="16%"><%=xbclk%></td>
        </tr>
        <tr> 
          <td width="18%" align="center">���͹��߹����ѣ�</td>
          <td width="15%"><%=psgjgff%></td>
          <td width="17%" align="center">����ѣ�</td>
          <td width="16%"><%=ysf%></td>
        </tr>
        <tr> 
          <td width="18%" align="center">���ʱ���</td>
          <td width="15%"><%=wxj%></td>
          <td width="17%" align="center">���̼���ۿ</td>
          <td width="16%"><%=gcjxkk%></td>
        </tr>
        <tr> 
          <td width="18%" align="center">˰��</td>
          <td width="15%"><%=sj%></td>
          <td width="17%" align="center">����ɱ���</td>
          <td width="16%"><%=lbcb%></td>
        </tr>
        <tr> 
          <td width="18%" align="center">�����ۿ</td>
          <td width="15%"><%=kqtk%></td>
          <td width="17%" align="center">&nbsp;</td>
          <td width="16%">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="4">���ۿ���С�� ��<%=clf+xbclk+psgjgff+ysf+wxj+gcjxkk+sj+lbcb+kqtk%>Ԫ</td>
        </tr>
      </table>
	
	</td>
    <td width="34%">
		
      <table width="100%" border="1" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
        <tr> 
          <td colspan="2" align="center"><b>ʵ �� �� �� �� ��</b></td>
        </tr>
        <tr> 
          <td width="50%"> 
            <div align="center">��������</div>
          </td>
          <td width="50%"> 
            <div align="center">�����Ԫ��</div>
          </td>
        </tr>
 <%
	String jklxmc=null;
	String jkblsj=null;
	double alljkje=0;
	int row=0;
	ls_sql="select jklxmc,jkblsj,jkje";
	ls_sql+=" from  cw_gdjkjl,dm_jklxbm";
	ls_sql+=" where cw_gdjkjl.jklx=dm_jklxbm.jklxbm and khbh='"+khbh+"' and scbz='N' and jklx in('3','4')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jklxmc=cf.fillNull(rs.getString("jklxmc"));
		jkblsj=cf.fillNull(rs.getDate("jkblsj"));
		jkje=rs.getDouble("jkje");

		alljkje+=jkje;

		row++;

		%>
        <tr> 
          <td width="50%" align="center"><%=jkblsj%></td>
          <td width="50%"><%=jkje%></td>
        </tr>
		<%
	}
	rs.close();
	ps.close();

	for (int i=row;i<5;i++)
	{
		%>
        <tr> 
          <td width="50%" align="center">&nbsp;</td>
          <td width="50%">&nbsp;</td>
        </tr>
		<%
	}

%>
        <tr> 
          <td colspan="2">�Ѳ�����С�ƣ�<%=alljkje%>Ԫ</td>
        </tr>
      </table>
	
	</td>
  </tr>
</table>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="0" cellspacing="0">
  <tr>
    <td width="25%" height="15" align="left" valign="top"> 
      <table width="100%" border="1" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
        <tr> 
          <td colspan="2" align="center" height="25"><b>Զ �� �� �� �Ԫ��</b></td>
        </tr>
        <%
	alljkje=0;
	ls_sql="select jklxmc,jkblsj,jkje";
	ls_sql+=" from  cw_gdjkjl,dm_jklxbm";
	ls_sql+=" where cw_gdjkjl.jklx=dm_jklxbm.jklxbm and khbh='"+khbh+"' and scbz='N' and jklx='5'";//1������ѣ�2�����Ͽ3�����ڲ��4���깤���5��Զ�̷Ѳ��6�������������9������;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jklxmc=cf.fillNull(rs.getString("jklxmc"));
		jkblsj=cf.fillNull(rs.getDate("jkblsj"));
		jkje=rs.getDouble("jkje");

		alljkje+=jkje;

		%> 
        <tr> 
          <td >���ڣ�<%=jkblsj%></td>
          <td width="45%">��<%=jkje%></td>
        </tr>
        <%
	}
	rs.close();
	ps.close();


%> 
        <tr> 
          <td colspan="2">�Ѳ�Զ�̷�С�ƣ�<%=cf.formatDouble(alljkje)%>Ԫ</td>
        </tr>
      </table>
    </td>
    <td width="25%" height="15" align="left" valign="top"> 
      <table width="100%" border="1" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
        <tr align="center"> 
          <td colspan="2" height="25"><b>����������Ԫ��</b></td>
        </tr>
        <%
	alljkje=0;
	ls_sql="select jklxmc,jkblsj,jkje";
	ls_sql+=" from  cw_gdjkjl,dm_jklxbm";
	ls_sql+=" where cw_gdjkjl.jklx=dm_jklxbm.jklxbm and khbh='"+khbh+"' and scbz='N' and jklx='6'";//1������ѣ�2�����Ͽ3�����ڲ��4���깤���5��Զ�̷Ѳ��6�������������9������;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jklxmc=cf.fillNull(rs.getString("jklxmc"));
		jkblsj=cf.fillNull(rs.getDate("jkblsj"));
		jkje=rs.getDouble("jkje");

		alljkje+=jkje;

		%> 
        <tr> 
          <td >���ڣ�<%=jkblsj%></td>
          <td width="45%">��<%=jkje%></td>
        </tr>
        <%
	}
	rs.close();
	ps.close();


%> 
        <tr> 
          <td colspan="2">�Ѳ������С�ƣ�<%=cf.formatDouble(alljkje)%>Ԫ</td>
        </tr>
      </table>
    </td>
    <td width="50%" height="15" align="left" valign="top"> 
      <table width="100%" border="1" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
        <tr align="center"> 
          <td colspan="3" height="25"><b>�� �� �� �Ԫ��</b></td>
        </tr>
        <%
	double allkkje=0;
	String qtkkmc=null;
	String qtkbz=null;
	double kkje=0;
	ls_sql="select qtkkmc,kkje,bz";
	ls_sql+=" from  cw_kqtkjl,dm_qtkkbm";
	ls_sql+=" where cw_kqtkjl.qtkkbm=dm_qtkkbm.qtkkbm(+) and cw_kqtkjl.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		qtkkmc=cf.fillNull(rs.getString("qtkkmc"));
		qtkbz=cf.fillNull(rs.getString("bz"));
		kkje=rs.getDouble("kkje");

		allkkje+=kkje;

		%> 
        <tr align="center"> 
          <td width="22%" ><%=qtkkmc%></td>
          <td width="19%"><%=kkje%></td>
          <td width="59%" align="left"><%=qtkbz%></td>
        </tr>
        <%
	}
	rs.close();
	ps.close();


%> 
        <tr> 
          <td colspan="3">�����ۿ�С�ƣ�<%=cf.formatDouble(allkkje)%>Ԫ</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>


<%

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>