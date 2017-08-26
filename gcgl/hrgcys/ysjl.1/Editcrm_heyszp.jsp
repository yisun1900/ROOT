<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��Ƭ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>


<%
String yhmc=(String)session.getAttribute("yhmc");

String yszpmc=request.getParameter("yszpmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String ysjlh=null;
String zpxm=null;
String zpml=null;
String zplx=null;
String zpsm=null;

String khbh=null;
String gcysxmmc=null;
String yssj=null;
String ysr=null;
String sjysjg=null;
String clbz=null;

String khxm=null;
String fwdz=null;
String sjs=null;
String sgdmc=null;
String zjxm=null;



try 
{
	conn=cf.getConnection();

	ls_sql="SELECT ysjlh,zpxm,zplx,zpml,zpsm";
	ls_sql+=" FROM crm_heyszp";
	ls_sql+=" where  yszpmc='"+yszpmc+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ysjlh=rs.getString("ysjlh");
		zpxm=cf.fillNull(rs.getString(2));
		zplx=cf.fillNull(rs.getString("zplx"));
		zpml=cf.fillNull(rs.getString("zpml"));
		zpsm=cf.fillNull(rs.getString("zpsm"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT khbh,gcysxmmc,yssj,ysr,DECODE(crm_heysjl.sjysjg,'0','�ϸ�','1','���ϸ�') sjysjg,DECODE(crm_heysjl.clbz,'9','¼��δ���','0','û����','1','����δ����','2','����','3','�ڴ���','4','�ѽ��','5','����ͨ��','6','����δͨ��') clbz";
	ls_sql+=" FROM crm_heysjl";
	ls_sql+=" where  ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		gcysxmmc=rs.getString("gcysxmmc");
		yssj=cf.fillNull(rs.getDate("yssj"));
		ysr=cf.fillNull(rs.getString("ysr"));
		sjysjg=cf.fillNull(rs.getString("sjysjg"));
		clbz=cf.fillNull(rs.getString("clbz"));
	}
	rs.close();
	ps.close();


	ls_sql="SELECT khxm,fwdz,sjs,sgdmc,zjxm";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
  out.print("������Ƭʧ�ܣ�Exception:" + e);
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
<CENTER><B>��Ƭ���</B>

<form method="post" action="" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	    
	    <tr bgcolor="#FFFFFF">
          <td align="right"> �ͻ���� </td>
	      <td><%=khbh%> </td>
	      <td align="right"> �ͻ����� </td>
	      <td><%=khxm%> </td>
      </tr>
	    <tr bgcolor="#FFFFFF">
          <td align="right"> ���ݵ�ַ </td>
	      <td><%=fwdz%> </td>
	      <td align="right"> ���ʦ </td>
	      <td><%=sjs%> </td>
      </tr>
	    <tr bgcolor="#FFFFFF">
          <td align="right"> ��Ŀ�ܼ� </td>
	      <td><%=sgdmc%> </td>
	      <td align="right"> Ʒ�� </td>
	      <td><%=zjxm%> </td>
      </tr>
	    <tr bgcolor="#FFFFFF">
          <td align="right">���ռ�¼��</td>
	      <td><%=ysjlh%></td>
	      <td align="right">������Ŀ����</td>
	      <td><%=gcysxmmc%></td>
      </tr>
	    
	    <tr bgcolor="#FFFFFF">
          <td align="right"> ��Ŀ����ʱ�� </td>
	      <td><%=yssj%> </td>
	      <td align="right"> ��Ŀ������ </td>
	      <td><%=ysr%> </td>
      </tr>
	    <tr bgcolor="#FFFFFF">
          <td align="right"> ��Ŀ���ս�� </td>
	      <td><%=sjysjg%>          </td>
	      <td align="right"> ���Ĵ���״̬ </td>
	      <td><%=clbz%>          </td>
      </tr>
	    <tr bgcolor="#FFFFFF">
	      <td width="18%" align="right" >�ļ�����</td>
	      <td width="32%" ><%=yszpmc%></td>
	      <td width="18%" align="right" >��Ƭ��Ӧ��Ŀ</td>
	      <td width="32%"   ><%=zpxm%></td>
      </tr>
	    <tr bgcolor="#FFFFFF">
	      <td align="right" >��Ƭ˵��</td>
	      <td ><%=zpsm%></td>
	      <td align="right" >&nbsp;</td>
	      <td   >&nbsp;</td>
      </tr>
	    <tr bgcolor="#FFFFFF">
	      <td align="right" ><span class="STYLE1">*</span>�ͻ��ɿ���Ƭ</td>
	      <td ><%
	cf.radioToken(out, "kkzpbz","0+���ɿ�&1+�ɿ�","");
%></td>
	      <td align="right" ><span class="STYLE1">*</span>�Ƿ�ϸ�</td>
	      <td   ><%
	cf.radioToken(out, "zpshbz","Y+�ϸ�&B+���ϸ�","");
%></td>
      </tr>
	    <tr bgcolor="#FFFFFF">
	      <td align="right" ><span class="STYLE1">*</span>�����</td>
	      <td ><input type="text" name="shr" size="20" maxlength="50"  value="<%=yhmc%>" readonly></td>
	      <td align="right" ><span class="STYLE1">*</span>���ʱ��</td>
	      <td   ><input type="text" name="shsj" size="20" maxlength="10"  value="<%=cf.getDate()%>" readonly></td>
      </tr>

	    <tr bgcolor="#FFFFFF">
	      <td height="36" align="right" >���˵��</td>
          <td height="36" colspan="3" ><textarea name="shsm" cols="71" rows="3"></textarea></td>
      </tr>
      <tr bgcolor="#FFFFFF">
	<td height="36" colspan="4" align="center" > 
		<input type="hidden" name="ysjlh" value="<%=ysjlh%>">
		<input type="hidden" name="yszpmc" value="<%=yszpmc%>">
		<input type=button value='����' onClick="f_xg(editform)">	</td>
	</tr>
	    <tr bgcolor="#FFFFFF">
	      <td colspan="4" align="center"><img src="/yblimg/gcys/<%=zpml%>/<%=yszpmc%>" ></td>
      </tr>
</table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_xg(FormName)
{

	if(	javaTrim(FormName.shsj)=="") {
		alert("������[���ʱ��]��");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "���ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.shr)=="") {
		alert("������[�����]��");
		FormName.shr.focus();
		return false;
	}

	if(	!radioChecked(FormName.kkzpbz)) {
		alert("��ѡ��[�ͻ��ɿ���Ƭ]��");
		FormName.kkzpbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zpshbz)) {
		alert("��ѡ��[�Ƿ�ϸ�]��");
		FormName.zpshbz[0].focus();
		return false;
	}
	if (FormName.zpshbz[1].checked)
	{
		if(	javaTrim(FormName.shsm)=="") {
			alert("������[���˵��]��");
			FormName.shsm.focus();
			return false;
		}

		if (FormName.kkzpbz[1].checked)
		{
			alert("������Ƭ���ϸ�ͻ����ܿ���");
			FormName.kkzpbz[0].focus();
			return false;
		}
	}

	FormName.action="SaveEditCrm_heyszp.jsp";
	FormName.submit();
	return true;

} 
//-->
</script>