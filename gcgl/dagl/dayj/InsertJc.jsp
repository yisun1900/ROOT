<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>���̵��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>
<%
	String yhmc=(String)session.getAttribute("yhmc");

	String khbh=cf.GB2Uni(request.getParameter("khbh"));
	String[] damxbm=request.getParameterValues("damxbm");

%>

<body bgcolor="#FFFFFF" >
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"><strong>���̵��������</strong></div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJc.jsp" name="insertform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr align="center" bgcolor="#FFFFFF">
	  <td width="5%"><strong>�鵵��־</strong></td>
	  <td width="16%"><strong>��������</strong></td>
	  <td width="6%"><strong>����</strong></td>
	  <td width="17%"><strong>���ܲ���</strong></td>
	  <td width="7%"><strong>������</strong></td>
	  <td width="9%"><strong>����ʱ��</strong></td>
	  <td width="7%"><strong>¼����</strong></td>
	  <td width="9%"><strong>¼��ʱ��</strong></td>
	  <td width="42%"><strong>��ע</strong></td>
	</tr>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String damxmc=null;
String sl="";
String bgr=null;
String bgrdw="";
String bgrfgs=null;
String bgrdwmc=null;
String bgrfgsmc=null;
String bgsj=null;
String lrsj=null;
String lrr=null;
String bz=null;
String gdbz=null;
try {
	conn=cf.getConnection();


	for (int i=0;i<damxbm.length ;i++ )
	{

		ls_sql="select damxmc,sl,bgr,dwmc,bgrfgs,bgsj,crm_gcdagl.bz,crm_gcdagl.lrsj,crm_gcdagl.lrr,DECODE(crm_gcdagl.gdbz,'Y','�鵵','N','���') gdbz";
		ls_sql+=" from crm_gcdagl,dm_damxbm,sq_dwxx";
		ls_sql+=" where crm_gcdagl.damxbm=dm_damxbm.damxbm and crm_gcdagl.bgrdw=sq_dwxx.dwbh(+) and crm_gcdagl.khbh='"+khbh+"' and crm_gcdagl.damxbm='"+damxbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs= ps.executeQuery();
		if (rs.next())
		{
			damxmc=rs.getString("damxmc");
			sl=rs.getString("sl");
			bgr=rs.getString("bgr");
			bgrdw=cf.fillNull(rs.getString("dwmc"));
			bgrfgs=rs.getString("bgrfgs");
			bgsj=cf.fillNull(rs.getDate("bgsj"));
			lrsj=cf.fillNull(rs.getDate("lrsj"));
			lrr=rs.getString("lrr");
			bz=cf.fillNull(rs.getString("bz"));
			gdbz=cf.fillNull(rs.getString("gdbz"));


			%>
			<tr align="center" bgcolor="#FFFFFF"> 

			  <td><%=gdbz%></td>
			  <td >
				<%=damxmc%>
				<input name="damxbm" type="hidden" value="<%=damxbm[i]%>">
			  </td>
				
			  <td><%=sl%></td>
			
			  <td><%=bgrdw%></td>

			  <td><%=bgr%></td>
			  <td><%=bgsj%></td>
			  <td><%=lrr%></td>
			  <td><%=lrsj%></td>
			  <td><%=bz%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();
	}
}
catch (Exception e) 
{
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
        </table>
		  
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2"> 
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 
                <span class="STYLE1">*</span>�����������ֹ�˾              </td>
              <td width="32%">
				<select name="jyrssgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
<%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+bgrfgs+"'","");
%>
				</select>

		      </td>
              <td width="18%" align="right"> 
                <span class="STYLE1">*</span>��������������              </td>
              <td width="32%"> 
                <select name="jyrssbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
				<option value=""></option>
                <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+bgrfgs+"' and  cxbz='N' order by dwlx,dwbh","");
%> 
              </select>              </td>
            </tr>
			<tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <span class="STYLE1">*</span>������              </td>
              <td width="32%"> 
              <input type="text" name="jyr" size="20" maxlength="20" >              </td>
              <td width="18%" align="right"> 
                <span class="STYLE1">*</span>����ʱ��              </td>
              <td width="32%">
			  <input type="text" name="jysj" size="20" maxlength="10" value="<%=cf.today()%>" onDblClick="JSCalendar(this)"></td>
            </tr>
			<tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <span class="STYLE1">*</span><span class="STYLE2">¼����</span> </td>
              <td width="32%"><input type="text" name="lrr" size="20" maxlength="50" value="<%=yhmc%>" readonly></td>
              <td width="18%" align="right"> 
                <span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��              </span></td>
              <td width="32%"> 
              <input type="text" name="lrsj" size="20" maxlength="10" value="<%=cf.today()%>" readonly >              </td>
            </tr>
			<tr bgcolor="#FFFFFF"> 
			  <td width="18%" align="right"> 
				��ע			  </td>
			  <td colspan="3"><textarea name="bz" cols="72" rows="3"></textarea></td>
			</tr>
            <tr align="center"> 
              <td colspan="4"> 
				<input type="hidden" name="khbh"  value="<%=khbh%>" >
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����">              </td>
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
	if(	javaTrim(FormName.jysj)=="") {
		alert("������[����ʱ��]��");
		FormName.jysj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jysj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jyrssgs)=="") {
		alert("��ѡ�񡾽����˷ֹ�˾����");
		FormName.jyrssgs.focus();
		return false;
	}
	if(	javaTrim(FormName.jyrssbm)=="") {
		alert("��ѡ�񡾽����˵�λ����");
		FormName.jyrssbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jyr)=="") {
		alert("������[������]��");
		FormName.jyr.focus();
		return false;
	}
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
