<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=null;
String khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_dwbh=null;
String crm_khxx_sgd=null;
String crm_khxx_zjxm=null;
String jc_zczjx_zczjxyybm=null;
String jc_zczjx_qrr=null;
String jc_zczjx_qrsj=null;
String jc_zczjx_htshsj=null;
String jc_zczjx_sshsj=null;
String jc_zczjx_clzt=null;
String jc_zczjx_lrr=null;
String jc_zczjx_lrsj=null;
String jc_zczjx_dwbh=null;
String jc_zczjx_bz=null;

double zqzjxze=0;
double zjxze=0;
double zjxcbze=0;
double zjxzkl=0;
String dzyy=null;
double zjxcxhdje=0;
String jssj=null;
String jsr=null;

String zcfgsbh="";
String qddm="";
String jzsjs="";
String zjxfssj="";

String zcdlbm=null;
String zcxlbm=null;
String ppbm=null;
String gys=null;
String ppmc=null;
String clgw=null;
String ztjjgw=null;
String xmzy=null;
String jjsjs=null;

double wdzje=0;
double hkze=0;
double htcxhdje=0;
double zqzjhze=0;
double zjhze=0;
double zjxcxhdjelj=0;

double yfkze=0;
double zcfk=0;

String sxhtsfysh=null;

