<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<HTML>
<HEAD>
<TITLE>��������</TITLE>
</HEAD>

<BODY> 

<%
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");

String xh=request.getParameter("xh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String mac="";
String bjhm="";
String yhbm="";
String ssfgs="";
String ldzdly="";//�����Զ�¼��
String qdzdly="";//ȥ���Զ�¼��

String ldhm="";
String khbh="";
String lywjml="";
String lywj="";


String	khxm="";
String	xb="";
String	fwdz="";
String	sjs="";
String	zjxm="";
String	sgdmc="";

String	tsjlh="";
String	tsbxsj="";
String	tsnr="";

try {
	conn=cf.getConnection();


	ls_sql="select mac,bjhm,yhbm,ssfgs,ldzdly,qdzdly";
	ls_sql+=" from  call_init";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mac=cf.fillNull(rs.getString("mac"));
		bjhm=cf.fillNull(rs.getString("bjhm"));
		yhbm=cf.fillNull(rs.getString("yhbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		ldzdly=cf.fillNull(rs.getString("ldzdly"));
		qdzdly=cf.fillNull(rs.getString("qdzdly"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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


<div align="center">�������ģ�������kk</div>
<table width="100%" border="1" cellpadding="1" cellspacing="1">
  <tr>
    <td align="center">ժ/�һ�</td>
    <td height="52"><input type="button" value="ժ��" name="zjBT" onClick="zjHMBT()">
        <input type="button" value="�һ�" name="gjBT" onClick="gjHMBT()" disabled></td>
  </tr>
  <tr>
    <td width="15%" align="center">����</td>
    <td width="85%" height="52"> ���к��룺
      <input name="outnum" type="text" value="13601167422" size="20" maxlength="20">
        <input type="button" value="����" name="DialBT" onClick="DialNmb()" disabled>
        <input name="button" type="button" onClick="window.open('cxkh.jsp','','height=600,width=800,top=60,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" value="���ҿͻ�" ></td>
  </tr>
</table>
  


<P><br>
</P>
</BODY>
</HTML>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">


//ժ��
function zjHMBT()
{
	var callMark=parent.menu.callMark;

	if (callMark==0 || callMark==1 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:����δ��ͨ;4:ͨ����Է��һ�;5:ͨ���󱾻��һ�
	{
		zjBT.disabled=true;

		parent.menu.zjHM();

		gjBT.disabled=false;
		DialBT.disabled=false;
	}
	else{
		alert("����δ�һ�������ժ��");
		return;
	}
}

//�һ�
function gjHMBT()
{
	var callMark=parent.menu.callMark;

	if (callMark==6 || callMark==13)//3:����δ��ͨ;4:ͨ����Է��һ�;5:ͨ���󱾻��һ�
	{
		gjBT.disabled=true;

		parent.menu.gjHM();

		zjBT.disabled=false;
	}
	else{
		alert("���󣡲��ܹһ�");
		return;
	}
}


//����
function DialNmb()
{
	var callMark=parent.menu.callMark;

	if (outnum.value=="")
	{
		alert("������������к���");
		outnum.select();
		return;
	}
	else{
		if (callMark!=6 )//3:����δ��ͨ;4:ͨ����Է��һ�;5:ͨ���󱾻��һ�
		{
			alert("����δժ��");
			return;
		}

		DialBT.disabled=true;

		parent.menu.DialNmb(outnum.value);


	}

}




</SCRIPT>
