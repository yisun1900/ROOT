<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String lrbm=(String)session.getAttribute("dwbh");
String khbh=request.getParameter("khbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
//ResultSet rs=null;
String ls_sql=null;
String lflxbm=null;
String smmb=null;
java.util.Date jhsmsj=null;
String jhsmry=null;
String khxm=null;
String fwdz=null;
String sjs=null;

String bz=null;

String lfjlh=null;

try {
	conn=cf.getConnection();


	ls_sql="select  khxm,fwdz,sjs";
	ls_sql+=" from  crm_zxkhxx ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
	}
	ps.close();
	rs.close();

	int count=0;
	ls_sql="select NVL(max(substr(lfjlh,8,2)),0)";
	ls_sql+=" from  crm_lfjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	lfjlh=khbh+cf.addZero(count+1,2);

}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<style type="text/css">
<!--
.STYLE1 {
	font-size: 16px;
	font-weight: bold;
	font-family: "����";
}
-->
</style>
<body>
<form name="editform" action="SaveLfCrm_lfjl.jsp" method="post" >
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="2" bgcolor="#CCCCCC" style="FONT-SIZE:12">
  <tr>
    <td height="20" colspan="4" bgcolor="#cccccc"><div align="center" class="STYLE1">��������¼��</div></td>
  </tr>
  <tr>
   
 
    <td height=25 align="right" bgcolor="#FFFFFF">�ͻ����</td>
    <td bgcolor="#FFFFFF"><%=khbh%></td>

	 <td width="18%" align="right" bgcolor="#FFFFFF">�ͻ�����       </td>
    <td width="32%" bgcolor="#FFFFFF"><%=khxm%></td>
   </tr>
  <tr height="25">
    <td width="18%" height="20" align="right" bgcolor="#FFFFFF">���ݵ�ַ       </td>
    <td width="32%" bgcolor="#FFFFFF"> <%=fwdz%> </td>

    <td height="20" align="right" bgcolor="#FFFFFF">���ʦ </td>
    <td bgcolor="#FFFFFF"><%=sjs%> </td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>ʵ������ʱ��</td>
    <td bgcolor="#FFFFFF"><input name="sjlfsj" type="text" onDblClick="JSCalendar(this)" value="<%=cf.today()%>" size="20" maxlength="10"/></td>
    <td align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>ʵ��������</td>
    <td bgcolor="#FFFFFF"><input name="sjlfr" type="text" size="20" maxlength="50" value="<%=yhmc%>"></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0033">*</font>�ƻ���ƽ��ͼʱ��</td>
    <td><input type="text" name="jhctsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right"><font color="#FF0033">*</font>�ƻ���Ч��ͼʱ��</td>
    <td><input type="text" name="jhcxgtsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0033">*</font>�ƻ���ʩ��ͼʱ��</td>
    <td><input type="text" name="jhcsgtsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right"><font color="#FF0033">*</font>�ƻ������ӱ���ʱ��</td>
    <td><input type="text" name="jhzbjsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">ǽ������</td>
    <td bgcolor="#FFFFFF"><select name="qtzl" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <option value="ǽ��˳ƽ">ǽ��˳ƽ</option>
		  <option value="ǽ�崹ƽ">ǽ�崹ƽ</option>
		  <option value="ǽ�岻ƽ">ǽ�岻ƽ</option>
		</select>	  
	</td>
    <td align="right" bgcolor="#FFFFFF">װ��Ԥ����</td>
    <td bgcolor="#FFFFFF"><input name="zxysje" type="text" size="20" maxlength="10"/></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">���͹��ܹ�ע��</td>
    <td bgcolor="#FFFFFF" colspan=3><textarea name="hxgngzd" cols="70"  rows="6"></textarea></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">��ע�ĸ�����</td>
    <td bgcolor="#FFFFFF" colspan=3><textarea name="gzngfj" cols="70" rows="3"></textarea></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">�������ע������</td>
    <td bgcolor="#FFFFFF" colspan=3><textarea name="gzdms" cols="70"  rows="6"></textarea></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">�����ע�㣨�š����ȣ�</td>
    <td bgcolor="#FFFFFF" colspan=3><textarea name="dxgzd" cols="70"  rows="6"></textarea></td>
  </tr>
  
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">�������������</td>
    <td bgcolor="#FFFFFF" colspan=3><textarea name="cfwsjcs" cols="70"  rows="6"></textarea></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#CC0000">*</font><font color="#0000FF">¼����</font></td>
    <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="10" readonly>
    </td>
    <td align="right"><font color="#CC0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
    <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
    </td>
  </tr>
  <tr bgcolor="#E8E8FF">
    <td align="right"><font color="#CC0000">*</font><font color="#0000CC">¼�벿��</font></td>
    <td><select name="lrbm" id="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
    </select></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">��ע</td>
    <td bgcolor="#FFFFFF" colspan=3><textarea name="bz" cols="70"  rows="5"></textarea></td>
  </tr>
  
	
    <td colspan="4" align="center"> 
       
		<input type="button" name="tj" value="����" onClick="f_do(editform)"/>
		<input type="button" name="sczp" value="�ϴ���Ƭ" onClick="sc()" />
		<input type="button" name="ckzp" value="�鿴��Ƭ" onClick="ck()" />
	  <input type="hidden" name="khbh" value="<%=khbh%>">     
	  <input type="hidden" name="lfjlh" value="<%=lfjlh%>">     
	  </td>
    </tr>
</table>
</form>
</body>
</html>


<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sjlfsj)=="") {
		alert("������[ʵ������ʱ��]��");
		FormName.sjlfsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjlfsj, "ʵ������ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sjlfr)=="") {
		alert("������[ʵ��������]��");
		FormName.sjlfr.focus();
		return false;
	}

	if(	javaTrim(FormName.jhctsj)=="") {
		alert("������[�ƻ���ƽ��ͼʱ��]��");
		FormName.jhctsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhctsj, "�ƻ���ƽ��ͼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jhcxgtsj)=="") {
		alert("������[�ƻ���Ч��ͼʱ��]��");
		FormName.jhcxgtsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhcxgtsj, "�ƻ���Ч��ͼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jhcsgtsj)=="") {
		alert("������[�ƻ���ʩ��ͼʱ��]��");
		FormName.jhcsgtsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhcsgtsj, "�ƻ���ʩ��ͼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jhzbjsj)=="") {
		alert("������[�ƻ������ӱ���ʱ��]��");
		FormName.jhzbjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhzbjsj, "�ƻ������ӱ���ʱ��"))) {
		return false;
	}

	if(!(isNumber(FormName.zxysje, "װ��Ԥ����"))) {
		return false;
	}
	
	FormName.sczp.disabled=false;
	FormName.tj.disabled=false;
	FormName.submit();
	return true;
	
}

function sc()
{
	var lfjlh=editform.lfjlh.value
	window.open("loadPhoto.jsp?lfjlh="+lfjlh);
}

function ck()
{
	var lfjlh=editform.lfjlh.value
	window.open("viewPhoto.jsp?lfjlh="+lfjlh);
}

</SCRIPT>





