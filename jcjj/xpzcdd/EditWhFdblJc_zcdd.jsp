<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zdyhbz=(String)session.getAttribute("zdyhbz");

String khbh=null;
String clgw=null;
String ztjjgw=null;
String jkxz=null;
String jkdd=null;
String ddshbz=null;
String kjxsj=null;
String xclbz=null;
String htshsj=null;
String xmzy=null;
String qhtsj=null;
String jhclsj=null;
String hkze=null;
String jhtzshsj=null;
String bz=null;
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
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
String dmbh=null;
String dwmc=null;
String cxhdbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String zcxlbm=null;
String ppbm=null;
double jmje=0;

double zcyfk=0;
double mmyfk=0;
double cgyfk=0;
double jjyfk=0;

String sqdj="";
String wdzje=null;
String htcxhdje=null;
String jjsjs="";

String lrsj=null;
String sfyyh=null;
String yhkssj=null;
String yhjzsj=null;
String yhnr=null;
String dzyy=null;

double khfdbl=0;
double fdbl=0;
double tcjrbl=0;
double tjpkhfdbl=0;
double tjpfdbl=0;
double tjptcjrbl=0;
double azfjsbl=0;
double ycfjsbl=0;

double zczkl=0;
String listSql="";

String djlrfs="";//���Ķ�������¼�뷽ʽ  1��¼�뵥�����ۿۣ�2��¼���ۿ��㵥�ۣ�3�����ɴ���
String kgcxhdbl="";//���Ķ����Ƿ�ɸĴ��������  Y���ɸģ�N�����ɸ�
String dgkh=null;
String xshth=null;
String sfjs="";

