<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=null;
String khbh=null;
String dj=null;
String clgw=null;
String ztjjgw=null;
String xmzy=null;
String jhccsj=null;
String lrsj=null;
String bz=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String clzt=null;
String jjsjs=null;

String fgsbh=null;
String pdgc=null;
String pdgcmc=null;
String jjgys=null;
String jjppmc=null;
String xcmgc=null;
String xcmgcmc=null;
String xcmgys=null;
String xcmppmc=null;
String dqbm=null;

String whereddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	ls_sql="select crm_khxx.fgsbh,jc_jjdd.pdgc,jc_jjdd.pdgcmc,jc_jjdd.jjgys,jc_jjdd.jjppmc,jc_jjdd.xcmgc,jc_jjdd.xcmgcmc,jc_jjdd.xcmgys,jc_jjdd.xcmppmc,ddbh,jc_jjdd.khbh,dj,clgw,ztjjgw,jc_jjdd.xmzy,jhccsj,jc_jjdd.bz,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.hth,jc_jjdd.lrsj,clzt,jjsjs ";
	ls_sql+=" from  jc_jjdd,crm_khxx";
	ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and jc_jjdd.ddbh='"+whereddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		pdgc=cf.fillNull(rs.getString("pdgc"));
		pdgcmc=cf.fillNull(rs.getString("pdgcmc"));
		jjgys=cf.fillNull(rs.getString("jjgys"));
		jjppmc=cf.fillNull(rs.getString("jjppmc"));
		xcmgc=cf.fillNull(rs.getString("xcmgc"));
		xcmgcmc=cf.fillNull(rs.getString("xcmgcmc"));
		xcmgys=cf.fillNull(rs.getString("xcmgys"));
		xcmppmc=cf.fillNull(rs.getString("xcmppmc"));

		ddbh=cf.fillNull(rs.getString("ddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		dj=cf.fillNull(rs.getString("dj"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		jhccsj=cf.fillNull(rs.getDate("jhccsj"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		clzt=cf.fillNull(rs.getString("clzt"));
		jjsjs=cf.fillNull(rs.getString("jjsjs"));
	}
	rs.close();
	ps.close();


	ls_sql=" select dqbm from sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">���޸ļҾ߶���</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" readonly>
              </td>
              <td width="17%"> 
                <div align="right"></div>
              </td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">��ͬ��</td>
              <td width="32%"> <%=hth%> </td>
              <td width="17%" align="right">�ͻ�����</td>
              <td width="33%"> <%=khxm%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">��ϵ��ʽ</td>
              <td colspan="3"> <%=lxfs%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">���ݵ�ַ</td>
              <td colspan="3"> <%=fwdz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ĿרԱ</td>
              <td width="32%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc||DECODE(sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2 from sq_yhxx where zwbm='10' and ssfgs='"+fgsbh+"' order by sfzszg desc,yhmc",xmzy);
%> 
                </select>
              </td>
              <td width="17%" align="right">����</td>
              <td width="33%"> 
                <input type="text" name="dj" size="20" maxlength="9"  value="<%=dj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">פ��Ҿӹ���</td>
              <td width="32%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc||DECODE(sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2 from sq_yhxx where zwbm='08' and ssfgs='"+fgsbh+"' order by sfzszg desc,yhmc",clgw);
%> 
                </select>
              </td>
              <td width="17%" align="right">չ���Ҿӹ���</td>
              <td width="33%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc||DECODE(sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2 from sq_yhxx where zwbm='08' and ssfgs='"+fgsbh+"' order by sfzszg desc,yhmc",ztjjgw);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�ƻ�����ʱ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jhccsj" size="20" maxlength="10"  value="<%=jhccsj%>" >
              </td>
              <td width="17%"> 
                <div align="right">�Ҿ����ʦ</div>
              </td>
              <td width="33%"> 
                <select name="jjsjs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc||DECODE(sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2 from sq_yhxx where zwbm='12' and ssfgs='"+fgsbh+"' order by sfzszg desc,yhmc",jjsjs);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF">�Ҿ߹���</td>
              <td width="32%"> 
                <select name="pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='3' and dqbm='"+dqbm+"' order by gysmc",pdgc);
%> 
                </select>
              </td>
              <td width="17%" align="right">�Ͳ��Ź���</td>
              <td width="33%"> 
                <select name="xcmgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='3' and dqbm='"+dqbm+"' order by gysmc",xcmgc);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF">�Ҿ߹�Ӧ��</td>
              <td width="32%">
                <select name="jjgys" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select distinct gys c1,gys c2 from sq_gysxx where gyslb='3' and sq_gysxx.dqbm='"+dqbm+"' order by gys",jjgys);
%> 
                </select>
              </td>
              <td width="17%" align="right">�Ͳ��Ź�Ӧ��</td>
              <td width="33%">
                <select name="xcmgys" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select distinct gys c1,gys c2 from sq_gysxx where gyslb='3' and sq_gysxx.dqbm='"+dqbm+"' order by gys",xcmgys);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF">�Ҿ�Ʒ��</td>
              <td width="32%">
                <select name="jjppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select distinct ppmc c1,ppmc c2 from sq_gysxx where gyslb='3'  and dqbm='"+dqbm+"' order by ppmc",jjppmc);
%> 
                </select>
              </td>
              <td width="17%" align="right">�Ͳ���Ʒ��</td>
              <td width="33%">
                <select name="xcmppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select distinct ppmc c1,ppmc c2 from sq_gysxx where gyslb='3'  and dqbm='"+dqbm+"' order by ppmc",xcmppmc);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="hidden" name="whereddbh"  value="<%=whereddbh%>" >
                <input type="button"  value="����" onClick="f_do(editform)">
                <input type="reset"  value="����">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
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
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhccsj, "�ƻ�����ʱ��"))) {
		return false;
	}

	FormName.action="SaveTqEditJc_jjdd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