String ddlx=null;
String zjxbh=null;
zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select jc_zczjx.sxhtsfysh,jc_zczjx.zjxcbze,jc_zczjx.zqzjxze,jc_zczjx.zjxze,jc_zczjx.zjxzkl,jc_zczjx.dzyy,jc_zczjx.zjxcxhdje,jc_zczjx.jssj,jc_zczjx.jsr,   zcdlbm,zcxlbm,ppbm,gys,ppmc,jc_zczjx.clgw,ztjjgw,jc_zczjx.xmzy,jjsjs,zjxfssj,jc_zczjx.fgsbh,qddm,jzsjs,DECODE(jc_zczjx.ddlx,'1','ϵͳ����Ʒ�ƶ���','2','ϵͳ������Ʒ�ƶ���') ddlx,jc_zczjx.ddbh as ddbh,jc_zczjx.khbh as khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.dwbh as crm_khxx_dwbh,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,jc_zczjx.zczjxyybm as jc_zczjx_zczjxyybm,jc_zczjx.qrr as jc_zczjx_qrr,jc_zczjx.qrsj as jc_zczjx_qrsj,jc_zczjx.htshsj as jc_zczjx_htshsj,jc_zczjx.sshsj as jc_zczjx_sshsj,jc_zczjx.clzt as jc_zczjx_clzt,jc_zczjx.lrr as jc_zczjx_lrr,jc_zczjx.lrsj as jc_zczjx_lrsj,jc_zczjx.dwbh as jc_zczjx_dwbh,jc_zczjx.bz as jc_zczjx_bz ";
	ls_sql+=" from  crm_khxx,jc_zczjx";
	ls_sql+=" where jc_zczjx.khbh=crm_khxx.khbh and (jc_zczjx.zjxbh='"+zjxbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
		zjxcbze=rs.getDouble("zjxcbze");
		zqzjxze=rs.getDouble("zqzjxze");
		zjxze=rs.getDouble("zjxze");
		zjxzkl=rs.getDouble("zjxzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		zjxcxhdje=rs.getDouble("zjxcxhdje");
		jssj=cf.fillNull(rs.getString("jssj"));
		jsr=cf.fillNull(rs.getString("jsr"));

		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		jjsjs=cf.fillNull(rs.getString("jjsjs"));

		zjxfssj=cf.fillNull(rs.getDate("zjxfssj"));
		zcfgsbh=cf.fillNull(rs.getString("fgsbh"));
		qddm=cf.fillNull(rs.getString("qddm"));
		jzsjs=cf.fillNull(rs.getString("jzsjs"));
		ddlx=cf.fillNull(rs.getString("ddlx"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_dwbh=cf.fillNull(rs.getString("crm_khxx_dwbh"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		jc_zczjx_zczjxyybm=cf.fillNull(rs.getString("jc_zczjx_zczjxyybm"));
		jc_zczjx_qrr=cf.fillNull(rs.getString("jc_zczjx_qrr"));
		jc_zczjx_qrsj=cf.fillNull(rs.getString("jc_zczjx_qrsj"));
		jc_zczjx_htshsj=cf.fillNull(rs.getDate("jc_zczjx_htshsj"));
		jc_zczjx_sshsj=cf.fillNull(rs.getDate("jc_zczjx_sshsj"));
		jc_zczjx_clzt=cf.fillNull(rs.getString("jc_zczjx_clzt"));
		jc_zczjx_lrr=cf.fillNull(rs.getString("jc_zczjx_lrr"));
		jc_zczjx_lrsj=cf.fillNull(rs.getDate("jc_zczjx_lrsj"));
		jc_zczjx_dwbh=cf.fillNull(rs.getString("jc_zczjx_dwbh"));
		jc_zczjx_bz=cf.fillNull(rs.getString("jc_zczjx_bz"));
	}
	rs.close();
	ps.close();

	if (sxhtsfysh.equals("N"))
	{
		out.println("<BR><strong><font color=\"#FF0000\">������д��ͬδ��ˣ�����ȷ�ϣ�</font></strong>");
		return;
	}

	if (zjxzkl<10)
	{
//		out.println("���ѣ��Ѵ��ۣ�������Ȩȷ�ϣ�");
//		out.println("<BR>�ۿ��ʣ�"+zjxzkl);
//		return ;
	}

	ls_sql="select wdzje,hkze,htcxhdje,zjxcxhdje,zqzjhze,zjhze";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		htcxhdje=rs.getDouble("htcxhdje");
		zjxcxhdjelj=rs.getDouble("zjxcxhdje");
		zqzjhze=rs.getDouble("zqzjhze");
		zjhze=rs.getDouble("zjhze");
	}
	rs.close();
	ps.close();


	//�Ҿ�Ԥ����
	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('62','63','64','65')";//62������Ԥ���63��ľ��Ԥ���64������Ԥ���65���Ҿ�Ԥ����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yfkze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where zjxbh='"+zjxbh+"' and scbz='N' and fklxbm='23'";//21:ľ�ţ�22:����23:���ģ�24���Ҿ�
	ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	if (zcfk < (zjxze-11))
	{
		out.println("���ѣ����������δ��ˣ�����ȷ�ϣ�");
		out.println("<BR>ʵ�����"+zcfk);
		out.println("<BR>��������"+cf.round(zjxze,2)+"��Ӧ���������"+cf.round(zjxze-zcfk,2));
		return ;
	}
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
<title>�����ȷ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#CCCCCC">������������ϼƣ��������ţ�<%=zjxbh%>��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="25%" align="right" bgcolor="#CCCCCC"><b>��ǰ����ͬ��</b></td>
    <td width="25%" bgcolor="#CCCCCC"><%=wdzje%></td>
    <td width="26%" align="right" bgcolor="#CCCCCC"><b>�ۺ󣭺�ͬ��</b></td>
    <td width="24%" bgcolor="#CCCCCC"><%=hkze%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#CCCCCC"><b>��ͬ���������ǰ��</b></td>
    <td bgcolor="#CCCCCC"><%=cf.formatDouble(wdzje+zqzjhze)%></td>
    <td align="right" bgcolor="#CCCCCC"><b>��ͬ��������ۺ�</b></td>
    <td bgcolor="#CCCCCC"><%=cf.formatDouble(hkze+zjhze)%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#CCCCCC"><b>������������ͬ��</b></td>
    <td bgcolor="#CCCCCC"><%=htcxhdje%></td>
    <td align="right" bgcolor="#CCCCCC"><b>������������ͬ�������</b></td>
    <td bgcolor="#CCCCCC"><%=cf.formatDouble(htcxhdje+zjxcxhdjelj)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#FFFFFF">�����ȷ�ϣ���������ţ�<%=zjxbh%>��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>��ǰ<b>��</b>��������</strong></td>
    <td><%=zqzjxze%></td>
    <td align="right"><strong>�ۺ�<b>��</b>��������</strong></td>
    <td><%=zjxze%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><strong>�������ۿ�</strong></td>
    <td><%=zjxzkl%></td>
    <td align="right" bgcolor="#FFFFFF"><strong>������������</strong></td>
    <td><%=zjxcxhdje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><strong>����ԭ��</strong></td>
    <td colspan="3"><%=dzyy%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><strong><font color="#0000FF">����Ԥ����</font></strong></td>
    <td><%=yfkze%></td>
    <td align="right"><b><font color="#0000FF">�����Ѹ���</font></b></td>
    <td><%=zcfk%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ������ȷ����</td>
    <td><input type="text" name="qrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
    <td align="right">������ȷ��ʱ�� </td>
    <td><input type="text" name="qrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
  </tr>
  <tr>
    <td colspan="4" height="2"><div align="center">
        <input type="hidden" name="zjxbh" value="<%=zjxbh%>" >
        <input type="button"  value="����" onClick="f_do(editform)">
        <input type="reset"  value="����" name="reset">
        <input type="button" value="�鿴�绰" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" name="button4" >
    </div></td>
  </tr>
  </table>
</form>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      �ͻ����    </td>
    <td width="29%"> <%=khbh%> </td>
    <td width="21%" align="right"> 
      ��ͬ��    </td>
    <td width="29%"><%=crm_khxx_hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      �ͻ�����    </td>
    <td width="29%"><%=crm_khxx_khxm%></td>
    <td width="21%" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">���ݵ�ַ</td>
    <td colspan="3"><%=crm_khxx_fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      ���ʦ    </td>
    <td width="29%"><%=crm_khxx_sjs%> </td>
    <td width="21%" align="right"> 
      �ʼ�    </td>
    <td width="29%"><%=crm_khxx_zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      ǩԼ����    </td>
    <td width="29%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh",crm_khxx_dwbh,true);
%> </td>
    <td width="21%" align="right"> 
      ʩ����    </td>
    <td width="29%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc",crm_khxx_sgd,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="26" colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ������� </td>
    <td><%=ddbh%> </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ����״̬ </td>
    <td><%
	cf.selectToken(out,"00+¼��δ���&01+¼�������&02+��ȷ��&04+�����ѽ���&03+���ͻ�&99+�˵�",jc_zczjx_clzt,true);
%>    </td>
    <td align="right"> �������ʱ��</td>
    <td><%=zjxfssj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���Ĵ���</td>
    <td><%=zcdlbm%></td>
    <td align="right">����С��</td>
    <td><%=zcxlbm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">��Ʒ��</td>
    <td width="29%"><%=ppbm%></td>
    <td width="21%" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">��Ӧ��</td>
    <td width="29%"><%=gys%></td>
    <td width="21%" align="right">Ʒ��</td>
    <td width="29%"><%=ppmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="21%" align="right">פ��Ҿӹ���</td>
    <td width="29%"><%=clgw%></td>
    <td width="21%" align="right">չ���Ҿӹ���</td>
    <td width="29%"><%=ztjjgw%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">��ĿרԱ</td>
    <td width="29%"><%=xmzy%></td>
    <td width="21%" align="right">�Ҿ����ʦ</td>
    <td width="29%"><%=jjsjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      ������ԭ��    </td>
    <td width="29%"> <%
	cf.selectItem(out,"select zczjxyybm,zczjxyymc from jdm_zczjxyybm order by zczjxyybm",jc_zczjx_zczjxyybm,true);
%> </td>
    <td width="21%" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      ¼��ʱ��    </td>
    <td width="29%"> <%=jc_zczjx_lrsj%> </td>
    <td width="21%" align="right">¼���� </td>
    <td width="29%"><%=jc_zczjx_lrr%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">��������</td>
    <td width="29%"><%=ddlx%></td>
    <td width="21%" align="right">¼�벿��</td>
    <td width="29%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+jc_zczjx_dwbh+"'",jc_zczjx_dwbh,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">��ע</td>
    <td colspan="3"><%=jc_zczjx_bz%></td>
  </tr>
</table>
<table border="1" width="170%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%" bgcolor="#CCCCCC">ϵ��</td>
	<td  width="7%">��������</td>
	<td  width="5%">�ͺ�</td>
	<td  width="5%">���</td>
	<td  width="3%">ѡ��۸�</td>
	<td  width="3%">����</td>
	<td  width="2%">������λ</td>
	<td  width="3%" >��������</td>
	<td  width="3%" bgcolor="#CC99FF">��������</td>
	<td  width="4%" bgcolor="#CC99FF">�������Ϸ�</td>
	<td  width="4%" bgcolor="#CC99FF">����Զ�̷�</td>
	<td  width="4%" bgcolor="#CC99FF">����������</td>
	<td  width="4%" bgcolor="#CC99FF">�����ϼ�</td>
	<td  width="4%" bgcolor="#CC99FF">�����������</td>
	<td  width="4%">��װλ��</td>
	<td  width="4%">��ɫ</td>
	<td  width="3%">����</td>
	<td  width="3%">��д��־</td>
	<td  width="5%">��д��ͬԭ��</td>
	<td  width="7%">��Ʒ��</td>
	<td  width="3%">���ı���</td>
	<td  width="11%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql ="SELECT zclbbm,zcmc,jc_zcddmx.xinghao,jc_zcddmx.gg,DECODE(xzjg,'0','��д','1','���ۼ�','2','<font color=\"#FF0000\">������</font>') xzjg,TO_CHAR(jc_zcddmx.dj) dj,jc_zcddmx.jldwbm,cxhdbl||'%' cxhdbl,jc_zczjxmx.zjsl,jc_zczjxmx.zjje ,jc_zczjxmx.zjycf,jc_zczjxmx.zjqtfy,(jc_zczjxmx.zjje+jc_zczjxmx.zjycf+jc_zczjxmx.zjqtfy),jc_zczjxmx.zjcxhdje,zcpzwzbm,jc_zcddmx.zcysbm,DECODE(jc_zczjxmx.lx,'1','ԭ��Ŀ','2','����') lx,DECODE(jc_zczjxmx.sxbz,'1','����д','2','��д') sxbz,jc_zcddmx.sxhtyy,jc_zcddmx.dwbh,jc_zcddmx.zcbm,jc_zczjxmx.bz ";
	ls_sql+=" FROM jc_zczjxmx,jc_zcddmx";
    ls_sql+=" where jc_zczjxmx.xh=jc_zcddmx.xh and jc_zczjxmx.zjxbh='"+zjxbh+"'";
    ls_sql+=" order by jc_zczjxmx.lx,jc_zcddmx.zcbm";
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

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.qrr)=="") {
		alert("��ѡ��[������ȷ����]��");
		FormName.qrr.focus();
		return false;
	}
	if(	javaTrim(FormName.qrsj)=="") {
		alert("��ѡ��[������ȷ��ʱ�� ]��");
		FormName.qrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qrsj, "������ȷ��ʱ�� "))) {
		return false;
	}


	FormName.action="SaveSkQrJc_zczjx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
