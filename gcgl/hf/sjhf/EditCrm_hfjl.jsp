<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=null;

String hfsj=null;
String hfr=null;
String hfbm=null;
String hfsm=null;

String clfs=null;
String jglxbm=null;
String bz=null;
String wherehfjlh=cf.GB2Uni(request.getParameter("hfjlh"));
String ssfgs=null;
String dwbh=null;
String khxm=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select bz,jglxbm,khbh,hfsm,hfr,hfsj,hfbm,clfs";
	ls_sql+=" from  crm_sjhfjl";
	ls_sql+=" where  (hfjlh="+wherehfjlh+")  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		bz=cf.fillNull(rs.getString("bz"));
		jglxbm=cf.fillNull(rs.getString("jglxbm"));

		khbh=cf.fillNull(rs.getString("khbh"));

		clfs=cf.fillNull(rs.getString("clfs"));
		hfsm=cf.fillNull(rs.getString("hfsm"));
		hfr=cf.fillNull(rs.getString("hfr"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		hfbm=cf.fillNull(rs.getString("hfbm"));

	}

	//������λ
	ls_sql="select fgsbh,khxm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=rs.getString(1);
		khxm=rs.getString(2);
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center"><b>��<%=khxm%>��</b>�绰�طã��طü�¼�ţ�<%=wherehfjlh%>��</div>

<table width="100%">
  <tr> 
    <td width="100%" > 
      <div align="center"> 
        <form method="post" action="SaveEditCrm_hfjl.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF">
              <td align="right"><font color="#CC0000">*</font>�ط�˵��</td>
              <td colspan="3"><textarea name="hfsm" rows="5" cols="87"><%=hfsm%></textarea></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%" align="right">��ע</td>
              <td colspan="3"> 
                <input type="text" name="bz" maxlength="100" size="89" value="<%=bz%>">              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="14%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>����ʽ</td>
              <td width="37%" bgcolor="#E8E8FF"> 
                <select name="clfs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f2(insertform)">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+���账��&1+������ز���",clfs);
%> 
                </select></td>
              <td width="14%" rowspan="5" align="right" bgcolor="#E8E8FF"> 
                ��������</td>
              <td rowspan="5" bgcolor="#E8E8FF" width="36%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" size="9" multiple>
                  <option value=""></option>
                  <%
	String sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1','F2') and cxbz='N' and ssfgs='"+ssfgs+"' ";
	sql+=" union ";
	sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";
	cf.mutilSelectItem(out,sql,"select dwbh from crm_sjhffkbm where hfjlh="+wherehfjlh);

%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�طý��</td>
              <td><select name="jglxbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <%
	cf.selectItem(out,"select jglxbm,jglxmc from dm_jglxbm order by jglxbm",jglxbm);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="14%" align="right"><font color="#CC0000">*</font><font color="#0000CC">�ط���</font></td>
              <td width="37%"><input type="text" name="hfr" value="<%=hfr%>" size="20" maxlength="20" readonly></td> 
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="14%" align="right"><font color="#CC0000">*</font><font color="#0000CC">�ط�ʱ��</font></td>
              <td width="37%"><input type="text" name="hfsj" value="<%=hfsj%>" size="20" maxlength="10" readonly></td> 
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="14%" align="right"><font color="#CC0000">*</font><font color="#0000CC">�طò���</font></td>
              <td width="37%"><select name="hfbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+hfbm+"'","");
%>
              </select></td> 
            </tr>
            <tr> 
              <td width="14%" height="2">&nbsp;</td>
              <td width="37%" height="2" align="right"><input type="hidden" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" >
                <input type="hidden" name="wherehfjlh"  value="<%=wherehfjlh%>" >
              <input name="button" type="button" onClick="f_do(insertform)"  value="����"></td>
              <td width="14%" height="2">&nbsp;</td>
              <td width="36%" height="2"> 
                <input type="reset"  value="����">              </td>
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

function f2(FormName)//����FormName:Form������
{
	if (FormName.clfs.value=='0')
	{
		notAll(FormName.dwbh);
	}
}

function f_do(FormName)//����FormName:Form������
{
	f2(FormName);

	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.hfsm)=="") {
		alert("��ѡ��[�ط�˵��]��");
		FormName.hfsm.focus();
		return false;
	}
	if(	javaTrim(FormName.jglxbm)=="") {
		alert("��ѡ��[�طý��]��");
		FormName.jglxbm.focus();
		return false;
	}

	if(	javaTrim(FormName.clfs)=="") {
		alert("��ѡ��[����ʽ]��");
		FormName.clfs.focus();
		return false;
	}
	if (FormName.clfs.value=='1')
	{
		if (!selectChecked(FormName.dwbh)){
			alert("��ѡ��[��������]��");
			FormName.dwbh.focus();
			return false;
		}
	}

	
	if(	javaTrim(FormName.hfr)=="") {
		alert("������[�ط���]��");
		FormName.hfr.focus();
		return false;
	}
	if(	javaTrim(FormName.hfsj)=="") {
		alert("������[�ط�ʱ��]��");
		FormName.hfsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.hfsj, "�ط�ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
