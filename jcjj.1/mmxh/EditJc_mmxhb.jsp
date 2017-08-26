<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String yhjs=(String)session.getAttribute("yhjs");
	String lrr=(String)session.getAttribute("yhmc");
	String lrbm=(String)session.getAttribute("dwbh");
%>
<%

String mmxh=null;
String mxbm=null;
String mytbm=null;
String zp=null;
String bz=null;
double bzjg=0;
String dqbm=null;

String wheremmxh=request.getParameter("mmxh");
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select mmxh,mxbm,mytbm,zp,bz,bzjg,dqbm ";
	ls_sql+=" from  jc_mmxhb";
	ls_sql+=" where  (mmxh='"+wheremmxh+"' and dqbm='"+wheredqbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		mmxh=cf.fillNull(rs.getString("mmxh"));
		mxbm=cf.fillNull(rs.getString("mxbm"));
		mytbm=cf.fillNull(rs.getString("mytbm"));
		zp=cf.fillNull(rs.getString("zp"));
		bz=cf.fillNull(rs.getString("bz"));
		bzjg=rs.getDouble("bzjg");
		dqbm=cf.fillNull(rs.getString("dqbm"));
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

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸���Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>ľ���ͺ�</div>
              </td>
              <td width="33%"> 
                <input type="text" name="mmxh" size="20" maxlength="12"  value="<%=mmxh%>" >
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>����</div>
              </td>
              <td width="32%"> 
                <select name="mxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mxbm,mxmc from jdm_mxbm order by mxbm",mxbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>����;</div>
              </td>
              <td width="33%"> 
                <select name="mytbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mytbm,myt from jdm_mytbm order by mytbm",mytbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">��Ƭ</div>
              </td>
              <td width="32%"> 
                <input type="text" name="zp" size="20" maxlength="50"  value="<%=zp%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>��׼�۸�</td>
              <td width="33%"> 
                <input type="text" name="bzjg" value="<%=bzjg%>" size="20" maxlength="16" >
              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">¼����</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">¼��ʱ��</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">¼�벿��</font></td>
              <td width="33%"> 
                <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%> 
                </select>
              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">��������</font></td>
              <td width="32%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm",dqbm);
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="69" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wheremmxh"  value="<%=wheremmxh%>" >
            <input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="button"  value="����" onClick="f_do(editform)">
                <input type="reset"  value="����">
                <input type="button"  value="�ϴ���Ƭ" onClick="f_do1(editform)" name="button">
                <input type="button"  value="�鿴��Ƭ" onClick="f_do2(editform)" name="button">
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
	if(	javaTrim(FormName.mmxh)=="") {
		alert("������[ľ���ͺ�]��");
		FormName.mmxh.focus();
		return false;
	}
	if(	javaTrim(FormName.mxbm)=="") {
		alert("��ѡ��[����]��");
		FormName.mxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mytbm)=="") {
		alert("��ѡ��[����;]��");
		FormName.mytbm.focus();
		return false;
	}
	if(!(isFloat(FormName.bzjg, "��׼�۸�"))) {
		return false;
	}

	
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}

	FormName.target="";
	FormName.action="SaveEditJc_mmxhb.jsp";
	FormName.submit();
	return true;
}

function f_do1(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.mmxh)=="") {
		alert("������[ľ���ͺ�]��");
		FormName.mmxh.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_do2(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.mmxh)=="") {
		alert("������[ľ���ͺ�]��");
		FormName.mmxh.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>