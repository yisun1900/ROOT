<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

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
String sqrq=null;
String clzt=null;
String wheresqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fgsbh,ygbh,yhmc,xb,yfgsbh,ydwbh,yxzzwbm,yrzsj,ylzrq,ylzyy,xdwbh,xxzzwbm,xrzyy,lrr,lrsj,lrbm,bz,sqrq,clzt ";
	ls_sql+=" from  rs_ecrzsqd";
	ls_sql+=" where  (sqxh='"+wheresqxh+"')  ";
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
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		clzt=cf.fillNull(rs.getString("clzt"));
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

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_ecrzsqd.jsp" name="editform">
  <div align="center">�޸����루������ţ�<%=wheresqxh%>��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">�걨��˾</font></td>
      <td width="32%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%> 
        </select>
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">Ա�����</font></td>
      <td width="32%"> 
        <input type="text" name="ygbh" size="20" maxlength="8"  value="<%=ygbh%>" readonly>
      </td>
      <td align="right" width="18%"><font color="#0000CC">Ա������</font></td>
      <td width="32%"> 
        <input type="text" name="yhmc" size="20" maxlength="50"  value="<%=yhmc%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">�Ա�</font></td>
      <td width="32%"><%
	cf.radioToken(out, "xb","M+��&W+Ů",xb,true);
%> </td>
      <td align="right" width="18%"><font color="#0000CC">ԭ�ֹ�˾</font></td>
      <td width="32%"> 
        <select name="yfgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+yfgsbh+"'",yfgsbh);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">ԭ����</font></td>
      <td width="32%"> 
        <select name="ydwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ydwbh+"'",ydwbh);
%> 
        </select>
      </td>
      <td align="right" width="18%"><font color="#0000CC">ԭְλ</font></td>
      <td width="32%"> 
        <select name="yxzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm where xzzwmc='"+yxzzwbm+"'","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">�ϴ���ְ����</font></td>
      <td width="32%"> 
        <input type="text" name="yrzsj" size="20" maxlength="10"  value="<%=yrzsj%>" readonly>
      </td>
      <td align="right" width="18%"><font color="#0000CC">��ְ����</font></td>
      <td width="32%"> 
        <input type="text" name="ylzrq" size="20" maxlength="10"  value="<%=ylzrq%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">��ְԭ��</font></td>
      <td colspan="3"> 
        <textarea name="ylzyy" cols="73" rows="3"><%=ylzyy%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4" height="23">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><font color="#CC0000">*</font>����״̬</td>
      <td width="32%">
        <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
<%
	cf.selectToken(out,"00+��������&01+�ȴ�����",clzt);
%> 
        </select>
      </td>
      <td align="right" rowspan="4"><font color="#CC0000">*</font>ѡ����������</td>
      <td rowspan="4"><%
	cf.mutilCheckedItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='06' and ztbm not in('0698','0699') order by ztbm","ztbm","select rs_ecrzsqsplc.ztbm,ztmc from rs_ztbm,rs_ecrzsqsplc where rs_ztbm.ztbm=rs_ecrzsqsplc.ztbm and rs_ecrzsqsplc.sqxh='"+wheresqxh+"'  order by rs_ecrzsqsplc.ztbm","2");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>���������ְ����</td>
      <td width="32%"> 
        <select name="xdwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' and ssfgs='"+fgsbh+"' order by ssfgs,dwlx,dwbh",xdwbh);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>���������ְְλ</td>
      <td width="32%"> 
        <select name="xxzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc",xxzzwbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>��������</td>
      <td width="32%"> 
        <input type="text" name="sqrq" size="20" maxlength="10"  value="<%=sqrq%>" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">������ְԭ��</td>
      <td colspan="3"> 
        <textarea name="xrzyy" cols="73" rows="3"><%=xrzyy%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">¼����</font></td>
      <td width="32%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="32%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">¼�벿��</font></td>
      <td width="32%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
        </select>
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="hidden" name="wheresqxh"  value="<%=wheresqxh%>" >
          <input type="button"  value="����" onClick="f_do(editform)">
          <input type="reset"  value="����">
        </div>
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.clzt)=="") {
		alert("������[����״̬]��");
		FormName.clzt.focus();
		return false;
	}

	if (FormName.clzt.value=="01")
	{
		if(	!radioChecked(FormName.ztbm)) {
			alert("��ѡ��[��������]��");
			FormName.ztbm[0].focus();
			return false;
		}
	}
	else{
		if(	radioChecked(FormName.ztbm)) {
			alert("��������������ѡ��[��������]��");
			FormName.ztbm[0].focus();
			return false;
		}
	}

	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�걨��˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "Ա�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrzsj, "�ϴ���ְ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.ylzrq, "��ְ����"))) {
		return false;
	}
	if(	javaTrim(FormName.xdwbh)=="") {
		alert("��ѡ��[���������ְ����]��");
		FormName.xdwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xxzzwbm)=="") {
		alert("��ѡ��[���������ְְλ]��");
		FormName.xxzzwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xrzyy)=="") {
		alert("������[������ְԭ��]��");
		FormName.xrzyy.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
