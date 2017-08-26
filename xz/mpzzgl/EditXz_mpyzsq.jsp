<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sqxh=null;
String xm=null;
String zw=null;
String sqlrr=null;
String dh=null;
String yx=null;
String bz=null;
String dwbh=null;
String sqrq=null;
String yqjfrq=null;
String yqsl=null;
String sfywc=null;
String cz=null;
String ygbh=null;
String mpbb=null;
String wheresqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sqxh,xm,zw,sqlrr,dh,yx,bz,dwbh,sqrq ,yqjfrq,yqsl,sfywc,cz,ygbh,mpbb";
	ls_sql+=" from  xz_mpyzsq";
	ls_sql+=" where  (sqxh='"+wheresqxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sqxh=cf.fillNull(rs.getString("sqxh"));
		xm=cf.fillNull(rs.getString("xm"));
		zw=cf.fillNull(rs.getString("zw"));
		sqlrr=cf.fillNull(rs.getString("sqlrr"));
		dh=cf.fillNull(rs.getString("dh"));
		yx=cf.fillNull(rs.getString("yx"));
		bz=cf.fillNull(rs.getString("bz"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		yqsl=cf.fillNull(rs.getString("yqsl"));
		sfywc=cf.fillNull(rs.getString("sfywc"));
		cz=cf.fillNull(rs.getString("cz"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		mpbb=cf.fillNull(rs.getString("mpbb"));

		yqjfrq=cf.fillNull(rs.getDate("yqjfrq"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" >
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
%> 
</table>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸���Ƭӡ�����루������ţ�<%=wheresqxh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditXz_mpyzsq.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000FF">���벿��</font></td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%> 
                </select>
              </td>
              <td width="18%" align="right"><font color="#0000FF">����</font></td>
              <td width="32%"> 
                <input type="text" name="xm" size="20" maxlength="20"  value="<%=xm%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000FF">ְ��</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="zw" size="20" maxlength="20"  value="<%=zw%>" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000FF">�绰</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="dh" size="20" maxlength="30"  value="<%=dh%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000FF">��������</font></td>
              <td width="33%"> 
                <input type="text" name="sqrq" size="20" maxlength="10"  value="<%=sqrq%>" readonly>
              </td>
              <td width="18%" align="right"><font color="#0000FF">����¼����</font></td>
              <td width="32%"> 
                <input type="text" name="sqlrr" size="20" maxlength="30"  value="<%=sqlrr%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">����</td>
              <td width="33%"> 
                <input type="text" name="cz" size="20" maxlength="30" value="<%=cz%>" >
              </td>
              <td width="18%" align="right">����</td>
              <td width="32%"> 
                <input type="text" name="yx" size="20" maxlength="30"  value="<%=yx%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��Ƭ�汾</td>
              <td width="33%"> 
                <select name="mpbb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mpbb c1,mpbb c2 from xz_mpbb ",mpbb);
%> 
                </select>
              </td>
              <td width="18%">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">Ҫ������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="yqsl" size="20" maxlength="10"  value="<%=yqsl%>" >
              </td>
              <td width="18%"> 
                <div align="right">Ҫ�󽻸�����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="yqjfrq" value="<%=yqjfrq%>"  size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="67" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" > 
                <input type="hidden" name="wheresqxh"  value="<%=wheresqxh%>" >
                <input type="button"  value="����" onClick="f_do(editform)">
                <input type="reset"  value="����">
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
	if(	javaTrim(FormName.xm)=="") {
		alert("������[����]��");
		FormName.xm.focus();
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

	if(	javaTrim(FormName.zw)=="") {
		alert("������[ְ��]��");
		FormName.zw.focus();
		return false;
	}
	if(	javaTrim(FormName.sqlrr)=="") {
		alert("������[�ֻ�]��");
		FormName.sqlrr.focus();
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


