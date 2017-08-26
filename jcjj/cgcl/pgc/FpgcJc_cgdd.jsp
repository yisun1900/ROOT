<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String cgsjs=null;
String pdgc=null;
String pgcr=null;
String pgcsj=null;
String pgcsm=null;
String fgsbh=null;
String khbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
double htze=0;
double wdzje=0;
String fkfs=null;

double cgzkl=0;
String dzyy=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double fkje=0;

try {
	conn=cf.getConnection();

	ls_sql="select khbh,cgsjs,pdgc,jc_cgdd.pgcr,jc_cgdd.pgcsj,jc_cgdd.pgcsm,fgsbh,khbh,htze,wdzje,fkfs,cgzkl,dzyy";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		cgsjs=cf.fillNull(rs.getString("cgsjs"));
		pdgc=cf.fillNull(rs.getString("pdgc"));
		pgcr=cf.fillNull(rs.getString("pgcr"));
		pgcsj=cf.fillNull(rs.getDate("pgcsj"));
		pgcsm=cf.fillNull(rs.getString("pgcsm"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		htze=rs.getDouble("htze");
		wdzje=rs.getDouble("wdzje");
		fkfs=cf.fillNull(rs.getString("fkfs"));
		cgzkl=rs.getDouble("cgzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
	}
	rs.close();
	ps.close();

	ls_sql="select hth,khxm,fwdz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
	}
	rs.close();
	ps.close();

	//����
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and ddbh='"+ddbh+"' and scbz='N' and fklxbm='22'";//22:�����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkje=rs.getDouble(1);
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
<title>������˳����Ƶ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveFpgcJc_cgdd.jsp" name="insertform" >
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">���񶩵�����--�ɹ�����������ţ�<%=ddbh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#000099">�ͻ����</font></td>
              <td width="33%"><%=khbh%></td>
              <td width="17%" align="right"><font color="#000099">��ͬ��</font></td>
              <td width="33%"><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#000099">�ͻ�����</font></td>
              <td width="33%"><%=khxm%></td>
              <td width="17%" align="right"><font color="#000099">���ݵ�ַ</font></td>
              <td width="33%"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#000099"><b>δ���۽��</b></font></td>
              <td width="33%"><%=wdzje%></td>
              <td width="17%" align="right"><font color="#000099"><b>��ͬ�ܶ�</b></font></td>
              <td width="33%"><%=htze%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">�����ۿ���</font></td>
              <td><%=cgzkl%></td>
              <td align="right">&nbsp;</td>
              <td valign="top">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">����ԭ��</font></td>
              <td colspan="3"><%=dzyy%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right" bgcolor="#FFFFFF"><b><font color="#CC0000">���ʽ</font></b></td>
              <td width="33%"><b><font color="#CC0000"><%
	cf.selectToken(out,"1+�ѽ������&2+����Ԥ����&3+����Ԥ����&4+�Ҿ�Ԥ����&5+ľ��Ԥ����&9+δ����",fkfs,true);
%></font></b></td>
              <td width="17%" align="right"><b><font color="#CC0000">������</font></b></td>
              <td width="33%"><b><font color="#CC0000"><%=fkje%></font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right" bgcolor="#FFFFFF">�ɵ�����</td>
              <td width="33%"> 
                <select name="pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	String sql="select sq_gysxx.gysbh,sq_gysxx.gysmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+fgsbh+"' and sq_gysxx.gyslb='2' order by sq_gysxx.gysmc";
	cf.selectItem(out,sql,pdgc);
%> 
                </select>              </td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right" bgcolor="#FFFFFF">�ɵ���</td>
              <td width="33%"> 
              <input type="text" name="pgcr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>              </td>
              <td width="17%" align="right">�ɵ�ʱ��</td>
              <td width="33%"> 
                <input type="text" name="pgcsj" size="20" maxlength="20"  value="<%=cf.today()%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�ɵ�˵��</td>
              <td colspan="3"> 
                <textarea name="pgcsm" cols="71" rows="3"><%=pgcsm%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" > 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset" name="Reset" value="����">
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                </div>              </td>
            </tr>
          </table>

	  
	  </div>
    </td>
  </tr>
</table>
</form>
</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.pdgc)=="") {
		alert("������[�ɵ�����]��");
		FormName.pdgc.focus();
		return false;
	}
	if(	javaTrim(FormName.pgcr)=="") {
		alert("������[�ɵ���]��");
		FormName.pgcr.focus();
		return false;
	}
	if(	javaTrim(FormName.pgcsj)=="") {
		alert("������[�ɵ�ʱ��]��");
		FormName.pgcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pgcsj, "�ɵ�ʱ��"))) {
		return false;
	}



	FormName.submit();
	return true;
}
//-->
</SCRIPT>