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
int jzkfkcs=0;
double cwsfke=0;
double sfke=0;
double qye=0;
double sjfkbl=0;//ʵ�ʸ������

String nextzt="";//��һ��������ȱ���
int bfcs=0;//��������

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

	ls_sql="select qye,sfke,cwsfke,jzkfkcs,gdjsjd,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,crm_khxx.gcjdbm,gcjdmc,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_dwxx,dm_gcjdbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qye=rs.getDouble("qye");
		sfke=rs.getDouble("sfke");
		cwsfke=rs.getDouble("cwsfke");
		jzkfkcs=rs.getInt("jzkfkcs");
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		gcjdmc=cf.fillNull(rs.getString("gcjdmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));


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
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));


		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5���ͻ���᣻7����ͬ�쳣��ֹ
	if (gcjdbm.equals("4"))
	{
		out.println("<BR>���������󣬹����깤");
		return;
	}
	else if (gcjdbm.equals("5"))
	{
		out.println("<BR>���������󣬿ͻ����");
		return;
	}
	else if (gcjdbm.equals("7"))
	{
		out.println("<BR>���������󣬺�ͬ�쳣��ֹ");
		return;
	}

	if (sgd.equals(""))
	{
		out.println("<BR>����������δ�ɵ�");
		return;
	}

	int ztjc=0;
	ls_sql="select count(*)";
	ls_sql+=" from dm_gdjsjd";
	ls_sql+=" where gdjsjd='"+gdjsjd+"' and ztlx='1'";//1����Ȩ��2�������ѣ�3�����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ztjc=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (ztjc==0)
	{
		out.println("����״̬����ȷ");
		return;
	}

	ls_sql="select nextzt,bfcs";
	ls_sql+=" from dm_gdjsjd";
	ls_sql+=" where gdjsjd='"+gdjsjd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		nextzt=cf.fillNull(rs.getString("nextzt"));//��һ��������ȱ���
		bfcs=rs.getInt("bfcs");//��������
	}
	rs.close();
	ps.close();


	ls_sql="select fkbl,sksh,DECODE(sksh,'Y','�����','N','�������') skshStr,gcjdmc";
	ls_sql+=" from dm_sgdjscsb";
	ls_sql+=" where fgsbh='"+fgsbh+"' and bfcs="+bfcs;
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

	cwgl.Cwgl cwgl=new cwgl.Cwgl();
	double fkze=cwgl.getAllFkje(khbh);//��ȡӦ�����ܽ��

	if (sksh.equals("Y"))//�����Ƿ���������  Y������ˣ�N���������
	{
		if (cwsfke+1<cf.round(fkze*fkbl/100,2))
		{
			out.println("<BR>���������󣬸���㣬���߲���δ��ˣ����Ӧ����:"+cf.round(fkze*fkbl/100,2)+"��ʵ��֧��:"+cwsfke);
			saveStr="disabled";
//			return;
		}

		sjfkbl=cf.round(cwsfke*100/fkze,2);
	}
	else {
		if (sfke+1<cf.round(fkze*fkbl/100,2))
		{
			out.println("<BR>���������󣬸���㣬���Ӧ����:"+cf.round(fkze*fkbl/100,2)+"��ʵ��֧��:"+sfke);
			saveStr="disabled";
//			return;
		}

		sjfkbl=cf.round(sfke*100/fkze,2);
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
<form method="post" action="SaveInsertYxBgf.jsp" name="insertform">
<div align="center">ʩ���Ӳ�����</div>

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

	ls_sql="SELECT cw_sgdbgfty.jsjlh,gdjsjdmc,cw_sgdbgfty.jsrq,cw_sgdbgfty.htje,cw_sgdbgfty.zjxje, DECODE(cw_sgdbgfty.jsjs,'1','���̷�','2','���̷ѣ�������','3','ʵ�տ��ܶ�','4','һ�ڿ�','5','���ڿ�','6','���ڿ�','7','���̻�������','8','���̻������ۣ������ѻ�������','9','���¹���ʩ���ɱ���','A','���¹���ʩ���ɱ��ۣ�������ʩ���ɱ�','D','��ͬ����ʩ���ɱ���','E','��ͬ����ʩ���ɱ��ۣ�������ʩ���ɱ�','B','���̳ɱ���','C','���̳ɱ��ۣ������ѳɱ�'),cw_sgdbgfty.jsjsze,cw_sgdbgfty.jsbl||'%',cw_sgdbgfty.jsje,cw_sgdbgfty.clf,cw_sgdbgfty.gdyp,cw_sgdbgfty.sjbk,cw_sgdbgfty.lrr,cw_sgdbgfty.bz  ";
	ls_sql+=" FROM cw_sgdbgfty,dm_gdjsjd  ";
    ls_sql+=" where cw_sgdbgfty.gdjsjd=dm_gdjsjd.gdjsjd(+) ";
    ls_sql+=" and cw_sgdbgfty.khbh='"+khbh+"'";
    ls_sql+=" order by cw_sgdbgfty.lrsj";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#E8E8FF">
    <td colspan="4" align="center"  >
	<input type="button" onClick="window.open('/dzbj/dybj.jsp?khbh=<%=khbh%>')" value="���ӱ���">
      <input type="button" onClick="window.open('/khxx/Crm_gcfxysjlCxList.jsp?khbh=<%=khbh%>')"  value="���ռ�¼">
      <input type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="������Ϣ">
      <input type="button" onClick="window.open('/khxx/Jxc_clpsdCxList.jsp?khbh=<%=khbh%>')"  value="���ϵ�"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><font color="#0000FF">�ͻ����</font> </td>
    <td width="32%"><%=khbh%> </td>
    <td width="18%" align="right"><font color="#0000FF">��ͬ��</font> </td>
    <td width="32%"><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">�ͻ�����</font> </td>
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
  <tr bgcolor="#E8E8FF">
    <td colspan="4" align="right">&nbsp;</td>
  </tr>
  <tr bgcolor="#E8E8FF">
      <td colspan="2" align="right"><span class="STYLE1">*</span>���Բ�����
        <select name="gdjsjd" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd where gdjsjd='"+nextzt+"'",nextzt);
%>
        </select></td>
      <td colspan="2"><input type="hidden" name="khbh" value="<%=khbh%>" >
        <input name="button" type="button" onClick="f_do(insertform)"  value="������������" <%=saveStr%>></td>
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
	if(	javaTrim(FormName.gdjsjd)=="") {
		alert("������[���Բ�����]��");
		FormName.gdjsjd.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
