<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�±���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String dwbh=(String)session.getAttribute("dwbh");
String jzbm=(String)session.getAttribute("jzbm");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");

String nian=request.getParameter("nian");
String yue=request.getParameter("yue");

String fgsmark=null;
String dqmark=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int count=0;
try {
	conn=cf.getConnection();

	String xtrzip=request.getRemoteHost();
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String xtrzyhmc=(String)session.getAttribute("yhmc");
	ls_sql="insert into sq_xtrz ( xh,ip,yhdlm,dlsj ) ";
	ls_sql+=" values ( (select NVL(max(xh),0)+1 from sq_xtrz),?,?,SYSDATE) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xtrzip);
	ps.setString(2,xtrzyhdlm);
	ps.executeUpdate();
	ps.close();

	ls_sql="select count(*)";
	ls_sql+=" from  cw_yjdjjl";
	ls_sql+=" where  nian='"+nian+"' and yue='"+yue+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		fgsmark="";
		dqmark="";
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		fgsmark="";
		dqmark="disabled=true";
	}
	else{
		fgsmark="disabled=true";
		dqmark="disabled=true";
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="4" height="64"> 
        <div align="center">�����ֵͳ�� <%
	if (count>0)
	{
		out.println("��<font color='#FF0000'>ע�⣡����ҵ���Ѷ���</font>��");
	}
%> </div>
      </td>
    </tr>
    <tr>
      <td align="right" width="30%" height="42">����</td>
      <td height="42" colspan="3" width="70%">
        <select name="ssdqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select ssdqbm,ssdqmc from sq_ssdqbm order by ssdqbm","");
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="42">�ֹ�˾</td>
      <td height="42" colspan="3" width="70%"> 
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> 
      </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="44">ǩԼ����</td>
      <td height="44" colspan="3" width="70%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where (dwbh='"+dwbh+"' OR dwbh='"+jzbm+"')","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="43"> ǩԼʱ��</td>
      <td height="43" colspan="3" width="70%"> �� 
        <input type="text" name="sjfw" size="11" maxlength="10" value='<%=cf.firstDay(nian,yue)%>' onDblClick="JSCalendar(this)">
        ----&gt; �� 
        <input type="text" name="sjfw2" size="11" maxlength="10"  value='<%=cf.lastDay(nian,yue)%>' onDblClick="JSCalendar(this)">
      </td>
    </tr>
 <!--   <tr> 
      <td align="right" width="30%" height="46">���ᵱ��ҵ��</td>
      <td height="46" colspan="3" width="70%"> 
<%
	if (yhjs.equals("F2"))
	{
		%>
        <input type="radio" name="djyj" value="N" checked>
        ������ 
		<%
	}
	else{
		%>
        <input type="radio" name="djyj" value="Y"  >
        ���� 
        <input type="radio" name="djyj" value="N" checked>
        ������ 
		<%
	}
%>
		</td>
    </tr>-->
    <tr>
      <td align="right" width="30%" height="46"><font color="#FF0000">*</font>ҵ����Χ</td>
      <td height="46" colspan="3" width="70%" bgcolor="#CCCCFF"> 
        <input type="radio" name="jzbz" value="0" checked>
        ȫ�� 
        <input type="radio" name="jzbz" value="1">
        ��װ 
        <input type="radio" name="jzbz" value="2">
        ��װ </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="46">��ʾ���</td>
      <td height="46" colspan="3" width="70%"> 
        <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td height="71" colspan="4"> 
        <input type="hidden" name="nian" value="<%=nian%>">
        <input type="hidden" name="yue" value="<%=yue%>">
        <input type="button"  value="��װͳ��" onClick="f_do(selectform,'jz')" name="jzcz">
        <input type="button"  value="������֤ͳ��" onClick="f_do(selectform,'fj')" name="fjrz">
        <input type="reset"  value="����">
        <input name="button2" type="button" onClick="f_do(selectform,'dmjj')"  value="����Ҿ�ͳ��" >
        <input name="button2" type="button" onClick="f_do(selectform,'fgsjj')"  value="�ֹ�˾�Ҿ�ͳ��" <%=fgsmark%>>
        <input name="button" type="button" onClick="f_do(selectform,'dqjj')"  value="�����Ҿ�ͳ��" <%=dqmark%>>      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//����FormName:Form������
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("������[ǩԼʱ�� ]��");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "ǩԼʱ�� "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[ǩԼʱ�� ]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "ǩԼʱ�� "))) {
		return false;
	}

	if (lx=='jz')
	{
		FormName.action="dmcztjb.jsp";
		FormName.target="";
		FormName.submit();
		FormName.jzcz.disabled=true;
		return true;
	}
	else if (lx=='dmjj')
	{
		FormName.action="dmjjcztjb.jsp";
		FormName.target="";
		FormName.submit();
		FormName.jjcz.disabled=true;
		return true;
	}
	else if (lx=='fgsjj')
	{
		FormName.action="fgsjjcztjb.jsp";
		FormName.target="";
		FormName.submit();
		FormName.jjcz.disabled=true;
		return true;
	}
	else if (lx=='dqjj')
	{
		FormName.action="dqjjcztjb.jsp";
		FormName.target="";
		FormName.submit();
		FormName.jjcz.disabled=true;
		return true;
	}
}




//-->
</SCRIPT>


