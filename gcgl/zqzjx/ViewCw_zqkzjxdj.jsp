<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yqkje=null;
String eqksj=null;
String eqkje=null;
String sjysje=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String zbbz=null;



String dqbm=null;
String fgsbh=null;
String kh_dwbh=null;
double kh_zjxje=0;
double kh_zhzjxje=0;
double kh_zqguanlif=0;
double kh_guanlifbfb=0;
double kh_guanlif=0;
double kh_zqzjxguanlif=0;
double kh_zjxguanlif=0;
double kh_suijin=0;
double kh_suijinbfb=0;
double kh_zjxsuijin=0;
double kh_kglf=0;
double kh_kqtk=0;

String cxhdbmxq=null;
String cxhdbmzh=null;
String cxhdbm=null;
String kh_sjsjsbz=null;
String kh_gdjsjd=null;
String kh_gckkspbz=null;
String kh_gcjdbm=null;
String kh_zjxxh=null;
String kh_zjxm=null;
String kh_qyrq=null;

double kh_wdzgce=0;
double kh_qye=0;
double kh_zkl=0;
String kh_hth=null;
String kh_khxm=null;
String kh_lxfs=null;
String kh_sgd=null;
String kh_sgbz=null;
String kh_fwdz=null;
String kh_sjs=null;
String kh_jzbz=null;
String kh_zjxwcbz=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
double cwsfke=0;




String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select yqkje,eqksj,eqkje,sjysje,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  cw_zqkzjxdj";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yqkje=cf.fillNull(rs.getString("yqkje"));
		eqksj=cf.fillNull(rs.getDate("eqksj"));
		eqkje=cf.fillNull(rs.getString("eqkje"));
		sjysje=cf.fillNull(rs.getString("sjysje"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		zbbz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	ls_sql="select fgsbh,dwbh,zjxje,zhzjxje,zqguanlif,guanlif,zqzjxguanlif,zjxguanlif  ,suijin,suijinbfb,zjxsuijin  ,kglf,kqtk";
	ls_sql+=" ,cxhdbm,cxhdbmxq,cxhdbmzh,sjsjsbz,gdjsjd,gckkspbz,gcjdbm,zjxxh,zjxm,qyrq";
	ls_sql+=" ,wdzgce,qye,zkl,hth,khxm,lxfs,sgd,sgbz,fwdz,sjs,jzbz,zjxwcbz,kgrq,jgrq,sjkgrq,sjjgrq,cwsfke";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		kh_dwbh=cf.fillNull(rs.getString("dwbh"));
		kh_zjxje=rs.getDouble("zjxje");
		kh_zhzjxje=rs.getDouble("zhzjxje");
		kh_zqguanlif=rs.getDouble("zqguanlif");
		kh_guanlif=rs.getDouble("guanlif");
		kh_zqzjxguanlif=rs.getDouble("zqzjxguanlif");
		kh_zjxguanlif=rs.getDouble("zjxguanlif");

		kh_suijin=rs.getDouble("suijin");
		kh_suijinbfb=rs.getDouble("suijinbfb");
		kh_zjxsuijin=rs.getDouble("zjxsuijin");

		kh_kglf=rs.getDouble("kglf");
		kh_kqtk=rs.getDouble("kqtk");

		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		kh_sjsjsbz=cf.fillNull(rs.getString("sjsjsbz"));
		kh_gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		kh_gckkspbz=cf.fillNull(rs.getString("gckkspbz"));//���̿ۿ�������־
		kh_gcjdbm=cf.fillNull(rs.getString("gcjdbm"));//���̽���
		kh_zjxxh=cf.fillNull(rs.getString("zjxxh"));
		kh_zjxm=cf.fillNull(rs.getString("zjxm"));
		kh_qyrq=cf.fillNull(rs.getDate("qyrq"));


		kh_wdzgce=rs.getDouble("wdzgce");
		kh_qye=rs.getDouble("qye");
		kh_zkl=rs.getDouble("zkl");
		kh_hth=cf.fillNull(rs.getString("hth"));
		kh_khxm=cf.fillNull(rs.getString("khxm"));
		kh_lxfs=cf.fillNull(rs.getString("lxfs"));
		kh_sgd=cf.fillNull(rs.getString("sgd"));
		kh_sgbz=cf.fillNull(rs.getString("sgbz"));
		kh_fwdz=cf.fillNull(rs.getString("fwdz"));
		kh_sjs=cf.fillNull(rs.getString("sjs"));
		kh_jzbz=rs.getString("jzbz");
		kh_zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		cwsfke=rs.getDouble("cwsfke");

	}
	else{
		out.println("���󣡿ͻ�������");
		return;
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">���ڿ�������Ǽ�</div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF">
    <td><div align="right">��ͬ��</div></td>
    <td><%=kh_hth%> </td>
    <td><div align="right">�ͻ�����</div></td>
    <td><%=kh_khxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td><div align="right">���ݵ�ַ</div></td>
    <td><%=kh_fwdz%> </td>
    <td><div align="right">���̵���</div></td>
    <td><%=kh_zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ǩԼ����</td>
    <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+kh_dwbh+"'",kh_dwbh,false);
%></td>
    <td align="right">���ʦ</td>
    <td><%=kh_sjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td><div align="right">ʩ����</div></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+kh_sgd+"'",kh_sgd,false);
