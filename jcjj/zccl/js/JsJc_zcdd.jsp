<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=null;
String khbh=null;
String clgw=null;
String jkxz=null;
String jkdd=null;
String ddshbz=null;
String kjxsj=null;
String xclbz=null;
String htshsj=null;
String xmzy=null;
String qhtsj=null;
String jhclsj=null;
String bz=null;
String ddqrr=null;
String ddqrsj=null;
String cltzr=null;
String tzclsj=null;
String sclr=null;
String sclsj=null;
String tzshr=null;
String tzshsj=null;
String jhshsj=null;
String tzry=null;
String shtzsm=null;
String tztbhsj=null;
String tztbhr=null;
String tbhqk=null;
String jhtbhsj=null;
String tbhtzry=null;
String stbhr=null;
String stbhsj=null;
String wjsj=null;
String sshsj=null;
String sshr=null;
String shqk=null;

String wjlrr=null;
String jssj=null;
String jsr=null;
double jsje=0;
String jstx=null;
String jssm=null;

String clzt=null;
double zczkl=0;
String dzyy=null;
double wdzje=0;
double hkze=0;
double cbze=0;
double zjxcbze=0;
double htcxhdje=0;
double zjxcxhdje=0;
double zqzjhze=0;
double zjhze=0;

double zqclf=0;
double zhclf=0;
double ycf=0;
double qtf=0;

double zqzjxclf=0;
double zhzjxclf=0;
double zjxycf=0;
double zjxqtf=0;

double htjsbl=0;
double zjxjsbl=0;
double alljsbl=0;
double kcfy=0;


String whereddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

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
String ztjjgw=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String ppbm=null;

