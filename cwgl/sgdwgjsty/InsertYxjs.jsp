<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE3 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String jsjlh=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String gcjdmc=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String gdjsjd=null;

double wdzgce=0;
double qye=0;

double zqljzjx=0;
double zhljzjx=0;
double cwsfke=0;
double sfke=0;
double sjfkbl=0;//ʵ�ʸ������

double khpck=0;
double yqf=0;
double jsyh=0;

String sksh="";//�����Ƿ���������
String skshStr="";
double fkbl=0;//Ҫ�󸶿����
String yqgcjdmc="";//Ҫ�󹤳̽���

String saveStr="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int sqjl=0;
	ls_sql="select count(*)";
	ls_sql+=" from cw_sgdjssqjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ls_sql+=" and zt='1'";//1��δ�����ѣ�2���Ѳ�����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqjl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (sqjl>0)
	{
		out.println("<BR>�������в�������Ȩ��¼����δ�����ѣ���������Ȩ");
		return;
	}

	ls_sql="select gdjsjd,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,crm_khxx.gcjdbm,gcjdmc,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" ,wdzgce,qye,zqljzjx,zhljzjx,cwsfke,sfke";
	ls_sql+=" from  crm_khxx,sq_dwxx,dm_gcjdbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		zqljzjx=rs.getDouble("zqljzjx");
		zhljzjx=rs.getDouble("zhljzjx");
		cwsfke=rs.getDouble("cwsfke");
		sfke=rs.getDouble("sfke");

		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		gcjdmc=cf.fillNull(rs.getString("gcjdmc"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));


		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();


	String nextzt="";//��һ��������ȱ���
	int bfcs=0;//��������
	ls_sql="select nextzt,bfcs";
	ls_sql+=" from dm_gdjsjd";
	ls_sql+=" where gdjsjd='"+gdjsjd+"' and ztlx='1'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		nextzt=cf.fillNull(rs.getString("nextzt"));//��һ��������ȱ���
		bfcs=rs.getInt("bfcs");//��������
	}
	rs.close();
	ps.close();

	if (!nextzt.equals("X"))//X	�����깤����
	{
		out.println("<BR>���������󣬽�����Ȳ���ȷ");
		saveStr="disabled";
//		return;
	}


	ls_sql="select fkbl,sksh,DECODE(sksh,'Y','�����','N','�������') skshStr,gcjdmc";
	ls_sql+=" from dm_sgdjscsb";
	ls_sql+=" where fgsbh='"+fgsbh+"' and sfwgjs='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkbl=rs.getDouble("fkbl");
		sksh=rs.getString("sksh");
		skshStr=rs.getString("skshStr");
		yqgcjdmc=rs.getString("gcjdmc");
	}
	rs.close();
	ps.close();

	//����Ҫ�󹤳̽���
	int gcjdjc=0;
	ls_sql="select count(*)";
	ls_sql+=" from dm_yqgcjd";
	ls_sql+=" where fgsbh='"+fgsbh+"' and bfcs="+bfcs+" and gcjdbm='"+gcjdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcjdjc=rs.getInt(1);
	}
	rs.close();
	ps.close();
	

	if (gcjdjc==0)
	{
		out.println("<BR>���������̽��ȴ���");
		saveStr="disabled";
//		return;
	}



	ls_sql="select khpck,yqf,jsyh";
	ls_sql+=" from crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khpck=rs.getDouble("khpck");
		yqf=rs.getDouble("yqf");
		jsyh=rs.getDouble("jsyh");
	}
	rs.close();
	ps.close();


	cwgl.Cwgl cwgl=new cwgl.Cwgl();
	double yfkze=cwgl.getAllFkje(khbh);

	if (sksh.equals("Y"))//�����Ƿ���������  Y������ˣ�N���������
	{
		if (cf.round(yfkze*fkbl/100-jsyh-khpck-yqf-cwsfke,2)>100)
		{
			out.println("<BR>���������󣬿ͻ�Ƿ�����100Ԫ�����߲���δ��ˣ����ܽ��㣬������Ȩ��������<P>Ӧ�����ܶ�:"+yfkze+"<BR>�����Ż�:"+jsyh+"���ͻ��⳥��:"+khpck+"�����ڷ�:"+yqf+"<BR>ʵ����:"+cwsfke+"<P>Ƿ��:"+cf.round(yfkze*fkbl/100-jsyh-khpck-yqf-cwsfke,2));
			saveStr="disabled";
	//		return;
		}

		sjfkbl=cf.round(cwsfke*100/(yfkze-jsyh-khpck-yqf),2);
	}
	else{
		if (cf.round(yfkze*fkbl/100-jsyh-khpck-yqf-sfke,2)>100)
		{
			out.println("<BR>���������󣬿ͻ�Ƿ�����100Ԫ�����ܽ��㣬������Ȩ��������<P>Ӧ�����ܶ�:"+yfkze+"<BR>�����Ż�:"+jsyh+"���ͻ��⳥��:"+khpck+"�����ڷ�:"+yqf+"<BR>ʵ����:"+sfke+"<P>Ƿ��:"+cf.round(yfkze*fkbl/100-jsyh-khpck-yqf-sfke,2));
			saveStr="disabled";
	//		return;
		}

		sjfkbl=cf.round(sfke*100/(yfkze-jsyh-khpck-yqf),2);
	}

	int count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_gcfxysjl  ";
    ls_sql+=" where crm_gcfxysjl.khbh='"+khbh+"' and crm_gcfxysjl.ysjg='2' ";//'1','�ϸ�','2','���ϸ�'
	ls_sql+=" order by crm_gcfxysjl.ysjlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("<BR>��������������δͨ�������ܲ�����");
		return;
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�����Ѽ�¼��</td>
	<td  width="8%">�����Ѵ���</td>
	<td  width="7%">��������</td>
	<td  width="7%">��ͬ���</td>
	<td  width="6%">��������</td>
	<td  width="8%">�������</td>
	<td  width="7%">��������ܶ�</td>
	<td  width="4%">�������</td>
	<td  width="7%">������</td>
	<td  width="5%">���Ϸ�</td>
	<td  width="5%">������Ʒ</td>
	<td  width="7%">ʵ�ʲ���</td>
	<td  width="5%">¼����</td>
	<td  width="54%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_sgdbgfty.jsjlh,gdjsjdmc,cw_sgdbgfty.jsrq,TO_CHAR(cw_sgdbgfty.htje),TO_CHAR(cw_sgdbgfty.zjxje), DECODE(cw_sgdbgfty.jsjs,'1','���̷�','2','���̷ѣ�������','3','ʵ�տ��ܶ�','4','һ�ڿ�','5','���ڿ�','6','���ڿ�','7','���̻�������','8','���̻������ۣ������ѻ�������','9','���¹���ʩ���ɱ���','A','���¹���ʩ���ɱ��ۣ�������ʩ���ɱ�','D','��ͬ����ʩ���ɱ���','E','��ͬ����ʩ���ɱ��ۣ�������ʩ���ɱ�','B','���̳ɱ���','C','���̳ɱ��ۣ������ѳɱ�'),TO_CHAR(cw_sgdbgfty.jsjsze),cw_sgdbgfty.jsbl||'%',TO_CHAR(cw_sgdbgfty.jsje),TO_CHAR(cw_sgdbgfty.clf),TO_CHAR(cw_sgdbgfty.gdyp),cw_sgdbgfty.sjbk,cw_sgdbgfty.lrr,cw_sgdbgfty.bz  ";
	ls_sql+=" FROM cw_sgdbgfty,dm_gdjsjd  ";
    ls_sql+=" where cw_sgdbgfty.gdjsjd=dm_gdjsjd.gdjsjd(+) ";
    ls_sql+=" and cw_sgdbgfty.khbh='"+khbh+"'";
    ls_sql+=" order by cw_sgdbgfty.lrsj";
    pageObj.sql=ls_sql;
	pageObj.initPage("Cw_sgdbgftyCxList.jsp","","","");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>

