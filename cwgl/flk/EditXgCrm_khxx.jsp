<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String jlh=cf.GB2Uni(request.getParameter("jlh"));

String khbh=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String gdjsjd=null;
String bz=null;
String bjjb=null;
String bjjbmc=null;
double clf=0;
double sgebfb=0;
int fwmj=0;
String kgzsm=null;
String clfStr=null;
String sgebfbStr=null;
String kgzbz=null;

double zqgczjf=0;
double zjxje=0;

double ysglk=0;
double cfje=0;
double zccz=0;
double fwmjcz=0;
double clfbfb=0;
String czkh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khbh,clfbfb,czkh,clf,cfje,fwmjcz,zccz,ysglk";
	ls_sql+=" from cw_cflkjl";
	ls_sql+=" where jlh='"+jlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		clfbfb=rs.getDouble("clfbfb");
		czkh=cf.fillNull(rs.getString("czkh"));
		clf=rs.getDouble("clf");
		cfje=rs.getDouble("cfje");
		fwmjcz=rs.getDouble("fwmjcz");
		zccz=rs.getDouble("zccz");
		ysglk=rs.getDouble("ysglk");
	}
	rs.close();
	ps.close();


	ls_sql="select kgzbz,gdjsjd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sgd,sgbz,zjxm,crm_khxx.bz";
	ls_sql+=" ,zqgczjf,zjxje,crm_khxx.bjjb,bjjbmc,clf,sgebfb,kgzsm,fwmj";
	ls_sql+=" from  crm_khxx,sq_dwxx,bdm_bjjbbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kgzbz=cf.fillNull(rs.getString("kgzbz"));
		zqgczjf=rs.getDouble("zqgczjf");
		zjxje=rs.getDouble("zjxje");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		sgebfb=rs.getDouble("sgebfb");
		kgzsm=cf.fillNull(rs.getString("kgzsm"));
		fwmj=rs.getInt("fwmj");

		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));

		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		bz=cf.fillHtml(rs.getString("bz"));

	}
	rs.close();
	ps.close();

	if (kgzbz.equals("N"))
	{
		out.println("����δ�忨");
		return;
	}



}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
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

<html>
<head>
<title>���Ͽ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center"><strong>�帨�Ͽ�����¼�ţ�<%=jlh%>��</strong>(����)</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">�ͻ����</font> </td>
              <td><%=khbh%> </td>
              <td align="right"><font color="#0000FF">��ͬ��</font> </td>
              <td><%=hth%> </td>
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
              <td align="right"><font color="#0000FF">���ʦ</font> </td>
              <td><%=sjs%> </td>
              <td align="right"><font color="#0000FF">ǩԼ����</font> </td>
              <td><%=dwmc%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">ǩԼ����</font></td>
              <td><%=qyrq%> </td>
              <td align="right" bgcolor="#FFFFFF">���ۼ���</td>
              <td><%=bjjbmc%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">��ͬ��������</font></td>
              <td><%=kgrq%> </td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��ͬ��������</font></td>
              <td><%=jgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">ʵ�ʿ�������</font></td>
              <td><%=sjkgrq%> </td>
              <td align="right"><font color="#0000FF">ʵ�ʿ�������</font></td>
              <td><%=sjjgrq%> </td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">��ע</font></td>
              <td colspan="3" bgcolor="#FFFFFF"> <%=bz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCFFCC"><font color="#0000FF"><span class="STYLE6">Ԥ�㹤�Ͽ�</span></font></td>
              <td bgcolor="#CCFFCC"><%=ysglk%></td>
              <td align="right" bgcolor="#CCFFCC">&nbsp;</td>
              <td bgcolor="#CCFFCC">&nbsp;</td>
            </tr>
           
            <tr>
              <td align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font>���ϷѰٷֱ�</td>
              <td bgcolor="#CCFFCC"><input type="text" name="sgebfb" size="8" maxlength="10"  value="<%=clfbfb%>" onChange="calValue(editform)">
