<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�����µ����ı���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
	String cldlbm=cf.GB2Uni(request.getParameter("cldlbm"));
	String clxlbm=cf.GB2Uni(request.getParameter("clxlbm"));
	String ppmc=cf.GB2Uni(request.getParameter("ppmc"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql =" select count(*)";
	ls_sql+=" from jxc_clbm,jxc_cljgb";
	ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm and jxc_cljgb.dqbm='"+dqbm+"' and jxc_clbm.cldlbm='"+cldlbm+"' and jxc_clbm.clxlbm='"+clxlbm+"' and jxc_clbm.ppmc='"+ppmc+"'";
    ls_sql+=" and jxc_cljgb.xsfs!='1'";//1������Ʒ��2���ֻ����ۣ�3���ڻ����ۣ�4����������
    ls_sql+=" and jxc_clbm.cllb='2'";//0������Ʒ���ģ�1�����ģ�2�����Ʒ����
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
        <td colspan="2" height="52"><b>��ѡ�����ı���EXECEL�ļ�</b></td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="65"><b><font color="#FF0000">
		  
          <BR>��<%=ppmc%>�����е�Ʒ����<%=count%>
		  <BR>ע�⣺�����˹�<input type="button"  value="ɾ����<%=ppmc%>��ȫ������" onClick="window.open('ChooseDel1.jsp?dqbm=<%=dqbm%>&cldlbm=<%=cldlbm%>&clxlbm=<%=clxlbm%>&ppmc=<%=ppmc%>')">��ϵͳ�����Զ�ɾ��<BR>
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
			<input name="cldlbm" type="hidden" value="<%=cldlbm%>" >
			<input name="clxlbm" type="hidden" value="<%=clxlbm%>" >
			<input name="ppmc" type="hidden" value="<%=ppmc%>" >
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

//-->
</script>