try {
	conn=cf.getConnection();

	ls_sql="select jssj,jsr,jsje,jstx,jssm,wjlrr,wjsj ,shqk,sshr,sshsj,stbhsj,stbhr,tbhtzry,jhtbhsj,tbhqk,tztbhsj,tztbhr,shtzsm,jhshsj,tzry,ztjjgw,zcdlbm,ppbm,ddbh,khbh,clgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz,hkze,zjhze,ddqrr,ddqrsj,cltzr,tzclsj,sclr,sclsj,tzshr,tzshsj ";
	ls_sql+=" ,clzt,zczkl,dzyy,wdzje,hkze,cbze,zjxcbze,htcxhdje,zjxcxhdje,zqzjhze,zjhze ";
	ls_sql+=" ,zqclf,zhclf,ycf,qtf,  zqzjxclf,zhzjxclf,zjxycf,zjxqtf,kcfy  ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+whereddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kcfy=rs.getDouble("kcfy");
		jssj=cf.fillNull(rs.getDate("jssj"));
		jsr=cf.fillNull(rs.getString("jsr"));
		jsje=rs.getDouble("jsje");
		jstx=cf.fillNull(rs.getString("jstx"));
		jssm=cf.fillNull(rs.getString("jssm"));
		wjlrr=cf.fillNull(rs.getString("wjlrr"));
		wjsj=cf.fillNull(rs.getDate("wjsj"));

		clzt=cf.fillNull(rs.getString("clzt"));
		zczkl=rs.getDouble("zczkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		cbze=rs.getDouble("cbze");
		zjxcbze=rs.getDouble("zjxcbze");
		htcxhdje=rs.getDouble("htcxhdje");
		zjxcxhdje=rs.getDouble("zjxcxhdje");
		zqzjhze=rs.getDouble("zqzjhze");
		zjhze=rs.getDouble("zjhze");

		zqclf=rs.getDouble("zqclf");
		zhclf=rs.getDouble("zhclf");
		ycf=rs.getDouble("ycf");
		qtf=rs.getDouble("qtf");
		zqzjxclf=rs.getDouble("zqzjxclf");
		zhzjxclf=rs.getDouble("zhzjxclf");
		zjxycf=rs.getDouble("zjxycf");
		zjxqtf=rs.getDouble("zjxqtf");



		shqk=cf.fillNull(rs.getString("shqk"));
		sshr=cf.fillNull(rs.getString("sshr"));
		sshsj=cf.fillNull(rs.getDate("sshsj"));
		stbhr=cf.fillNull(rs.getString("stbhr"));
		stbhsj=cf.fillNull(rs.getDate("stbhsj"));
		tbhtzry=cf.fillNull(rs.getString("tbhtzry"));
		jhtbhsj=cf.fillNull(rs.getDate("jhtbhsj"));
		tbhqk=cf.fillNull(rs.getString("tbhqk"));
		tztbhr=cf.fillNull(rs.getString("tztbhr"));
		tztbhsj=cf.fillNull(rs.getDate("tztbhsj"));
		shtzsm=cf.fillNull(rs.getString("shtzsm"));
		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		tzry=cf.fillNull(rs.getString("tzry"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		clgw=cf.fillNull(rs.getString("clgw"));
		jkxz=cf.fillNull(rs.getString("jkxz"));
		jkdd=cf.fillNull(rs.getString("jkdd"));
		ddshbz=cf.fillNull(rs.getString("ddshbz"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		xclbz=cf.fillNull(rs.getString("xclbz"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhclsj=cf.fillNull(rs.getDate("jhclsj"));
		bz=cf.fillNull(rs.getString("bz"));
		hkze=rs.getDouble("hkze");
		zjhze=rs.getDouble("zjhze");
		ddqrr=cf.fillNull(rs.getString("ddqrr"));
		ddqrsj=cf.fillNull(rs.getDate("ddqrsj"));
		cltzr=cf.fillNull(rs.getString("cltzr"));
		tzclsj=cf.fillNull(rs.getDate("tzclsj"));
		sclr=cf.fillNull(rs.getString("sclr"));
		sclsj=cf.fillNull(rs.getDate("sclsj"));
		tzshr=cf.fillNull(rs.getString("tzshr"));
		tzshsj=cf.fillNull(rs.getDate("tzshsj"));
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

}
catch (Exception e) {
	out.print("Exception: " + e);
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
<title>���̽���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<form method="post" action="" name="editform">
<div align="center">���̽��㣨������ţ�<%=ddbh%>��</div> 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right"><strong>����״̬</strong></td>
      <td width="32%" ><strong>
        <%
	cf.selectItem(out,"select clzt,clztmc from jdm_zcddzt where clzt='"+clzt+"'",clzt,true);
%>
      </strong></td>
      <td width="18%" align="right">&nbsp;</td>
      <td width="32%" >&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">ǩ��ͬʱ��</td>
      <td ><%=qhtsj%></td>
      <td align="right">ʵ�ͻ�ʱ��</td>
      <td ><%=sshsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">���ʱ��</td>
      <td ><%=wjsj%></td>
      <td align="right">���¼����</td>
      <td ><%=wjlrr%></td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><b><font color="#0000FF">�����ۿ�</font></b></td>
      <td><%=zczkl%> </td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><b><font color="#0000FF">����ԭ��</font></b></td>
      <td colspan="3"><%=dzyy%></td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><strong>��ǰ����ͬ���Ϸ�</strong></td>
      <td><%=zqclf%></td>
      <td align="right"><strong>�ۺ󣭺�ͬ���Ϸ�</strong></td>
      <td><%=zhclf%></td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><strong>��ͬԶ�̷�</strong></td>
      <td><%=ycf%></td>
      <td align="right"><strong>��ͬ������</strong></td>
      <td><%=qtf%></td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><b>��ǰ����ͬ�ܶ�</b></td>
      <td><%=wdzje%></td>
      <td align="right"><b>�ۺ󣭺�ͬ�ܶ�</b></td>
      <td><%=hkze%></td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><strong>��ǰ����������Ϸ�</strong></td>
      <td><%=zqzjxclf%></td>
      <td align="right"><strong>�ۺ���������Ϸ�</strong></td>
      <td><%=zhzjxclf%></td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><strong>������Զ�̷�</strong></td>
      <td><%=zjxycf%></td>
      <td align="right"><strong>������������</strong></td>
      <td><%=zjxqtf%></td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><b>��ǰ���������ܼ�</b></td>
      <td><%=zqzjhze%></td>
      <td align="right"><b>�ۺ��������ܼ�</b></td>
      <td><%=zjhze%></td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><b>��ǰ���ܼ�</b> </td>
      <td><%=cf.formatDouble(wdzje+zqzjhze)%> </td>
      <td align="right"><b>�ۺ��ܼ�</b> </td>
      <td><%=cf.formatDouble(hkze+zjhze)%> </td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><b>�����������</b></td>
      <td><%=htcxhdje%><font color="#FF0000">��<b>��ͬ</b>��</font></td>
      <td align="right"><b>�����������</b></td>
      <td><%=zjxcxhdje%><font color="#FF0000">��<b>������</b>��</font></td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><b>�����������</b></td>
      <td><%=cf.formatDouble(htcxhdje+zjxcxhdje)%><font color="#FF0000">��<b>��ͬ��������</b>��</font></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><font color="#0033CC"><b>�ɱ����</b></font></td>
      <td><%=cbze%><font color="#FF0000">��<b>��ͬ</b>��</font></td>
      <td align="right"><font color="#0000CC">(�ۺ���Ϸ�-�ɱ�)/�ۺ���Ϸ�</font></td>
      <td><%=htjsbl%>��<font color="#FF0000">��<b>��ͬ</b>��</font></td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><font color="#0033CC"><b>�ɱ����</b></font></td>
      <td><%=zjxcbze%><font color="#FF0000">��<b>������</b>��</font></td>
      <td align="right"><font color="#0000CC">(�ۺ���Ϸ�-�ɱ�)/�ۺ���Ϸ�</font></td>
      <td><%=zjxjsbl%>��<font color="#FF0000">��<b>������</b>��</font></td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><font color="#0033CC"><b>�ɱ��ܶ�</b></font></td>
      <td><%=cf.formatDouble(cbze+zjxcbze)%><font color="#FF0000">��<b>��ͬ��������</b>��</font></td>
      <td align="right"><font color="#0000CC">(�ۺ���Ϸ�-�ɱ�)/�ۺ���Ϸ�</font></td>
      <td><%=alljsbl%>��<font color="#FF0000">��<b>��ͬ��������</b>��</font></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">��������</td>
      <td colspan="3"><%=jstx%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right" bgcolor="#FFFFFF"> <font color="#FF0000">*</font><font color="#0000CC">������</font> </td>
      <td bgcolor="#FFFFFF"><input type="text" name="jsr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" bgcolor="#FFFFFF"> <font color="#FF0000">*</font>����ʱ�� </td>
      <td bgcolor="#FFFFFF"><input type="text" name="jssj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>�۳�����</td>
      <td><input type="text" name="kcfy" value="<%=kcfy%>" size="20" maxlength="20" ></td>
      <td align="right"><font color="#FF0000">*</font>������</td>
      <td><input type="text" name="jsje" value="<%=cf.round(cbze+zjxcbze,2)%>" size="20" maxlength="20" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF">����˵��</td>
      <td colspan="3"><textarea name="jssm" cols="71" rows="3"><%=jssm%></textarea></td>
    </tr>
    <tr> 
      <td colspan="4" align="center">
          <input type="hidden" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" >
          <input type="button"  value="����" onClick="f_do(editform)" name="button">
          <input type="reset"  value="����" name="reset">      </td>
    </tr>
  </table>
</form>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">����</td>
	<td  width="14%">��������</td>
	<td  width="12%">�ͺ�</td>
	<td  width="11%">���</td>
	<td  width="7%" bgcolor="#CC99FF">��װλ��</td>
	<td  width="6%" bgcolor="#CC99FF">��ɫ</td>
	<td  width="5%">��λ</td>
	<td  width="6%">��ͬ����</td>
	<td  width="6%" bgcolor="#CC99FF">����������</td>
	<td  width="7%">�ۺ�ʵ������</td>
	<td  width="6%">�������</td>
	<td  width="7%">�����</td>
	<td  width="8%">������</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql ="SELECT DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����') lx,zcmc,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm";
	ls_sql+=" ,jc_zcddmx.zcysbm,jc_zcddmx.jldwbm,jc_zcddmx.sl,zjhsl";
	ls_sql+=" ,TO_CHAR(jc_zcddmx.dj),jc_zcddmx.jsbl||'%',TO_CHAR(jc_zcddmx.cbj),jc_zcddmx.cbj*zjhsl  ";
	ls_sql+=" FROM jc_zcddmx";
    ls_sql+=" where jc_zcddmx.ddbh='"+ddbh+"' ";
    ls_sql+=" order by jc_zcddmx.lx,jc_zcddmx.zcdlbm,jc_zcddmx.zclbbm,jc_zcddmx.zcbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("lx","1");//�в����������Hash��
	spanColHash.put("zcmc","1");//�в����������Hash��
	spanColHash.put("gysmc","1");//�в����������Hash��
	spanColHash.put("zclbbm","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right" bgcolor="#CCCCFF"> 
      �ͻ����    </td>
    <td width="32%" bgcolor="#CCCCFF"> <%=khbh%> </td>
    <td width="18%" align="right" bgcolor="#CCCCFF"> 
      ��ͬ��    </td>
    <td width="32%" bgcolor="#CCCCFF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right">�ͻ�����</td>
    <td ><%=khxm%>��
      <input type="button" value="�鿴�绰" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" name="button4" >
��</td>
    <td align="right">�ʼ�</td>
    <td ><%=zjxm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right">���ݵ�ַ</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr> 
    <td bgcolor="#CCCCFF" align="right">ǩԼ����</td>
    <td bgcolor="#CCCCFF"><%=dwmc%></td>
    <td bgcolor="#CCCCFF" align="right">��װ���ʦ</td>
    <td bgcolor="#CCCCFF"><%=sjs%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right"> 
      ʩ����    </td>
    <td > <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"> 
      �೤    </td>
    <td ><%=sgbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right"> 
      ��װǩԼ����    </td>
    <td > <%=qyrq%> </td>
    <td align="right">&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right">��ͬ��������</td>
    <td ><%=kgrq%></td>
    <td align="right">��ͬ��������</td>
    <td ><%=jgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">�μӴ����</td>
    <td colspan="3"> <%=cxhdbm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td bgcolor="#FFFFFF" align="right">���Ĵ���</td>
    <td > <%=zcdlbm%> </td>
    <td align="right">Ʒ��</td>
    <td > <%=ppbm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">�ͻ���������</td>
    <td ><%
	cf.radioToken(out, "1+δ����&2+ȫ��&3+�����������&4+Ԥ�������&5+�˻������",jkxz,true);
%></td>
    <td align="right">����ص�</td>
    <td ><%
	cf.radioToken(out, "1+�������ֳ������&2+�����տ�&3+��˾�����տ�",jkdd,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right"> 
      פ��Ҿӹ���    </td>
    <td > <%=clgw%> </td>
    <td align="right"> 
      չ���Ҿӹ���    </td>
    <td ><%=ztjjgw%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ĿרԱ</td>
    <td ><%=xmzy%></td>
    <td align="right">&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">�������־</td>
    <td ><%
	cf.selectToken(out,"1+�������&2+�ȴ�����֪ͨ&3+������֪ͨ&4+�Ѳ���",xclbz,true);
%></td>
    <td align="right">�ƻ�����ʱ��</td>
    <td ><%=jhclsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right"> 
      �ȴ��ͻ�֪ͨ    </td>
    <td ><%
	cf.selectToken(out,"1+�������&2+����δ֪ͨ&3+������֪ͨ",ddshbz,true);
%> </td>
    <td align="right"> 
      ��ͬ�ͻ�ʱ��    </td>
    <td ><%=htshsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">�ɼ����ֹʱ��</td>
    <td ><%=kjxsj%></td>
    <td align="right">&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">����ȷ����</td>
    <td ><%=ddqrr%></td>
    <td align="right">����ȷ��ʱ��</td>
    <td ><%=ddqrsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCFFCC"> 
      ����֪ͨ¼����    </td>
    <td > <%=cltzr%></td>
    <td align="right"> 
      ������֪ͨʱ��    </td>
    <td ><%=tzclsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> �ƻ��ͻ�ʱ�� </td>
    <td><%=jhshsj%> </td>
    <td align="right"> ��ͬ�ͻ�ʱ�� </td>
    <td><%=htshsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ͻ�֪ͨ˵��</td>
    <td colspan="3"><%=shtzsm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ���ͻ�֪ͨ�� </td>
    <td><%=tzshr%> </td>
    <td align="right"> ���ͻ�֪ͨʱ�� </td>
    <td><%=tzshsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">֪ͨ��Ա</td>
    <td><%=tzry%> </td>
    <td align="right">ʵ�ͻ���</td>
    <td><%=sshr%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"> �ͻ���� </td>
    <td colspan="3"><%=shqk%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> �˲���֪ͨ��Ա </td>
    <td><%=tbhtzry%> </td>
    <td align="right"> Լ���˲���ʱ�� </td>
    <td><%=jhtbhsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ���˲���֪ͨ�� </td>
    <td><%=tztbhr%> </td>
    <td align="right"> ���˲���֪ͨʱ�� </td>
    <td><%=tztbhsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ʵ�˲����� </td>
    <td><%=stbhr%> </td>
    <td align="right"> ʵ�˲���ʱ�� </td>
    <td><%=stbhsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> �˲������ </td>
    <td colspan="3"><%=tbhqk%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">��ע</td>
    <td colspan="3"><%=bz%></td>
  </tr>
</table>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	if(	javaTrim(FormName.jsr)=="") {
		alert("��ѡ��[������]��");
		FormName.jsr.focus();
		return false;
	}
	if(	javaTrim(FormName.jssj)=="") {
		alert("��ѡ��[����ʱ��]��");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.kcfy)=="") {
		alert("��ѡ��[�۳�����]��");
		FormName.kcfy.focus();
		return false;
	}
	if(!(isFloat(FormName.kcfy, "�۳�����"))) {
		return false;
	}
	if(	javaTrim(FormName.jsje)=="") {
		alert("��ѡ��[������]��");
		FormName.jsje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsje, "������"))) {
		return false;
	}


	FormName.action="SaveJsJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>

