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
String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");

String nian=request.getParameter("nian");
String yue=request.getParameter("yue");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int count=0;
try {
	conn=cf.getConnection();

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
      <td align="right" width="30%" height="42">�ֹ�˾</td>
      <td height="42" colspan="3" width="70%"> 
        <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dwstr%>)">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
        </select>
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
        <input type="text" name="sjfw" size="11" maxlength="10" value='<%=cf.firstDay(nian,yue)%>' ondblclick="JSCalendar(this)">
        ----&gt; �� 
        <input type="text" name="sjfw2" size="11" maxlength="10"  value='<%=cf.lastDay(nian,yue)%>' ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="46">���ᵱ��ҵ��</td>
      <td height="46" colspan="3" width="70%"> 
<%
	if (yhjs.equals("F1") || yhjs.equals("F2"))
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
    </tr>
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
        <input type="button"  value="��װͳ��" onClick="f_do(selectform,'jz')">
		 <input type="button"  value="�Ҿ�ͳ��" onClick="f_do(selectform,'jj')">
        <input type="button"  value="������֤ͳ��" onClick="f_do(selectform,'fj')" name="button">
        <input type="reset"  value="����">
<%
	if (yhjs.equals("F1") || yhjs.equals("F2"))
	{
		%>
        <input type="reset"  value="ɾ������"  onClick="f_sc(selectform)" disabled>
		<%
	}
	else{
		%>
        <input type="reset"  value="ɾ������"  onClick="f_sc(selectform)">
		<%
	}
%>
      </td>
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
	}
	else if (lx=='jj')
	{
		FormName.action="dmjjcztjb.jsp";
	}
	else if (lx=='fj')
	{
		FormName.action="dmfjtjb.jsp";
	}
	FormName.target="";
	FormName.submit();
	return true;
}

function f_sc(FormName)//����FormName:Form������
{
	FormName.action="DeleteYjdj.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>