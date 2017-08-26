<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String shr=(String)session.getAttribute("yhmc");

String fgsbh=null;
String ygbh=null;
String yhmc=null;
String xb=null;
String yfgsbh=null;
String ydwbh=null;
String yxzzwbm=null;
String yrzsj=null;
String ylzrq=null;
String ylzyy=null;
String xdwbh=null;
String xxzzwbm=null;
String xrzyy=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String clzt=null;
String ztbm=null;
String sqrq=null;

String ecrzsqsplc="";

String sqxh=cf.GB2Uni(request.getParameter("sqxh"));
String spztbm=cf.GB2Uni(request.getParameter("ztbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fgsbh,ygbh,yhmc,xb,yfgsbh,ydwbh,yxzzwbm,yrzsj,ylzrq,ylzyy,xdwbh,xxzzwbm,xrzyy,lrr,lrsj,lrbm,bz,clzt,ztbm,sqrq ";
	ls_sql+=" from  rs_ecrzsqd";
	ls_sql+=" where sqxh='"+sqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		xb=cf.fillNull(rs.getString("xb"));
		yfgsbh=cf.fillNull(rs.getString("yfgsbh"));
		ydwbh=cf.fillNull(rs.getString("ydwbh"));
		yxzzwbm=cf.fillNull(rs.getString("yxzzwbm"));
		yrzsj=cf.fillNull(rs.getDate("yrzsj"));
		ylzrq=cf.fillNull(rs.getDate("ylzrq"));
		ylzyy=cf.fillNull(rs.getString("ylzyy"));
		xdwbh=cf.fillNull(rs.getString("xdwbh"));
		xxzzwbm=cf.fillNull(rs.getString("xxzzwbm"));
		xrzyy=cf.fillNull(rs.getString("xrzyy"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		clzt=cf.fillNull(rs.getString("clzt"));
		ztbm=cf.fillNull(rs.getString("ztbm"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
	}
	rs.close();
	ps.close();

	if (!ztbm.equals(spztbm))
	{
		out.println("���󣡡�����״̬���Ѹı�");
		return;
	}

	String ztmc=null;
	ls_sql="select ztmc";
	ls_sql+=" from  rs_ecrzsqsplc,rs_ztbm";
	ls_sql+=" where rs_ecrzsqsplc.ztbm=rs_ztbm.ztbm and rs_ecrzsqsplc.sqxh='"+sqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ztmc=cf.fillNull(rs.getString("ztmc"));

		ecrzsqsplc+="-->"+ztmc;
	}
	rs.close();
	ps.close();
	if (!ecrzsqsplc.equals(""))
	{
		ecrzsqsplc=ecrzsqsplc.substring(3);
	}
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

<html>
<head>
<title>������ְ��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveSpRs_ecrzsqd.jsp" name="editform">
  <div align="center">
    ������ְ����������������ţ�<%=sqxh%>��
    <BR>
    <b><font color="#FF0000">���ѣ�����ͨ�����뵽��</font>���¹���>Ա������>��ְ��>��ְ<font color="#FF0000">������������ְ</font></b> 
  </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">�걨��˾</font></td>
      <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
%> </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">Ա�����</font></td>
      <td width="32%"><%=ygbh%> </td>
      <td align="right" width="18%"><font color="#0000CC">Ա������</font></td>
      <td width="32%"><%=yhmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">�Ա�</font></td>
      <td width="32%"><%
	cf.radioToken(out, "xb","M+��&W+Ů",xb,true);
%> </td>
      <td align="right" width="18%"><font color="#0000CC">ԭ�ֹ�˾</font></td>
      <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+yfgsbh+"'",yfgsbh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">ԭ����</font></td>
      <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ydwbh+"'",ydwbh,true);
%> </td>
      <td align="right" width="18%"><font color="#0000CC">ԭְλ</font></td>
      <td width="32%"><%=yxzzwbm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">�ϴ���ְ����</font></td>
      <td width="32%"><%=yrzsj%> </td>
      <td align="right" width="18%"><font color="#0000CC">��ְ����</font></td>
      <td width="32%"><%=ylzrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">��ְԭ��</font></td>
      <td colspan="3"><%=ylzyy%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4" height="23">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">����״̬</font></td>
      <td width="32%"> <%
	cf.selectToken(out,"00+��������&01+�ȴ�����&02+��������&03+����ͨ��&04+����ȡ��",clzt,true);
%> </td>
      <td align="right" width="18%"><font color="#0000CC">����״̬</font></td>
      <td width="32%"> <%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztbm='"+ztbm+"'",ztbm,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">���������ְ����</font></td>
      <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+xdwbh+"'",xdwbh,true);
%> </td>
      <td align="right" width="18%"><font color="#0000CC">���������ְְλ</font></td>
      <td width="32%"><%=xxzzwbm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">������ְԭ��</font></td>
      <td colspan="3"><%=xrzyy%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">¼����</font></td>
      <td width="32%"><%=lrr%> </td>
      <td align="right" width="18%"><font color="#0000CC">¼��ʱ��</font></td>
      <td width="32%"><%=lrsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">¼�벿��</font></td>
      <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%> </td>
      <td align="right" width="18%"><font color="#0000CC">��������</font></td>
      <td width="32%"><%=sqrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">��ע</font></td>
      <td colspan="3"><%=bz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><b>������ְ��������</b></td>
      <td colspan="3"><%=ecrzsqsplc%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4" height="34">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">�����</font></td>
      <td width="32%"> 
        <input type="text" name="shr" size="20" maxlength="20"  value="<%=shr%>" readonly>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">���ʱ��</font></td>
      <td width="32%"> 
        <input type="text" name="shsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>��˽���</td>
      <td width="32%"> 
        <select name="shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select rs_shjlbm.shjl,shjlmc from rs_shjlbm,rs_shztlc where rs_shjlbm.shjl=rs_shztlc.shjl and rs_shztlc.ztbm='"+ztbm+"' order by rs_shjlbm.shjl","");
%> 
        </select>
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">������</td>
      <td colspan="3"> 
        <textarea name="shyj" cols="73" rows="3"></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="hidden" name="sqxh"  value="<%=sqxh%>" >
          <input type="hidden" name="ztbm"  value="<%=ztbm%>" >
          <input type="button"  value="����" onClick="f_do(editform)">
          <input type="reset"  value="����">
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.shr)=="") {
		alert("������[�����]��");
		FormName.shr.focus();
		return false;
	}
	if(	javaTrim(FormName.shsj)=="") {
		alert("������[���ʱ��]��");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "���ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.shjl)=="") {
		alert("��ѡ��[��˽���]��");
		FormName.shjl.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
