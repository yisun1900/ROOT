<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");

String khbh=null;
String clzt=null;
String lrr=null;
String lrsj=null;
String dwbh=null;
String bz=null;

String zcdlbm=null;
String zcxlbm=null;
String ppbm=null;
  
 
double wdzje=0;
double hkze=0;
double htcxhdje=0;
 
double zqclf=0;
double zhclf=0;

double ycf=0;
double qtf=0;

  

String ddbh=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String fgsbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmdwbh=null;
String dwmc=null;
String cxhdbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String bzdh="";
String zjdh="";
String sjsdh="";
String dzdh=null;
String ssfgs=null;
String ddlx=null;
String gys=null;
String ppmc=null;
  
 
try {
	conn=cf.getConnection();
	ls_sql="select  jc_zcysd.khbh,fgsbh,zcdlbm,zcxlbm,gys,ppmc,ppbm,DECODE(jc_zcysd.clzt,'00','¼��Ԥ�㵥','01','Ԥ�㵥���','02','תΪ��ʽ����') clzt,jc_zcysd.lrr,jc_zcysd.lrsj,jc_zcysd.dwbh,jc_zcysd.bz";
	ls_sql+=" ,wdzje,jc_zcysd.hkze,htcxhdje,zqclf,zhclf,ycf,qtf ";
 	ls_sql+=" from  jc_zcysd";
	ls_sql+=" where jc_zcysd.ddbh='"+ddbh+"'  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
 		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
 
 
 		clzt=cf.fillNull(rs.getString("clzt"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getString("lrsj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		bz=cf.fillNull(rs.getString("bz"));

 		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		htcxhdje=rs.getDouble("htcxhdje");
		zqclf=rs.getDouble("zqclf");
		zhclf=rs.getDouble("zhclf");
		ycf=rs.getDouble("ycf");
		qtf=rs.getDouble("qtf");
 	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,ssfgs,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		dmdwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and  sq_dwxx.ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dmdwbh+"' and yhmc ='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	if (yhjs.equals("G0"))
	{
		qye="&nbsp;";
		sjs="&nbsp;";
		sjsdh="&nbsp;";
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" +ls_sql);
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

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">
<div align="center">����Ԥ�㵥��������ţ�<%=ddbh%>�� 
</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#CCCCFF"> 
      �ͻ����    </td>
    <td width="30%" bgcolor="#CCCCFF"> <%=khbh%> </td>
    <td width="290" align="right" bgcolor="#CCCCFF"> 
      ��ͬ��    </td>
    <td width="29%" bgcolor="#CCCCFF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">�ͻ�����</td>
    <td width="30%"><%=khxm%>�� 
      <input type="button" value="�鿴�绰" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" name="button4" >
      ��</td>
    <td width="290" align="right">�ʼ�</td>
    <td width="29%"><%=zjxm%>��<%=zjdh%>�� </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">���ݵ�ַ</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr> 
    <td width="20%" bgcolor="#CCCCFF" align="right">ǩԼ����</td>
    <td width="30%" bgcolor="#CCCCFF"><%=dwmc%></td>
    <td width="290" bgcolor="#CCCCFF" align="right">��װ���ʦ</td>
    <td width="29%" bgcolor="#CCCCFF"><%=sjs%>��<%=sjsdh%>��</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right"> 
      ʩ����    </td>
    <td width="30%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>��<%=dzdh%>�� </td>
    <td width="290" align="right"> 
      �೤    </td>
    <td width="29%"><%=sgbz%>��<%=bzdh%>�� </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right"> 
      ��װǩԼ����    </td>
    <td width="30%"> <%=qyrq%> </td>
    <td width="290" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right" bgcolor="#CCCCFF">��ͬ��������</td>
    <td width="30%"><%=kgrq%></td>
    <td width="290" align="right">��ͬ��������</td>
    <td width="29%"><%=jgrq%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#CCFFCC">�μӴ����</td>
    <td colspan="3"> <%=cxhdbm%> </td>
  </tr>
  <tr align="right" bgcolor="#FFFFFF"> 
    <td colspan="4" bgcolor="#FFFFFF" height="24">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#CCFFCC"><strong> 
      ����״̬    </strong></td>
    <td width="30%"> <strong>
      <%
	cf.selectItem(out,"select clzt,clztmc from jdm_zcddzt where clzt='"+clzt+"'",clzt,true);
%> 
    </strong></td>
    <td width="290" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" bgcolor="#FFFFFF" align="right">���Ĵ���</td>
    <td width="30%"> <%=zcdlbm%> </td>
    <td width="290" align="right">����С��</td>
    <td width="29%"><%=zcxlbm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">Ʒ�ƹ�Ӧ��</td>
    <td width="30%"><%=ppbm%></td>
    <td width="290" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">Ʒ��</td>
    <td width="30%"><%=ppmc%></td>
    <td width="290" align="right">��Ӧ��</td>
    <td width="29%"><%=gys%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><strong>��ǰ�����Ϸ�</strong></td>
    <td><%=zqclf%></td>
    <td align="right"><strong>�ۺ󣭲��Ϸ�</strong></td>
    <td><%=zhclf%></td>
  </tr>
  
  <tr bgcolor="#FFFFCC">
    <td align="right"><strong>Զ�̷�</strong></td>
    <td><%=ycf%></td>
    <td align="right"><strong>������</strong></td>
    <td><%=qtf%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><b>��ǰ���ܶ�</b></td>
    <td><%=wdzje%></td>
    <td align="right"><b>�ۺ��ܶ�</b></td>
    <td><%=hkze%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="20%" align="right"><b>�����������</b></td>
    <td width="30%"><%=htcxhdje%></td>
    <td width="290" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"> 
      ¼����    </td>
    <td width="30%" bgcolor="#FFFFFF"><%=lrr%></td>
    <td width="290" align="right"> 
      ¼��ʱ��    </td>
    <td width="29%" bgcolor="#FFFFFF"><%=lrsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"> 
      ¼�벿��    </td>
    <td width="30%" bgcolor="#FFFFFF"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
    <td width="290" align="right">    </td>
    <td width="29%" bgcolor="#FFFFFF">&nbsp; </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">��ע</td>
    <td colspan="3" bgcolor="#FFFFFF"><%=bz%></td>
  </tr>
</table>
<center>
  <b>������ϸ</b> 
</center>
<table border="1" width="270%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="80px">��д��־</td>
	<td  width="110px">���ı���</td>
	<td  width="280px" bgcolor="#CCCCCC">��������</td>
	<td  width="280px">�ͺ�</td>
	<td  width="280px">���</td>
	<td  width="110px" >��С����</td>
	<td  width="140px" bgcolor="#CC99FF">��װλ��</td>
	<td  width="140px" bgcolor="#CC99FF">��ɫ</td>
	<td  width="90px">��ǰʵ������</td>
	<td  width="90px">�ۿ�</td>
	<td  width="90px">�ۺ�ʵ������</td>
	<td  width="110px">��λ</td>
	<td  width="80px" bgcolor="#CC99FF">��������</td>
	<td  width="110px">����</td>
	<td  width="130px">��ǰ���Ϸ�</td>
	<td  width="130px">�ۺ���Ϸ�</td>
	<td  width="130px">Զ�̷�</td>
	<td  width="130px">��������</td>
	<td  width="130px">�����ѽ��</td>
	<td  width="130px" bgcolor="#CCCCCC"><font color="#0000CC"><strong>��ǰС��</strong></font></td>
	<td  width="130px" bgcolor="#CCCCCC"><font color="#0000CC"><strong>�ۺ�С��</strong></font></td>
	<td  width="130px">�����������</td>

	<td  width="130px">�г����</td>
	<td  width="130px">�����޼�</td>
	<td  width="120px">��׼��������</td>
	<td  width="90px">�д���</td>
	<td  width="170px">������ʼʱ��</td>
	<td  width="170px">��������ʱ��</td>
	<td  width="130px">������</td>
	<td  width="130px">������������</td>
	<td  width="130px">�����</td>
	<td  width="380px">ϵ��</td>
	<td  width="130px" bgcolor="#CC99FF">ѡ��۸�</td>
	<td  width="130px">�Ƿ�μӴ����</td>
	<td  width="200px">��д��ͬԭ��</td>
	<td  width="480px">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	ls_sql ="SELECT DECODE(jc_zcysdmx.sxbz,'1','��','2','��д') sxbz,jc_zcysdmx.zcbm,zcmc,jc_zcysdmx.xinghao,jc_zcysdmx.gg,TO_CHAR(jc_zcysdmx.zxqdl),zcpzwzbm,jc_zcysdmx.zcysbm";
	ls_sql+=" ,TO_CHAR(jc_zcysdmx.zqdj) zqdj,TO_CHAR(jc_zcysdmx.dpzk) dpzk,TO_CHAR(jc_zcysdmx.dj) dj,jldwbm,cxhdbl||'%' cxhdbl,jc_zcysdmx.sl";
	ls_sql+=" ,jc_zcysdmx.zqje,jc_zcysdmx.je,ycf,DECODE(qtfy,'1','��װ��','2','�ӹ���','3','�����շ�'),qtfyje,zqje+ycf+qtfyje zqhtxj,je+ycf+qtfyje zhhtxj,cxhdje";
	ls_sql+=" ,TO_CHAR(jc_zcysdmx.lsj),TO_CHAR(jc_zcysdmx.yhj),bzcxhdbl||'%',DECODE(sfycx,'N','��','Y','<font color=\"#FF0000\">��</font>'),cxkssj,cxjzsj,cxj,lscxhdbl||'%'";
	ls_sql+=" ,jc_zcysdmx.pjts*jc_zcysdmx.zjhsl pjzs,zclbbm";
	ls_sql+=" ,DECODE(xzjg,'0','��д','1','���ۼ�','3','�г����','2','<font color=\"#FF0000\">������</font>') xzjg,decode(cxhdbz,'Y','�μ�','N','���μ�')";
	ls_sql+=" ,jc_zcysdmx.sxhtyy,jc_zcysdmx.bz";
	ls_sql+=" FROM jc_zcysdmx";
    ls_sql+=" where jc_zcysdmx.ddbh='"+ddbh+"' ";
    ls_sql+=" order by jc_zcysdmx.lx,jc_zcysdmx.xinghao";
	
	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>
</body>
</html>
