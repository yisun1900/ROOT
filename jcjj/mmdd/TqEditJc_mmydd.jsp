<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String wjqk=null;
String sqdj=null;

String clgw=null;
String ztjjgw=null;
String lrr=null;
String lrsj=null;
String jhccsj=null;
String dwbh=null;
String cxhdbm=null;
String xmzy=null;
String bz=null;
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String clzt=null;
String pdgc=null;
String pdgcmc=null;
String gys=null;
String ppmc=null;
String ssfgs=null;


String fkje=null;
String listSql="";

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select crm_khxx.fgsbh,jc_mmydd.khbh,pdgc,pdgcmc,gys,ppmc,wjqk,sqdj,clgw,ztjjgw,jc_mmydd.lrr,jc_mmydd.lrsj,jc_mmydd.dwbh,jc_mmydd.bz,clzt,jhccsj,jc_mmydd.xmzy,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.hth ";
	ls_sql+=" from  jc_mmydd,crm_khxx";
	ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh(+) and yddbh='"+yddbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		pdgc=cf.fillNull(rs.getString("pdgc"));
		pdgcmc=cf.fillNull(rs.getString("pdgcmc"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		wjqk=cf.fillNull(rs.getString("wjqk"));
		sqdj=cf.fillNull(rs.getString("sqdj"));

		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		bz=cf.fillNull(rs.getString("bz"));
		clzt=cf.fillNull(rs.getString("clzt"));
		jhccsj=cf.fillNull(rs.getDate("jhccsj"));
		xmzy=cf.fillNull(rs.getString("xmzy"));

		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
	}
	rs.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
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
      <div align="center">���޸�ľ��Ԥ������Ԥ������ţ�<%=yddbh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCFF"> 
              <td width="17%" align="right">��ͬ��</td>
              <td width="33%"> <%=hth%> </td>
              <td width="17%" align="right">�ͻ�����</td>
              <td width="33%"> <%=khxm%> </td>
            </tr>
            
            <tr bgcolor="#CCCCFF"> 
              <td width="17%" align="right">���ݵ�ַ</td>
              <td colspan="3"> <%=fwdz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">������</td>
              <td width="33%"> <%
	cf.radioToken(out, "wjqk","1+�ͻ��Թ�&2+��˾����",wjqk);
%> </td>
              <td width="17%" align="right">ľ�Ŷ���</td>
              <td width="33%"> 
                <input type="text" name="sqdj" size="20" maxlength="9"  value="<%=sqdj%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�ɵ�����</td>
              <td width="33%"> 
                <select name="pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	listSql="select sq_gysxx.gysbh,sq_gysxx.gysmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+ssfgs+"' and sq_gysxx.gyslb='1' order by sq_gysxx.gysmc";
	cf.selectItem(out,listSql,pdgc);
%> 
                </select>              </td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="33%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="17%" align="right">Ʒ��</td>
              <td width="33%"> 
                <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	listSql="select distinct sq_gysxx.ppmc c1,sq_gysxx.ppmc c2 from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+ssfgs+"' and sq_gysxx.gyslb='1' order by sq_gysxx.ppmc";
	cf.selectItem(out,listSql,ppmc);
%> 
                </select>              </td>
              <td width="17%" align="right">��Ӧ��</td>
              <td width="33%"> 
                <select name="gys" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	listSql="select distinct sq_gysxx.gys c1,sq_gysxx.gys c2 from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+ssfgs+"' and sq_gysxx.gyslb='1' order by sq_gysxx.gys";
	cf.selectItem(out,listSql,gys);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">פ��Ҿӹ���</td>
              <td width="33%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2,sq_yhxx.sfzszg from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08'";
	listSql+=" UNION ALL ";
	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2,sq_yhxx.sfzszg from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08'";
	listSql+=" ORDER BY sfzszg desc,c2 ";
	cf.selectItem(out,listSql,clgw);
%> 
                </select>              </td>
              <td width="17%" align="right">չ���Ҿӹ���</td>
              <td width="33%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2,sq_yhxx.sfzszg from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08'";
	listSql+=" UNION ALL ";
	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2,sq_yhxx.sfzszg from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08'";
	listSql+=" ORDER BY sfzszg desc,c2 ";
	cf.selectItem(out,listSql,ztjjgw);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��ĿרԱ</td>
              <td width="33%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2,sq_yhxx.sfzszg from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='10'";
	listSql+=" UNION ALL ";
	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2,sq_yhxx.sfzszg from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='10'";
	listSql+=" ORDER BY sfzszg desc,c2 ";
	cf.selectItem(out,listSql,xmzy);
%> 
                </select>              </td>
              <td width="17%" align="right">�ƻ�����ʱ��</td>
              <td width="33%"> 
                <input type="text" name="jhccsj" value="<%=jhccsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">¼����</td>
              <td width="33%"> 
                <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly></td>
              <td width="17%" align="right">¼��ʱ��</td>
              <td width="33%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">¼�벿��</td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%> 
                </select>              </td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="hidden" name="yddbh"  value="<%=yddbh%>" >
                <input type="button"  value="����" onClick="f_do(editform)">
                <input type="reset"  value="����">
                <input type="button"  value="�鿴������ϸ" onClick="f_ckbl(editform)" name="ckbl" >              </td>
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
/*
	if(	!radioChecked(FormName.wjqk)) {
		alert("��ѡ��[������]��");
		FormName.wjqk[0].focus();
		return false;
	}
*/
	if(!(isFloat(FormName.sqdj, "��ȡ����"))) 
	{
		return false;
	}
	if(	javaTrim(FormName.clgw)=="") {
		alert("������[פ��Ҿӹ���]��");
		FormName.clgw.focus();
		return false;
	}
	if(	javaTrim(FormName.xmzy)=="") {
		alert("����û��[��ĿרԱ]��");
		FormName.xmzy.focus();
		return false;
	}
	<%
	if (!pdgc.equals(""))
	{
		%>
		if(	javaTrim(FormName.pdgc)=="") {
			alert("���ɵ�,��ѡ��[�ɵ�����]��");
			FormName.pdgc.focus();
			return false;
		}
		<%
	}
	else 
	{
		%>
		if(	javaTrim(FormName.pdgc)!="") {
			alert("δ�ɵ�,����ѡ��[�ɵ�����]��");
			FormName.pdgc.focus();
			return false;
		}
		<%
	}
	%>
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.dwbh.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhccsj, "�ƻ�����ʱ��"))) {
		return false;
	}

	FormName.action="SaveTqEditJc_mmydd.jsp";
	FormName.submit();
	return true;
}

function f_ckmm(FormName)//����FormName:Form������
{
	FormName.action="Jc_mmdgdmxList.jsp";
	FormName.submit();
	return true;
}

function f_ckwj(FormName)//����FormName:Form������
{
	FormName.action="Jc_wjjddmxList.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_ckbl(FormName)//����FormName:Form������
{
	FormName.action="Jc_blddmxList.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
