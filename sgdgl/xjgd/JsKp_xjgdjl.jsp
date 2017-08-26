<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String xjjlh=null;
String khbh=null;
String xjr=null;
String xjsj=null;
String xjlxbm=null;
String xjjgbm=null;
double fkze=0;
double kfzs=0;
double kcjdebl=0;
String lrr=null;
String lrsj=null;
String bz=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sjs=null;
String sgd=null;
String zjxm=null;
String sgbz=null;

String zgjlh=cf.GB2Uni(request.getParameter("zgjlh"));
String zgcljlh = null;
int count = 0;
String zgxm = null;
String yqjjsj = null;
String zgsm = null;
String fkbmmc = null;
String fkbmjsr = null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	
	ls_sql="select xjjlh,zgxm,yqjjsj,zgsm,dwmc,fkbmjsr";
	ls_sql+=" from  kp_zggdmx,sq_dwxx";
	ls_sql+=" where  kp_zggdmx.fkbm=sq_dwxx.dwbh";
	ls_sql+=" and zgjlh='"+zgjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xjjlh=cf.fillNull(rs.getString(1));
		zgxm=cf.fillNull(rs.getString(2));
		yqjjsj=cf.fillNull(rs.getDate(3));
		zgsm=cf.fillNull(rs.getString(4));
		fkbmmc=cf.fillNull(rs.getString("dwmc"));
		fkbmjsr=cf.fillNull(rs.getString("fkbmjsr"));
	}
	rs.close();
	ps.close();

	ls_sql="select xjjlh,khbh,xjr,xjsj,xjlxbm,xjjgbm,fkze,kcjdebl,kfzs,kcjdebl,lrr,lrsj,kp_xjgdjl.bz ,sgdmc";
	ls_sql+=" from  kp_xjgdjl,sq_sgd";
	ls_sql+=" where kp_xjgdjl.sgd=sq_sgd.sgd(+) and  (xjjlh='"+xjjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xjjlh=cf.fillNull(rs.getString("xjjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		xjr=cf.fillNull(rs.getString("xjr"));
		xjsj=cf.fillNull(rs.getDate("xjsj"));
		xjlxbm=cf.fillNull(rs.getString("xjlxbm"));
		xjjgbm=cf.fillNull(rs.getString("xjjgbm"));
		fkze=rs.getDouble("fkze");
		kfzs=rs.getDouble("kfzs");
		kcjdebl=rs.getDouble("kcjdebl");
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		sgd=cf.fillNull(rs.getString("sgdmc"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sjs,zjxm,sgbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
	}
	rs.close();
	ps.close();
	
	ls_sql="select NVL(max(substr(zgcljlh,13,3)),0)";
	ls_sql+=" from  kp_zgclgdmx";
	ls_sql+=" where zgjlh='"+zgjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	zgcljlh=zgjlh+cf.addZero(count+1,3);

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
<title>�������⣭����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">���Ĵ����¼��</td>
	<td  width="8%">����</td>
	<td  width="8%">������</td>
	<td  width="8%">������</td>
	<td  width="10%">����ʱ��</td>
	<td  width="56%">����˵��</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT zgcljlh,lx,DECODE(cljg,'1','δ����','2','����','3','�ڴ���','4','�ѽ��','5','����ͨ��','6','����δͨ��') ,clr,clsj,clsm";
	ls_sql+=" FROM kp_zgclgdmx";
    ls_sql+=" where zgjlh='"+zgjlh+"'";
    ls_sql+=" order by zgcljlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>


<form method="post" action="SaveJsKp_xjgdjl.jsp" name="editform" >
<div align="center">�������⣭����(�����¼��:<%=zgcljlh%>)</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"> 
		<font color="#000099">�ͻ����</font>              </td>
	  <td width="32%"><%=khbh%> </td>
	  <td width="18%" align="right"> 
		<font color="#000099">ʵ��������</font>              </td>
	  <td width="32%"><%=sjkgrq%> </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"><font color="#000099">�ͻ�����</font></td>
	  <td width="32%"><%=khxm%></td>
	  <td width="18%" align="right"><font color="#000099">��ϵ��ʽ</font></td>
	  <td width="32%"><input type="button" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" value="�鿴�绰" ></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"><font color="#000099">���ݵ�ַ</font></td>
	  <td colspan="3"><%=fwdz%></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"><font color="#000099">���ʦ</font></td>
	  <td width="32%"><%=sjs%></td>
	  <td width="18%" align="right"><font color="#000099">ʩ����</font></td>
	  <td width="32%"><%=sgd%></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"><font color="#000099">�ʼ�����</font></td>
	  <td width="32%"><%=zjxm%></td>
	  <td width="18%" align="right"><font color="#000099">ʩ������</font></td>
	  <td width="32%"><%=sgbz%></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td colspan="4" align="right" bgcolor="#CCCCCC"><font color="#CCCCCC">&nbsp;</font></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">����¼��</td>
	  <td><%=xjjlh%></td>
	  <td align="right">���ļ�¼��</td>
	  <td><%=zgjlh%></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right">�����              </td>
	  <td width="32%"> <%=xjr%> </td>
	  <td width="18%" align="right"> 
		���ʱ��              </td>
	  <td width="32%"> <%=xjsj%> </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"> 
		�������              </td>
	  <td width="32%"> <%
cf.selectItem(out,"select xjlxbm,xjlxmc from kp_xjlxbm order by xjlxbm",xjlxbm,true);
%> </td>
	  <td width="18%" align="right"> 
		�����              </td>
	  <td width="32%"><%
cf.selectItem(out,"select xjjgbm,xjjgmc from dm_xjjgbm order by xjjgbm",xjjgbm,true);
%></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"> ¼���� </td>
	  <td><%=lrr%> </td>
	  <td align="right"> ¼��ʱ�� </td>
	  <td><%=lrsj%> </td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">��ע</td>
	  <td colspan="3"><%=bz%> </td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td colspan="4" align="right" bgcolor="#CCCCCC"><font color="#CCCCCC">&nbsp;</font></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td align="right">������Ƭ</td>
	  <td ><input type="button" onClick="window.open('viewAllPhoto.jsp?xjjlh=<%=xjjlh%>')" value="�鿴��Ƭ" ></td>
	  <td width="18%" align="right">Ҫ����ʱ��</td>
	  <td width="32%"> 
		<%=yqjjsj%>              </td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">������Ŀ</td>
	  <td colspan="3"><%=zgxm%></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td align="right">����˵��</td>
	  <td colspan="3"> <%=zgsm%></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">��������</td>
	  <td><%=fkbmmc%></td>
	  <td align="right">�������Ž�����</td>
	  <td><%=fkbmjsr%></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td colspan="4" align="right" bgcolor="#CCCCCC"><font color="#CCCCCC">&nbsp;</font></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"> 
		<font color="#FF0000">*</font>������              </td>
	  <td width="32%"> 
		<input type="text" name="jsr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>              </td>
	  <td width="18%" align="right"> 
		<font color="#FF0000">*</font>����ʱ��              </td>
	  <td width="32%"> 
		<input type="text" name="jssj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>              </td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right">����˵��</td>
	  <td colspan="3"> 
		<textarea name="jsyj" cols="71" rows="4"></textarea>              </td>
	</tr>
	<tr> 
	  <td colspan="4" align="center"> 
		<div align="center"> 
			<input type="hidden" name="zgcljlh"  value="<%=zgcljlh%>" >
			<input type="hidden" name="zgjlh"  value="<%=zgjlh%>" >
			<input type="hidden" name="xjjlh"  value="<%=xjjlh%>" >
		  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����"></td>
	</tr>
</table>
</form>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">���ļ�¼��</td>
	<td  width="6%">����״̬</td>
	<td  width="7%">Ҫ����</td>
	<td  width="10%">��������</td>
	<td  width="5%">������</td>
	<td  width="20%">������Ŀ</td>
	<td  width="32%">����˵��</td>
	<td  width="5%">������</td>
	<td  width="7%">����ʱ��</td>
</tr>
<%
	ls_sql="SELECT kp_zggdmx.zgjlh, DECODE(kp_zggdmx.clzt,'1','δ����','2','����','3','�ڴ���','4','�ѽ��','5','����ͨ��','6','����δͨ��') as clzt,kp_zggdmx.yqjjsj,dwmc,kp_zggdmx.fkbmjsr,kp_zggdmx.zgxm,kp_zggdmx.zgsm,kp_zggdmx.ysr,kp_zggdmx.yssj";
	ls_sql+=" FROM kp_zggdmx,sq_dwxx  ";
    ls_sql+=" where kp_zggdmx.fkbm=sq_dwxx.dwbh(+) ";
    ls_sql+=" and kp_zggdmx.xjjlh='"+xjjlh+"'";
    ls_sql+=" order by kp_zggdmx.zgjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

	  

</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jsr)=="") {
		alert("������[������]��");
		FormName.jsr.focus();
		return false;
	}
	if(	javaTrim(FormName.jssj)=="") {
		alert("������[����ʱ��]��");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