try {
	conn=cf.getConnection();

	ls_sql="select sfjs,tcjrbl,khfdbl,fdbl,tjptcjrbl,tjpkhfdbl,tjpfdbl,xshth,jmje,dzyy,lrsj,sfyyh,yhkssj,yhjzsj,yhnr,zczkl,jjsjs,htcxhdje,wdzje,zcdlbm,zcxlbm,ppbm,khbh,clgw,ztjjgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz,hkze,jhtzshsj ";
	ls_sql+=" ,azfjsbl,ycfjsbl";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfjs=cf.fillNull(rs.getString("sfjs"));
		azfjsbl=rs.getDouble("azfjsbl");
		ycfjsbl=rs.getDouble("ycfjsbl");

		tcjrbl=rs.getDouble("tcjrbl");
		khfdbl=rs.getDouble("khfdbl");
		fdbl=rs.getDouble("fdbl");
		tjptcjrbl=rs.getDouble("tjptcjrbl");
		tjpkhfdbl=rs.getDouble("tjpkhfdbl");
		tjpfdbl=rs.getDouble("tjpfdbl");

		xshth=cf.fillNull(rs.getString("xshth"));
		jmje=rs.getDouble("jmje");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=cf.fillNull(rs.getDate("yhkssj"));
		yhjzsj=cf.fillNull(rs.getDate("yhjzsj"));
		yhnr=cf.fillNull(rs.getString("yhnr"));
		zczkl=rs.getDouble("zczkl");

		jjsjs=cf.fillNull(rs.getString("jjsjs"));
		htcxhdje=cf.fillNull(rs.getString("htcxhdje"));
		wdzje=cf.fillNull(rs.getString("wdzje"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
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
		hkze=cf.fillNull(rs.getString("hkze"));
		jhtzshsj=cf.fillNull(rs.getDate("jhtzshsj"));
	}
	rs.close();
	ps.close();

	if (!sfjs.equals("N") && !sfjs.equals("C") && !sfjs.equals("P"))//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�P���������
	{
		out.println("�����ѽ��㣬�����޸�");
		return;
	}


	ls_sql="select dgkh,khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dgkh=cf.fillNull(rs.getString("dgkh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		dmbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();


	ls_sql="select djlrfs,kgcxhdbl";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djlrfs=cf.fillNull(rs.getString("djlrfs"));
		kgcxhdbl=cf.fillNull(rs.getString("kgcxhdbl"));
	}
	rs.close();
	ps.close();

	//Ԥ����
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='62'";//62������Ԥ���63��ľ��Ԥ���64������Ԥ���65���Ҿ�Ԥ����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='63'";//62������Ԥ���63��ľ��Ԥ���64������Ԥ���65���Ҿ�Ԥ����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='64'";//62������Ԥ���63��ľ��Ԥ���64������Ԥ���65���Ҿ�Ԥ����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='65'";//62������Ԥ���63��ľ��Ԥ���64������Ԥ���65���Ҿ�Ԥ����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jc_zczjx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
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
		%>
		<BR>
		<div align="center"><font color="#FF0033"><b>���󣡱������ѷ�����������������޸�</b></font> 
		
		<%
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">ά�����������������ţ�<%=ddbh%>��</div> 
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform"  >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#CCCCFF"> 
                �ͻ����              </td>
              <td width="29%" bgcolor="#CCCCFF"> <%=khbh%> </td>
              <td width="21%" align="right" bgcolor="#CCCCFF"> 
                ��ͬ��              </td>
              <td width="29%" bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right">�ͻ�����</td>
              <td width="29%"><%=khxm%></td>
              <td width="21%" align="right">�ʼ�</td>
              <td width="29%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right">���ݵ�ַ</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr> 
              <td width="21%" bgcolor="#CCCCFF" align="right">ǩԼ����</td>
              <td width="29%" bgcolor="#CCCCFF"><%=dwmc%></td>
              <td width="21%" bgcolor="#CCCCFF" align="right">��װ���ʦ</td>
              <td width="29%" bgcolor="#CCCCFF"><%=sjs%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right"> 
                ʩ����              </td>
              <td width="29%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
              <td width="21%" align="right"> 
                �೤              </td>
              <td width="29%"><%=sgbz%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right"> 
                ��װǩԼ����              </td>
              <td width="29%"> <%=qyrq%> </td>
              <td width="21%" align="right"> 
                ��װǩԼ��              </td>
              <td width="29%"><%=qye%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right">��ͬ��������</td>
              <td width="29%"><%=kgrq%></td>
              <td width="21%" align="right">��ͬ��������</td>
              <td width="29%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="21%" align="right">�μӴ����</td>
              <td width="29%"> <%=cxhdbm%> </td>
              <td width="21%" align="right">&nbsp;</td>
              <td width="29%">&nbsp;</td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="21%" align="right"><b>����Ԥ����</b></td>
              <td width="29%"><%=zcyfk%></td>
              <td width="21%" align="right">&nbsp;</td>
              <td width="29%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td bgcolor="#FFFFFF" align="right"><font color="#0000FF">���Ĵ���</font></td>
              <td><%=zcdlbm%>             </td><td align="right"><font color="#0000FF">����С��</font></td>
                <td><%=zcxlbm%>           </td></tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��Ʒ��</font></td>
              <td><%=ppbm%>            </td><td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��������</font></td>
              <td bgcolor="#FFFFFF"><%=qhtsj%></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��ͬ�ͻ�ʱ��</font></td>
              <td bgcolor="#FFFFFF"><%=htshsj%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��������</font></td>
              <td bgcolor="#FFFFFF"><%=dgkh%></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">���ۺ�ͬ��</font></td>
              <td bgcolor="#FFFFFF"><%=xshth%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��ͬ�ܶ�</font></td>
              <td bgcolor="#FFFFFF"><%=wdzje%></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">פ��Ҿӹ��� </font></td>
              <td bgcolor="#FFFFFF"><%=clgw%></td>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>��װ�ѽ������</td>
              <td><input name="azfjsbl" type="text" value="<%=azfjsbl%>" size="10" maxlength="20"  >
                %</td>
              <td align="right"><font color="#FF0000">*</font>Զ�̷ѽ������</td>
              <td><input name="ycfjsbl" type="text" value="<%=ycfjsbl%>" size="10" maxlength="20"  >
                %</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>����Ʒ���̽������</td>
              <td><input type="text" name="fdbl" value="<%=fdbl%>" size="10" maxlength="20"  >
              %</td>
              <td align="right"><font color="#FF0000">*</font>�ؼ�Ʒ���̽������</td>
              <td><input type="text" name="tjpfdbl" value="<%=tjpfdbl%>" size="10" maxlength="20"  >
                %</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>����Ʒ�ͻ��������</td>
              <td><input type="text" name="khfdbl" value="<%=khfdbl%>" size="10" maxlength="20" >
%</td>
              <td align="right"><font color="#FF0000">*</font>�ؼ�Ʒ�ͻ��������</td>
              <td><input type="text" name="tjpkhfdbl" value="<%=tjpkhfdbl%>" size="10" maxlength="20" >
                %</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>����Ʒ��ɼ������</td>
              <td><input type="text" name="tcjrbl" value="<%=tcjrbl%>" size="10" maxlength="20"  >
                %</td>
              <td align="right"><font color="#FF0000">*</font>�ؼ�Ʒ��ɼ������</td>
              <td><input type="text" name="tjptcjrbl" value="<%=tjptcjrbl%>" size="10" maxlength="20"  >
                %</td>
            </tr>
            
            
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center">
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                  <input type="button" value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                </div>              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
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

	if(	javaTrim(FormName.fdbl)=="") {
		alert("������[����Ʒ���̽������]��");
		FormName.fdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.fdbl, "����Ʒ���̽������"))) {
		return false;
	}
	if(	parseFloat(FormName.fdbl.value)<0 || parseFloat(FormName.fdbl.value)>100) {
		alert("����[����Ʒ���̽������]Ӧ��0��100֮��");
		FormName.fdbl.select();
		return false;
	}

	if(	javaTrim(FormName.khfdbl)=="") {
		alert("������[����Ʒ�ͻ��������]��");
		FormName.khfdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khfdbl, "����Ʒ�ͻ��������"))) {
		return false;
	}
	if(	parseFloat(FormName.khfdbl.value)<0 || parseFloat(FormName.khfdbl.value)>100) {
		alert("����[����Ʒ�ͻ��������]Ӧ��0��100֮��");
		FormName.khfdbl.select();
		return false;
	}
	if(	javaTrim(FormName.tcjrbl)=="") {
		alert("������[����Ʒ��ɼ������]��");
		FormName.tcjrbl.focus();
		return false;
	}
	if(!(isFloat(FormName.tcjrbl, "����Ʒ��ɼ������"))) {
		return false;
	}
	if(	parseFloat(FormName.tcjrbl.value)<0 || parseFloat(FormName.tcjrbl.value)>100) {
		alert("����[����Ʒ��ɼ������]Ӧ��0��100֮��");
		FormName.tcjrbl.select();
		return false;
	}

	if(	javaTrim(FormName.tjpfdbl)=="") {
		alert("������[�ؼ�Ʒ���̽������]��");
		FormName.tjpfdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.tjpfdbl, "�ؼ�Ʒ���̽������"))) {
		return false;
	}
	if(	parseFloat(FormName.tjpfdbl.value)<0 || parseFloat(FormName.tjpfdbl.value)>100) {
		alert("����[�ؼ�Ʒ���̽������]Ӧ��0��100֮��");
		FormName.tjpfdbl.select();
		return false;
	}

	if(	javaTrim(FormName.tjpkhfdbl)=="") {
		alert("������[�ؼ�Ʒ�ͻ��������]��");
		FormName.tjpkhfdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.tjpkhfdbl, "�ؼ�Ʒ�ͻ��������"))) {
		return false;
	}
	if(	parseFloat(FormName.tjpkhfdbl.value)<0 || parseFloat(FormName.tjpkhfdbl.value)>100) {
		alert("����[�ؼ�Ʒ�ͻ��������]Ӧ��0��100֮��");
		FormName.tjpkhfdbl.select();
		return false;
	}
	if(	javaTrim(FormName.tjptcjrbl)=="") {
		alert("������[�ؼ�Ʒ��ɼ������]��");
		FormName.tjptcjrbl.focus();
		return false;
	}
	if(!(isFloat(FormName.tjptcjrbl, "�ؼ�Ʒ��ɼ������"))) {
		return false;
	}
	if(	parseFloat(FormName.tjptcjrbl.value)<0 || parseFloat(FormName.tjptcjrbl.value)>100) {
		alert("����[�ؼ�Ʒ��ɼ������]Ӧ��0��100֮��");
		FormName.tjptcjrbl.select();
		return false;
	}
	if(	javaTrim(FormName.azfjsbl)=="") {
		alert("������[��װ�ѽ������]��");
		FormName.azfjsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.azfjsbl, "��װ�ѽ������"))) {
		return false;
	}
	if(	parseFloat(FormName.azfjsbl.value)<0 || parseFloat(FormName.azfjsbl.value)>100) {
		alert("����[��װ�ѽ������]Ӧ��0��100֮��");
		FormName.azfjsbl.select();
		return false;
	}

	if(	javaTrim(FormName.ycfjsbl)=="") {
		alert("������[Զ�̷ѽ������]��");
		FormName.ycfjsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.ycfjsbl, "Զ�̷ѽ������"))) {
		return false;
	}
	if(	parseFloat(FormName.ycfjsbl.value)<0 || parseFloat(FormName.ycfjsbl.value)>100) {
		alert("����[Զ�̷ѽ������]Ӧ��0��100֮��");
		FormName.ycfjsbl.select();
		return false;
	}


	FormName.action="SaveEditWhFdblJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
