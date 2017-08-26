<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
%>

<%
String sqxh=null;
String ycsj=null;
String fhsj=null;
String ycsy=null;
String mdd=null;
String gls=null;
String dwmc=null;
String sqr=null;
String lxfs=null;
String sqrq=null;
String clzt=null;
String qcph=null;
String pzr=null;
String pzsj=null;
String lrr=null;
String lrsj=null;
String bz=null;
String sjxm=null;
String wheresqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sqxh,ycsj,fhsj,ycsy,mdd,gls,dwmc,sqr,lxfs,sqrq,clzt,qcph,pzr,pzsj,lrr,lrsj,xz_pcsq.bz,sjxm ";
	ls_sql+=" from  xz_pcsq,sq_dwxx";
	ls_sql+=" where xz_pcsq.dwbh=sq_dwxx.dwbh and  (sqxh="+wheresqxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sqxh=cf.fillNull(rs.getString("sqxh"));
		ycsj=cf.fillNull(rs.getString("ycsj"));
		fhsj=cf.fillNull(rs.getString("fhsj"));
		ycsy=cf.fillNull(rs.getString("ycsy"));
		mdd=cf.fillNull(rs.getString("mdd"));
		gls=cf.fillNull(rs.getString("gls"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sqr=cf.fillNull(rs.getString("sqr"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		clzt=cf.fillNull(rs.getString("clzt"));
		qcph=cf.fillNull(rs.getString("qcph"));
		pzr=cf.fillNull(rs.getString("pzr"));
		pzsj=cf.fillNull(rs.getDate("pzsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		sjxm=cf.fillNull(rs.getString("sjxm"));
	}
	rs.close();
	ps.close();
	if (pzsj.equals(""))
	{
		pzsj=cf.today();
	}
	if (pzr.equals(""))
	{
		pzr=yhmc;
	}
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
<title>����ɳ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="100%" > 
      <div align="center"> 
        <form method="post" action="SaveShXz_pcsq.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td bgcolor="#99FFCC" colspan="4"> 
              <p align="center"><font size="5">�ɳ�</font>��������ţ�<%=sqxh%>��              </td>
            </tr>
            <tr> 
              <td width="17%" bgcolor="#99FFCC"> 
                <div align="right">���벿��</div>              </td>
              <td width="35%" bgcolor="#99FFCC"><%=dwmc%> </td>
              <td width="18%" bgcolor="#99FFCC"> 
                <div align="right">��������</div>              </td>
              <td width="35%" bgcolor="#99FFCC"><%=sqrq%> </td>
            </tr>
            <tr> 
              <td width="17%" bgcolor="#99FFCC"> 
                <div align="right">������</div>              </td>
              <td width="35%" bgcolor="#99FFCC"> <%=sqr%> </td>
              <td width="18%" bgcolor="#99FFCC"> 
                <div align="right">��ϵ��ʽ</div>              </td>
              <td width="35%" bgcolor="#99FFCC"><%=lxfs%> </td>
            </tr>
            <tr> 
              <td width="17%" bgcolor="#99FFCC" align="right">�ó�����</td>
              <td colspan="3" bgcolor="#99FFCC"><%=ycsy%></td>
            </tr>
            <tr> 
              <td width="17%" bgcolor="#99FFCC"> 
                <div align="right">Ŀ�ĵ�</div>              </td>
              <td width="35%" bgcolor="#99FFCC"> <%=mdd%> </td>
              <td width="18%" bgcolor="#99FFCC"> 
                <div align="right">Ŀ�ĵع�����</div>              </td>
              <td width="35%" bgcolor="#99FFCC"><%=gls%> </td>
            </tr>
            <tr> 
              <td width="17%" bgcolor="#99FFCC"> 
                <div align="right">�ó�ʱ��</div>              </td>
              <td width="35%" bgcolor="#99FFCC"><%=ycsj%> </td>
              <td width="18%" bgcolor="#99FFCC"> 
                <div align="right">����ʱ��</div>              </td>
              <td width="35%" bgcolor="#99FFCC"><%=fhsj%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4"> 
              <p align="center"><font size="5">�����ɳ�����д</font>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><span class="STYLE1">*</span>�Ƿ�ͬ��</td>
              <td width="35%"><%
	cf.radioToken(out, "clzt","2+ͬ��&3+��ͬ��",clzt);
%></td>
              <td width="18%" align="right">������</td>
              <td width="35%"><input type="text" name="gls" size="20" maxlength="8"  value="<%=gls%>" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><span class="STYLE1">*</span>����</td>
              <td width="35%"> 
                <select name="qcph" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select qcph c1,qcph||'��'||qcxh c2 from xz_qcdm order by ssfgs,qcph",qcph);
	}
	else{
		cf.selectItem(out,"select qcph c1,qcph||'��'||qcxh c2 from xz_qcdm where ssfgs='"+ssfgs+"' order by ssfgs,qcph",qcph);
	}
%> 
                </select>              </td>
              <td width="18%" align="right"><span class="STYLE1">*</span>˾������</td>
              <td width="35%"> 
                <input type="text" name="sjxm" size="20" maxlength="20"  value="<%=sjxm%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><span class="STYLE1">*</span><span class="STYLE2">�ɳ���</span></td>
              <td width="35%"> 
                <input type="text" name="pzr" size="20" maxlength="20"  value="<%=pzr%>" readonly>              </td>
              <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">�ɳ�ʱ��</span></td>
              <td width="35%"> 
                <input type="text" name="pzsj" size="20" maxlength="10"  value="<%=pzsj%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��ע</td>
              <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
				<input type="hidden" name="wheresqxh"  value="<%=wheresqxh%>" >
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">              </td>
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
	if(	!radioChecked(FormName.clzt)) {
		alert("��ѡ��[�Ƿ�ͬ��]��");
		FormName.clzt[0].focus();
		return false;
	}
	if (FormName.clzt[0].checked)
	{
		if(	javaTrim(FormName.qcph)=="") {
			alert("��ѡ��[����]��");
			FormName.qcph.focus();
			return false;
		}
		if(	javaTrim(FormName.sjxm)=="") {
			alert("������[˾������]��");
			FormName.sjxm.focus();
			return false;
		}
	}
	else{
		FormName.qcph.value="";
		FormName.sjxm.value="";
	}

	if(	javaTrim(FormName.pzr)=="") {
		alert("������[�ɳ���]��");
		FormName.pzr.focus();
		return false;
	}
	if(	javaTrim(FormName.pzsj)=="") {
		alert("������[�ɳ�ʱ��]��");
		FormName.pzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pzsj, "�ɳ�ʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.gls, "������"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>

