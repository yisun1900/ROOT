<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000;
	font-weight: bold;
	font-size: 16px;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String bmmc=null;//��������
String bmrs=null;//��������

int zqs=0;
String date_ss=null;//���ܿ�ʼʱ��
String date_se=null;//���ܽ���ʱ��
String date_bs=null;//���ܿ�ʼʱ��
String date_be=null;//���ܽ���ʱ��


try {
	conn=cf.getConnection();

	//��ѯ����
	ls_sql="SELECT zqs,yy_rqsd_szs,yy_rqsd_sze,yy_rqsd_bzs,yy_rqsd_bze ";
	ls_sql+=" FROM yy_rqsd ";
	ls_sql+=" order by yy_rqsd_bzs desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		zqs=rs.getInt("zqs");
		date_ss=cf.fillNull(rs.getDate("yy_rqsd_szs"));
		date_se=cf.fillNull(rs.getDate("yy_rqsd_sze"));
		date_bs=cf.fillNull(rs.getDate("yy_rqsd_bzs"));
		date_be=cf.fillNull(rs.getDate("yy_rqsd_bze"));
	}
	rs.close();
	ps.close();

  	//�Ƿ�֮ǰ�Ѿ�¼��� 
	int count=0;
    ls_sql="SELECT count(*)";
	ls_sql+=" FROM YY_QTQD ";
	ls_sql+=" where zqs='"+zqs+"' and ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		count=rs.getInt(1);
    }
    rs.close();
	ps.close();

	if (count>0)
	{
		out.println("���Ѿ�¼�������ݣ��뵽��ά�����н����޸Ļ����ӣ�");
		return;
	}
	
 		
    //��ѯ������������
	ls_sql="SELECT dwmc";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bmmc=rs.getString("dwmc");
	}
	rs.close();
	ps.close();
	

	%>
	<form method="POST" name="listform" action="SaveInsertYy_qtqd.jsp" target="_blank" >
	  <table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
        <tr>
          <td height="37" colspan="14" align="center"><input type="button" value="����"  width="200" onClick="cf_submit(listform)" name="save">
          <span class="STYLE1">��ע�⣺��������Ҫ��һ��¼�꣬���ܿգ�</span> </td>
        </tr>
        <tr>
          <td height="41" colspan="14" align="center">��<%=bmmc%>����������¼�����������<%=zqs%>��
            <input type="hidden" name="ssfgs" value="<%=ssfgs%>">
            <input type="hidden" name="yy_qtqd_lrr" value="<%=yhmc%>">
              <input type="hidden" name="zqs" value="<%=zqs%>"></td>
        </tr>
        <tr>
          <td width="100" height="28" align="center">��������</td>
          <td colspan="3" align="center"><%=date_ss%>��<%=date_se%></td>
          <td width="114" align="center">��������</td>
          <td colspan="3"  align="center"><%=date_bs%>��<%=date_be%></td>
          <td width="67" colspan="2" align="center">��λ����</td>
        </tr>
        <tr>
          <td height="36" colspan="5" align="center">Ŀ��ͻ�����</td>
          <td colspan="5" align="center">��ȡ��������</td>
        </tr>
        <tr>
          <td width="100" height="42" align="center">���¼ƻ�</td>
          <td width="100" align="center">�����ۼ�</td>
          <td width="100" align="center">���ܼƻ�</td>
          <td width="100" align="center">�������</td>
          <td width="100" align="center">����Ԥ��</td>
          <td width="100" align="center">���¼ƻ�</td>
          <td width="100" align="center">�����ۼ�</td>
          <td width="100" align="center">���ܼƻ�</td>
          <td width="100" align="center">�������</td>
          <td width="100" align="center">����Ԥ��</td>
        </tr>
        <tr align="center">
          <td><input type="text" name="yy_qtqdkh_byjh" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
          <td ><input type="text" name="yy_qtqdkh_bylj" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onChange="calValue(insertform)"></td>
          <td ><input type="text" name="yy_qtqdkh_szjh" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
          <td ><input type="text" name="yy_qtqdkh_szwc" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
          <td ><input type="text" name="yy_qtqdkh_bzyj" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
          <td ><input type="text" name="yy_qtqddj_byjh" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
          <td ><input type="text" name="yy_qtqddj_bylj" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
          <td ><input type="text" name="yy_qtqddj_szjh" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
          <td ><input type="text" name="yy_qtqddj_szwc" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
          <td ><input type="text" name="yy_qtqddj_bzyj" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
        </tr>
      </table>
	</form>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("sql: " + ls_sql);
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

</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--
function cf_submit(FormName)
{
	if(	javaTrim(FormName.zqs)=="") {
		alert("������[������]��");
		FormName.zqs.focus();
		return false;
	}
	if(!(isNumber(FormName.zqs, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}

	if(	javaTrim(FormName.yy_qtqdkh_byjh)=="") {
		alert("������[Ŀ��ͻ��������¼ƻ�]��");
		FormName.yy_qtqdkh_byjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_byjh, "Ŀ��ͻ��������¼ƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqdkh_bylj)=="") {
		alert("������[Ŀ��ͻ����������ۼ�]��");
		FormName.yy_qtqdkh_bylj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_bylj, "Ŀ��ͻ����������ۼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqdkh_szjh)=="") {
		alert("������[Ŀ��ͻ��������ܼƻ�]��");
		FormName.yy_qtqdkh_szjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_szjh, "Ŀ��ͻ��������ܼƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqdkh_szwc)=="") {
		alert("������[Ŀ��ͻ������������]��");
		FormName.yy_qtqdkh_szwc.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_szwc, "Ŀ��ͻ������������"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqdkh_bzyj)=="") {
		alert("������[Ŀ��ͻ���������Ԥ��]��");
		FormName.yy_qtqdkh_bzyj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_bzyj, "Ŀ��ͻ���������Ԥ��"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_byjh)=="") {
		alert("������[��ȡ�����������¼ƻ�]��");
		FormName.yy_qtqddj_byjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_byjh, "��ȡ�����������¼ƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_bylj)=="") {
		alert("������[��ȡ�������������ۼ�]��");
		FormName.yy_qtqddj_bylj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_bylj, "��ȡ�������������ۼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_szjh)=="") {
		alert("������[��ȡ�����������ܼƻ�]��");
		FormName.yy_qtqddj_szjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_szjh, "��ȡ�����������ܼƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_szwc)=="") {
		alert("������[��ȡ���������������]��");
		FormName.yy_qtqddj_szwc.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_szwc, "��ȡ���������������"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_bzyj)=="") {
		alert("������[��ȡ������������Ԥ��]��");
		FormName.yy_qtqddj_bzyj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_bzyj, "��ȡ������������Ԥ��"))) {
		return false;
	}

	FormName.submit();
	return true;
} 

//-->
</script>