%</td>
              <td align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font><font color="#0000FF">���Ϸ�</font></td>
              <td bgcolor="#CCFFCC"><input type="text" name="clf" size="20" maxlength="10"  value="<%=clf%>" readonly></td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font>��ֵ����</td>
              <td width="31%" bgcolor="#CCFFCC"> 
                <p>
                  <input name="czkh" type="text" value="<%=czkh%>" size="20" maxlength="10" >
              </p>              </td>
              <td width="18%" align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font><font color="#0000FF">������</font></td>
              <td width="33%" bgcolor="#CCFFCC"><input type="text" name="cfje" size="20" maxlength="10"  value="<%=cf.round(cfje,0)%>" readonly></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font><font color="#0000FF">�������</font></td>
              <td bgcolor="#CCFFCC"><input name="fwmj" type="text" value="<%=fwmj%>" size="20" maxlength="10" readonly></td>
              <td align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font><font color="#0000FF">�������</font></td>
              <td bgcolor="#CCFFCC"><input name="fwmjcz" type="text" value="<%=cf.round(fwmjcz,0)%>" size="20" maxlength="10" readonly></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font><font color="#0000FF">�����ײ����ĳ�ֵ</font></td>
              <td bgcolor="#CCFFCC"><input name="zccz" type="text" value="<%=cf.round(zccz,0)%>" size="20" maxlength="10" readonly></td>
              <td align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font><font color="#0000FF">��ֵ�ܶ�</font></td>
              <td bgcolor="#CCFFCC"><input name="czze" type="text" value="<%=cf.round(fwmjcz+clf+zccz,0)%>" size="20" maxlength="10" readonly></td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font>¼��ʱ��</td>
              <td width="31%" bgcolor="#CCFFCC"> 
                <input type="text" name="kgzsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">            </td>
              <td width="18%" align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font><font color="#0000FF">¼����</font></td>
              <td width="33%" bgcolor="#CCFFCC"> 
                <input type="text" name="kgzr" size="20" maxlength="10"  value="<%=yhmc%>" readonly>              </td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCFFCC">��ע</td>
              <td colspan="3" bgcolor="#CCFFCC"> 
                <textarea name="kgzsm" cols="71"  rows="3"><%=kgzsm%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="hidden" name="jlh"  value="<%=jlh%>" >
                  <input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="hidden" name="sgd"  value="<%=sgd%>" >
                  <input type="hidden" name="sgbz"  value="<%=sgbz%>" >
                  <input type="hidden" name="ysglk"  value="<%=ysglk%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
				  <input type="button" value="���Ͽ���ӡ" onClick="f_do1(editform)" name="flkdy" >
                </div>              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function calValue(FormName)
{  
	var clf=<%=(ysglk-cfje)%>*FormName.sgebfb.value/100.0;
	FormName.clf.value=round(clf,0);

	var czze=FormName.clf.value*1.0+FormName.fwmjcz.value*1.0+FormName.zccz.value*1.0;
	FormName.czze.value=round(czze,0);
} 
function f_do1(FormName)
{
	FormName.action="/cwgl/flk/flkdy.jsp";
	FormName.submit();
	return false;
}   

function f_do(FormName)//����FormName:Form������
{
	calValue(FormName);

	if(	javaTrim(FormName.sgebfb)=="") {
		alert("������[ʩ����ٷֱ�]��");
		FormName.sgebfb.focus();
		return false;
	}
	if(!(isFloat(FormName.sgebfb, "ʩ����ٷֱ�"))) {
		return false;
	}
	if (parseFloat(FormName.sgebfb.value)==0)
	{
		alert("[ʩ����ٷֱ�]����Ϊ0��");
		FormName.sgebfb.select();
		return false;
	}

	if(	javaTrim(FormName.clf)=="") {
		alert("������[���Ϸ�]��");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "���Ϸ�"))) {
		return false;
	}

	if (parseFloat(FormName.clf.value)==0)
	{
		alert("[���Ϸ�]����Ϊ0��");
		FormName.clf.select();
		return false;
	}

	if(	javaTrim(FormName.kgzr)=="") {
		alert("������[¼����]��");
		FormName.kgzr.focus();
		return false;
	}
	if(	javaTrim(FormName.czkh)=="") {
		alert("������[��ֵ����]��");
		FormName.czkh.focus();
		return false;
	}
	if(	javaTrim(FormName.kgzsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.kgzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kgzsj, "¼��ʱ��"))) {
		return false;
	}

	
	FormName.action="SaveEditXgCrm_khxx.jsp";  
	FormName.submit();
	FormName.flkdy.disabled=false;
	return true;
}
//-->
</SCRIPT>

