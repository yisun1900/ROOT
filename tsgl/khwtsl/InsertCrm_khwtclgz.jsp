<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String slbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String khxm=null;
String fwdz=null;
String lxfs=null;

String dwbh=null;
String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String sjkgrq=null;
String sjjgrq=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

int count=0;
//������
String wtbh=null;
String ssfgs=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,sjkgrq,sjjgrq,djbh,hfdjbz,djyy,djsj,djr,jhjdsj,sgbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));

		sgbz=cf.fillNull(rs.getString("sgbz"));
	}
	rs.close();

	//������λ
	ls_sql="select ssfgs";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=rs.getString(1);
	}
	rs.close();

	ls_sql="select NVL(max(substr(wtbh,8,2)),0)";
	ls_sql+=" from  crm_khwtclgz";
	ls_sql+=" where khbh='"+khbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();

	wtbh=khbh+cf.addZero(count+1,2);
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

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ����ͻ����⣨�����ţ�<%=wtbh%>�� </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCrm_khwtclgz.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#0000CC">�ͻ����</font></div>
              </td>
              <td width="34%"><%=khbh%></td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">��ͬ��</font></div>
              </td>
              <td width="33%"> <%=hth%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#0000CC">�ͻ�����</font></div>
              </td>
              <td width="34%"> <%=khxm%> </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">ǩԼ����</font></div>
              </td>
              <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#0000CC">���ݵ�ַ</font></td>
              <td colspan="3"> <%=fwdz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#0000CC">���ʦ</font></div>
              </td>
              <td width="34%"> <%=sjs%> </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">�ʼ�Ա</font></div>
              </td>
              <td width="33%"> <%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#0000CC">ʩ����</font></div>
              </td>
              <td width="34%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sgd+"'",sgd,true);
%> </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">ʩ������</font></div>
              </td>
              <td width="33%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#0000CC">ʵ��������</font></td>
              <td width="34%"> <%=sjkgrq%> </td>
              <td width="17%" align="right"><font color="#0000CC">ʵ��������</font></td>
              <td width="33%"> <%=sjjgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">�������</div>
              </td>
              <td width="34%"> 
                <select name="wtflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select wtflbm,wtflmc from dm_wtflbm order by wtflbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lxfs" value="<%=lxfs%>" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">����˵��</td>
              <td colspan="3"> 
                <textarea name="wtsm" cols="72" rows="3"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">Ҫ����ʱ��</div>
              </td>
              <td width="34%"> 
                <input type="text" name="yqjjsj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%"> 
                <div align="right">�ͷ�����ʱ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="slsj" value="<%=cf.today()%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">�ͷ�������</div>
              </td>
              <td width="34%"> 
                <input type="text" name="slr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td width="17%"> 
                <div align="right">¼�벿��</div>
              </td>
              <td width="33%"> 
                <select name="slbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+slbm+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="wtbh" value="<%=wtbh%>">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.wtbh)=="") {
		alert("������[������]��");
		FormName.wtbh.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.wtsm)=="") {
		alert("������[����˵��]��");
		FormName.wtsm.focus();
		return false;
	}
	if(!(isDatetime(FormName.yqjjsj, "Ҫ����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.slr)=="") {
		alert("������[�ͷ�������]��");
		FormName.slr.focus();
		return false;
	}
	if(	javaTrim(FormName.slsj)=="") {
		alert("������[�ͷ�����ʱ��]��");
		FormName.slsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.slsj, "�ͷ�����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.slbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.slbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