<form method="post" action="SaveInsertYxjs.jsp" name="insertform">
<div align="center">ʩ�����깤����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><font color="#0000FF">�ͻ����</font> </td>
    <td width="32%"><%=khbh%> </td>
    <td width="18%" align="right"><font color="#0000FF">��ͬ��</font> </td>
    <td width="32%"><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ�����</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">�ʼ�����</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ʩ����</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','���ѳ�����','N','')||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">ʩ������</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ܼ�</span></td>
    <td><%=gj%></td>
    <td align="right"><span class="STYLE2">����</span></td>
    <td><%=dd%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ʦ</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">ǩԼ����</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ͻ�����</span></td>
    <td><%=khjl%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ǩԼ����</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><font color="#0000FF">���齻������</font></td>
    <td><%=jyjdrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center">��������</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">Ҫ�󸶿����</td>
    <td><%=fkbl%>%</td>
    <td align="right">�����Ƿ���������</td>
    <td><%=skshStr%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">Ҫ�󹤳̽���</td>
    <td colspan="3"><%=yqgcjdmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���̽���</td>
    <td><%=gcjdmc%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ǩԼ��</td>
    <td><%=qye%></td>
    <td align="right">�������</td>
    <td><%=sjfkbl%>%</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�����տ�</td>
    <td><%=cwsfke%></td>
    <td align="right">�����񣫵��棩�տ�</td>
    <td><%=sfke%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#E8E8FF">
	<input type="button" onClick="window.open('/dzbj/dybj.jsp?khbh=<%=khbh%>')" value="���ӱ���">
      <input type="button" onClick="window.open('/khxx/Crm_gcfxysjlCxList.jsp?khbh=<%=khbh%>')"  value="���ռ�¼">
      <input type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="������Ϣ">
      <input type="button" onClick="window.open('/khxx/Jxc_clpsdCxList.jsp?khbh=<%=khbh%>')"  value="���ϵ�"></td>
  </tr>
    <tr align="center"> 
      <td height="65" colspan="4"> 
	  <input type="hidden" name="khbh" value="<%=khbh%>" >
	<input type="button"  value="�������" onClick="f_do(insertform)" <%=saveStr%>></td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
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