%>    </td>
    <td><div align="right">ʩ������</div></td>
    <td><%=kh_sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">����ԭ����</td>
    <td><%=kh_wdzgce%></td>
    <td align="right">����ǩԼ��</td>
    <td><%=kh_qye%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" height="2">��ͬ˰��</td>
    <td height="2"><%=kh_suijin%></td>
    <td align="right" height="2">�ۿ�</td>
    <td height="2"><font color="#0000CC"><%=kh_zkl%></font></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" height="2">��ͬ�����-��ǰ</td>
    <td height="2"><%=kh_zqguanlif%></td>
    <td align="right" height="2">��ͬ�����-�ۺ�</td>
    <td height="2"><%=kh_guanlif%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" height="2"><b>��ͬ����</b></td>
    <td height="2"><%=kgrq%></td>
    <td align="right" height="2">&nbsp;</td>
    <td height="2"><%=jgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" height="2"><b>ʵ�ʹ���</b></td>
    <td height="2"><%=sjkgrq%></td>
    <td align="right" height="2">&nbsp;</td>
    <td height="2"><%=sjjgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�μӹ�˾�����</td>
    <td colspan="3"><%=cxhdbm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�μ�С�������</td>
    <td colspan="3"><%=cxhdbmxq%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�μ�չ������</td>
    <td colspan="3"><%=cxhdbmzh%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">һ�ڿ�ʵ�ս��</td> 
  <td width="32%"><%=yqkje%></td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ڿ�Ӧ��ʱ��</td> 
  <td width="32%"><%=eqksj%></td>
  <td align="right" width="19%">���ڿ�Ӧ�ս��</td> 
  <td width="31%"><%=eqkje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF">ʵ��Ӧ�ս��</td> 
  <td width="32%"><%=sjysje%></td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">¼����</td>
  <td><%=lrr%></td>
  <td align="right" bgcolor="#FFFFFF">¼��ʱ��</td>
  <td><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF">¼�벿��</td> 
  <td width="32%">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,false);
%>  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> <%=zbbz%></td>
  </tr>
</table>

<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>

    <tr bgcolor="#CCCCCC"  align="center"> 
		<td width="6%">����</td>
		<td width="5%">���</td>
		<td width="20%">����</td>
		<td width="10%">���</td>
		<td width="20%">������</td>
		<td width="9%">��ͬ��</td>
		<td width="20%">��ע</td>
    </tr>

<%
	String ptr=null;
	String mc=null;
	String cls=null;
	double je=0;
	String zjxbz=null;
	String zjxbzmc=null;
	String bz=null;

	int row=0;
	double allje=0;
	double xj=0;

	ls_sql="select ptr,mc,cls,je,zjxbz,DECODE(zjxbz,'1','���','2','���') zjxbzmc,bz ";
	ls_sql+=" FROM cw_zqkzjxmx";
	ls_sql+=" where cw_zqkzjxmx.khbh='"+khbh+"' and zjxbz='1'";//1�����2������
	ls_sql+=" order by zjxbz,ptr";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ptr=cf.fillNull(rs.getString("ptr"));
		mc=cf.fillNull(rs.getString("mc"));
		cls=cf.fillNull(rs.getString("cls"));
		je=rs.getDouble("je");
		zjxbz=cf.fillNull(rs.getString("zjxbz"));
		zjxbzmc=cf.fillNull(rs.getString("zjxbzmc"));
		bz=cf.fillHtml(rs.getString("bz"));

		xj+=je;
		allje+=je;

		row++;

		%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td><%=zjxbzmc%></td>
		  <td><%=row%></td>
		  <td> <%=mc%></td>
		  <td> <%=je%></td>
		  <td> <%=cls%></td>
		  <td> <%=ptr%></td>
		  <td> <%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td colspan="2">����С��</td>
		  <td>&nbsp;</td>
		  <td><%=cf.formatDouble(xj)%></td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		</tr>
</table>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
		<td width="6%">����</td>
		<td width="5%">���</td>
		<td width="20%">����</td>
		<td width="10%">���</td>
		<td width="20%">������</td>
		<td width="9%">��ͬ��</td>
		<td width="20%">��ע</td>
    </tr>

<%
	xj=0;
	ls_sql="select ptr,mc,cls,je,zjxbz,DECODE(zjxbz,'1','���','2','���') zjxbzmc,bz ";
	ls_sql+=" FROM cw_zqkzjxmx";
	ls_sql+=" where cw_zqkzjxmx.khbh='"+khbh+"' and zjxbz='2'";//1�����2������
	ls_sql+=" order by zjxbz,ptr";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ptr=cf.fillNull(rs.getString("ptr"));
		mc=cf.fillNull(rs.getString("mc"));
		cls=cf.fillNull(rs.getString("cls"));
		je=rs.getDouble("je");
		zjxbz=cf.fillNull(rs.getString("zjxbz"));
		zjxbzmc=cf.fillNull(rs.getString("zjxbzmc"));
		bz=cf.fillNull(rs.getString("bz"));

		xj+=je;
		allje+=je;

		row++;

		%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td><%=zjxbzmc%></td>
		  <td><%=row%></td>
		  <td> <%=mc%></td>
		  <td> <%=je%></td>
		  <td> <%=cls%></td>
		  <td> <%=ptr%></td>
		  <td> <%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td colspan="2">����С��</td>
		  <td>&nbsp;</td>
		  <td><%=cf.formatDouble(xj)%></td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		</tr>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td colspan="2">�ܼ�</td>
		  <td>&nbsp;</td>
		  <td><%=cf.formatDouble(allje)%></td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		</tr>
</table>

  </table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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