<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�����µ����ı���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
	String zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
	String zcxlbm=cf.GB2Uni(request.getParameter("zcxlbm"));
	String dwbh=cf.GB2Uni(request.getParameter("dwbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql =" select count(*)";
	ls_sql+=" from jc_zcjgb";
	ls_sql+=" where dqbm='"+dqbm+"' and zcdlbm='"+zcdlbm+"' and zcxlbm='"+zcxlbm+"' and dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);

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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<CENTER>
  <B>�����µ����ı���</B><BR>
  <HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0" style="FONT-SIZE:16">
      <tr align="center"> 
        <td colspan="2" height="52"><b>��ѡ�����ı���TXT�ļ�</b></td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="65"><b><font color="#FF0000">
		  
          <BR>��<%=dwbh%>�����е�Ʒ����<%=count%>
		  <BR>ע�⣺�����˹�<input type="button"  value="ɾ����<%=dwbh%>��ȫ������" onClick="window.open('ChooseDel1.jsp?dqbm=<%=dqbm%>&zcdlbm=<%=zcdlbm%>&zcxlbm=<%=zcxlbm%>&dwbh=<%=dwbh%>')">��ϵͳ�����Զ�ɾ��<BR>
          �����¡��ɱ��۶��ᱣ����ϵͳ��</font></b></td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="65"> 
          <input type="file" name="loadName" value="" size="60">
        </td>
      </tr>
      <tr valign="middle"> 
        <td colspan="2" align="center"> 
			<input name="dqbm" type="hidden" value="<%=dqbm%>" >
 			<input name="zcdlbm" type="hidden" value="<%=zcdlbm%>" >
			<input name="zcxlbm" type="hidden" value="<%=zcxlbm%>" >
			<input name="dwbh" type="hidden" value="<%=dwbh%>" >
         <input type="button"  value="����" onClick="f_onclick(loadform)">
        </td>
      </tr>
    </table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_onclick(FormName)
{
	FormName.action="DisImpAddDataTxt.jsp";

	FormName.submit();
	return true;
} 

function f_del(FormName)//����FormName:Form������
{
	if ( confirm("ȷʵҪ��ɾ��[Ʒ�ƹ�Ӧ��]����?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("��ѡ��[��������]��");
			FormName.dqbm.focus();
			return false;
		}
		if(	javaTrim(FormName.zcdlbm)=="") {
			alert("��ѡ��[���Ĵ���]��");
			FormName.zcdlbm.focus();
			return false;
		}
		if(	javaTrim(FormName.zcxlbm)=="") {
			alert("��ѡ��[����С��]��");
			FormName.zcxlbm.focus();
			return false;
		}
		if(	javaTrim(FormName.dwbh)=="") {
			alert("��ѡ��[Ʒ�ƹ�Ӧ��]��");
			FormName.dwbh.focus();
			return false;
		}

		FormName.target="_blank";
		FormName.action="ChooseDel.jsp";
		FormName.submit();
		return true;
	}
}

//-->
</script>