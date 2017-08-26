<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dwbh=null;
String zw=null;
String dh=null;
String bgdh=null;
String yjdz=null;
String xm=null;
String ssfgs=null;
String ygbh=null;
ygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

int count=0;

try {
	conn=cf.getConnection();
	ls_sql="select sq_yhxx.ssfgs,sq_dwxx.dwbh as dwbh,dm_zwbm.zwmc as zwmc,sq_yhxx.dh as dh,sq_yhxx.bgdh,sq_yhxx.email as email,sq_yhxx.yhmc as yhmc";
	ls_sql+=" from sq_yhxx,sq_dwxx,dm_zwbm  ";
    ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh  and sq_yhxx.zwbm=dm_zwbm.zwbm(+)";
	ls_sql+=" and sq_yhxx.ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		zw=cf.fillNull(rs.getString("zwmc"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dh=cf.fillNull(rs.getString("dh"));
		bgdh=cf.fillNull(rs.getString("bgdh"));
		yjdz=cf.fillNull(rs.getString("email"));
		xm=cf.fillNull(rs.getString("yhmc"));
	}
	rs.close();
	ps.close();

	ls_sql="select count(*)";
	ls_sql+=" from xz_mpyzsq";
    ls_sql+=" where ygbh='"+ygbh+"'";
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
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<%
if (count>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">�������</td>
	<td  width="7%">�Ƿ����</td>
	<td  width="7%">����</td>
	<td  width="7%">��Ƭ�汾</td>
	<td  width="7%">Ҫ������</td>
	<td  width="10%">Ҫ�󽻸�����</td>
	<td  width="7%">�������</td>
	<td  width="8%">���ʱ��</td>
	<td  width="10%">��������</td>
	<td  width="7%">¼����</td>
	<td  width="21%">��ע</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT sqxh,DECODE(xz_mpyzsq.sfywc,'Y','��','N','��') as sfywc,xm,mpbb,yqsl,yqjfrq,wcsl,wcsj,sqrq,sqlrr,bz    ";
	ls_sql+=" FROM xz_mpyzsq  ";
    ls_sql+=" where ygbh='"+ygbh+"'";
	ls_sql+=" order by  xz_mpyzsq.yqjfrq ";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
	pageObj.alignStr[9]="align='left'";

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
}
%> 
</table>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">��Ƭӡ������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertXz_mpyzsq.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">���벿��</div>
              </td>
              <td width="31%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right">����</div>
              </td>
              <td width="30%"> 
                <input type="text" name="xm" value="<%=xm%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">ְ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="zw" value="<%=zw%>" size="20" maxlength="20" >
              </td>
              <td width="20%"> 
                <div align="right">����</div>
              </td>
              <td width="30%"> 
                <input type="text" name="yx" value="<%=yjdz%>" size="20" maxlength="30" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�ֻ�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="dh" value="<%=dh%>" size="20" maxlength="50" >
              </td>
              <td width="20%"> 
                <div align="right">�칫�绰</div>
              </td>
              <td width="30%">
                <input type="text" name="bgdh" value="<%=bgdh%>" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">����</td>
              <td width="31%"> 
                <input type="text" name="cz" size="20" maxlength="30" >
              </td>
              <td width="20%" align="right">��Ƭ�汾</td>
              <td width="30%"> 
                <select name="mpbb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mpbb c1,mpbb c2 from xz_mpbb ","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sqrq" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
              <td width="20%"> 
                <div align="right">����¼����</div>
              </td>
              <td width="30%"> 
                <input type="text" name="sqlrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">Ҫ���������У�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="yqsl" value="" size="20" maxlength="15" >
              </td>
              <td width="20%"> 
                <div align="right">Ҫ�󽻸�����</div>
              </td>
              <td width="30%"> 
                <input type="text" name="yqjfrq" value="<%=cf.addDay(7)%>"  size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="67" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="ygbh" value="<%=ygbh%>">
                <input type="hidden" name="ssfgs" value="<%=ssfgs%>">
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
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
	if(	javaTrim(FormName.xm)=="") {
		alert("������[����]��");
		FormName.xm.focus();
		return false;
	}
	if(	javaTrim(FormName.zw)=="") {
		alert("������[ְ��]��");
		FormName.zw.focus();
		return false;
	}
	if(	javaTrim(FormName.dh)=="") {
		alert("������[�绰]��");
		FormName.dh.focus();
		return false;
	}
	if(	javaTrim(FormName.cz)=="") {
		alert("������[����]��");
		FormName.cz.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[���벿��]��");
		FormName.dwbh.focus();
		return false;
	}
 	if(	javaTrim(FormName.yx)=="") {
		alert("������[����]��");
		FormName.yx.focus();
		return false;
	}
   if(!(isEmail(FormName.yx, "����"))) {
		return false;
	}

	if(	javaTrim(FormName.sqrq)=="") {
		alert("������[��������]��");
		FormName.sqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.yqjfrq, "Ҫ�󽻸�����"))) {
		return false;
	}
	if(	javaTrim(FormName.yqsl)=="") {
		alert("��ѡ��[Ҫ������]��");
		FormName.yqsl.focus();
		return false;
	}
 
	if(!(isInt(FormName.yqsl, "Ҫ������"))) {
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>


