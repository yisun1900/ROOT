<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dqbm=null;
String bjjbbm=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double bj=0;
double clbj=0;
double rgbj=0;
double jxbj=0;
String gycl=null;
String xh=null;
String zdyxmyxq=null;
String flmcgg=null;
String bz=null;
String sfxycl=null;
String sfxyyjd=null;
int sqjl=0;
String shbz=null;
double zcf=0;
double shf=0;
double ysf=0;
double qtf=0;
String xmflbm=null;
double sgcbj=0;
double sgdbj=0;

String lrr=cf.GB2Uni(request.getParameter("lrr"));
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,bjjbbm,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,bj,clbj,rgbj,jxbj,gycl,xh,zdyxmyxq,sqjl,shbz,flmcgg,bz,sfxycl,sfxyyjd";
	ls_sql+=" ,xmflbm,sgcbj,sgdbj,zcf,shf,ysf,qtf ";
	ls_sql+=" from  bj_zdyxmb";
	ls_sql+=" where  lrr='"+lrr+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmflbm=cf.fillNull(rs.getString("xmflbm"));
		sgcbj=rs.getDouble("sgcbj");
		sgdbj=rs.getDouble("sgdbj");
		zcf=rs.getDouble("zcf");
		shf=rs.getDouble("shf");
		ysf=rs.getDouble("ysf");
		qtf=rs.getDouble("qtf");

		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		smbm=cf.fillNull(rs.getString("smbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		bj=rs.getDouble("bj");
		clbj=rs.getDouble("clbj");
		rgbj=rs.getDouble("rgbj");
		jxbj=rs.getDouble("jxbj");
		gycl=cf.fillNull(rs.getString("gycl"));
		xh=cf.fillNull(rs.getString("xh"));
		zdyxmyxq=cf.fillNull(rs.getDate("zdyxmyxq"));
		sqjl=rs.getInt("sqjl");
		shbz=cf.fillNull(rs.getString("shbz"));
		flmcgg=cf.fillNull(rs.getString("flmcgg"));
		bz=cf.fillNull(rs.getString("bz"));
		sfxycl=cf.fillNull(rs.getString("sfxycl"));
		sfxyyjd=cf.fillNull(rs.getString("sfxyyjd"));
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
<title>�Զ�����Ŀ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�Զ�����Ŀ��ˣ���Ŀ��ţ�<%=xmbh%>��</div>    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveShBj_zdyxmb.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><span class="STYLE1"><font color="#CC0000">*</font>����</span></td>
              <td width="34%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm,false);
%> 
                </select>              </td>
              <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><span class="STYLE1">���ۼ���</span></td>
              <td width="34%"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm,false);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>��Ŀ����</td>
              <td><select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm where xmdlbm='"+xmdlbm+"'",xmdlbm);
%>
                </select>              </td>
              <td align="right"><font color="#CC0000">*</font>��ĿС��</td>
              <td><select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm where xmxlbm='"+xmxlbm+"'",xmxlbm);
%>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" >��Ŀ����</td>
              <td colspan="3"  ><select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select xmflbm,xmflmc from bdm_xmflbm where xmflbm='"+xmflbm+"'",xmflbm);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" ><font color="#CC0000">*</font>��Ŀ����</td>
              <td colspan="3"  ><input type="text" name="xmmc" size="73" maxlength="100"  value="<%=xmmc%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"  ><font color="#CC0000">*</font>������λ</td>
              <td  ><select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm",jldwbm);
%>
              </select></td>
              <td align="right"  ><font color="#CC0000">*</font><font color="#0000CC">�Զ�����Ŀ��Ч��</font></td>
              <td  ><input type="text" name="zdyxmyxq" value="<%=zdyxmyxq%>" size="20" maxlength="10" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�Ƿ���Ҫ����</td>
              <td><%
	cf.radioToken(out, "sfxycl","Y+��Ҫ&N+��",sfxycl);
%></td>
              <td align="right"><font color="#FF0000">*</font>�Ƿ���ҪԤ����</td>
              <td><%
	cf.radioToken(out, "sfxyyjd","Y+��Ҫ&N+��",sfxyyjd);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#FFFFFF"><strong>���ⱨ��</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>ʩ���ɱ���</td>
              <td bgcolor="#FFFFFF"><input type="text" name="sgcbj" value="<%=sgcbj%>" size="20" maxlength="17"  ></td>
              <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>���̻�������</td>
              <td bgcolor="#FFFFFF"><input type="text" name="sgdbj" value="<%=sgdbj%>" size="20" maxlength="17"  ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>���ķ�</td>
              <td bgcolor="#FFFFFF"><input type="text" name="clbj" value="<%=clbj%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
              <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>���ķ�</td>
              <td bgcolor="#FFFFFF"><input type="text" name="zcf" value="<%=zcf%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>�˹���</td>
              <td bgcolor="#FFFFFF"><input type="text" name="rgbj" value="<%=rgbj%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
              <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>�����</td>
              <td bgcolor="#FFFFFF"><input type="text" name="ysf" value="<%=ysf%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>��е��</td>
              <td bgcolor="#FFFFFF"><input type="text" name="jxbj" value="<%=jxbj%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
              <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>��ķ�</td>
              <td bgcolor="#FFFFFF"><input type="text" name="shf" value="<%=shf%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>������</td>
              <td bgcolor="#FFFFFF"><input type="text" name="qtf" value="<%=qtf%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
              <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font><font color="#0000CC">����Ԥ���</font></td>
              <td bgcolor="#FFFFFF"><input type="text" name="bj" value="<%=bj%>" size="20" maxlength="17" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
              <td colspan="3" bgcolor="#FFFFFF"><font color="#0000CC"><strong>ע�⣺����Ԥ���<font color="#FF0000">(<font color="#0000CC"><strong>�Զ�����</strong></font>)</font>�����ķ�+���ķѣ��˹��ѣ�����ѣ���е�ѣ���ķѣ�������</strong></font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"  >���ղ��ϼ��</td>
              <td colspan="3"><textarea name="gycl" cols="71" rows="3"><%=gycl%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�������ƹ��</td>
              <td colspan="3"><textarea name="flmcgg" cols="71" rows="2"><%=flmcgg%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��ע</td>
              <td colspan="3"><textarea name="bz" cols="71" rows="2"><%=bz%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#CCCCFF">��˽������ֱ���޸�����������Ϣ��</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>��˽��</td>
              <td bgcolor="#CCCCFF"><%
	cf.radioToken(out,"shbz","Y+���ͨ��&W+���δͨ��","");
%></td>
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>�Ƿ��޸�</td>
              <td bgcolor="#CCCCFF"><%
	cf.radioToken(out,"sfbxg","Y+��&N+��","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#CC0000">*</font><span class="STYLE1">�����</span></td>
              <td bgcolor="#CCCCFF">
				  <input type="text" name="shr" value="<%=yhmc%>" size="20" maxlength="17" readonly>			  </td>
              <td align="right" bgcolor="#CCCCFF"><font color="#CC0000">*</font><span class="STYLE1">���ʱ��</span></td>
              <td bgcolor="#CCCCFF">
				<input type="text" name="shsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>			  </td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right" bgcolor="#CCCCFF">������</td>
              <td colspan="3"><textarea name="shyj" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                  <input type="hidden" name="smbm"  value="<%=smbm%>" >
                  <input type="hidden" name="xmbh"  value="<%=xmbh%>" >
                  <input type="hidden" name="lrr"  value="<%=lrr%>" >
                  <input type="hidden" name="yxmmc"  value="<%=xmmc%>" >
                  <input type="hidden" name="ybj"  value="<%=bj%>" >
                  <input type="hidden" name="ygycl"  value="<%=gycl%>" >
                  <input type="hidden" name="sqjl"  value="<%=sqjl%>" >
                </div>              </td>
            </tr>
          </table>
        </form>
	  </div>    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsjg(FormName)//����FormName:Form������
{
	var bj=FormName.clbj.value*1+FormName.rgbj.value*1+FormName.jxbj.value*1+FormName.zcf.value*1+FormName.shf.value*1+FormName.ysf.value*1+FormName.qtf.value*1;
	bj=round(bj,2);
	FormName.bj.value=bj;
}

function f_do(FormName)//����FormName:Form������
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.xmbh)=="") {
		alert("��ѡ��[��Ŀ���]��");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("��ѡ��[��Ŀ����]��");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("��ѡ��[��ĿС��]��");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}

	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("������[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("������[��Ŀ����]��");
		FormName.xmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldwbm.focus();
		return false;
	}

	if(	javaTrim(FormName.sgcbj)=="") {
		alert("������[ʩ���ɱ���]��");
		FormName.sgcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcbj, "ʩ���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdbj)=="") {
		alert("������[���̻�������]��");
		FormName.sgdbj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdbj, "���̻�������"))) {
		return false;
	}
	
	
	if(	javaTrim(FormName.bj)=="") {
		alert("������[����Ԥ���]��");
		FormName.bj.focus();
		return false;
	}
	if(!(isFloat(FormName.bj, "����Ԥ���"))) {
		return false;
	}
	if(	javaTrim(FormName.clbj)=="") {
		alert("������[���ķ�]��");
		FormName.clbj.focus();
		return false;
	}
	if(!(isFloat(FormName.clbj, "���ķ�"))) {
		return false;
	}
	if(	javaTrim(FormName.rgbj)=="") {
		alert("������[�˹���]��");
		FormName.rgbj.focus();
		return false;
	}
	if(!(isFloat(FormName.rgbj, "�˹���"))) {
		return false;
	}
	if(	javaTrim(FormName.jxbj)=="") {
		alert("������[��е��]��");
		FormName.jxbj.focus();
		return false;
	}
	if(!(isFloat(FormName.jxbj, "��е��"))) {
		return false;
	}
	if(	javaTrim(FormName.zcf)=="") {
		alert("������[���ķ�]��");
		FormName.zcf.focus();
		return false;
	}
	if(!(isFloat(FormName.zcf, "���ķ�"))) {
		return false;
	}
	if(	javaTrim(FormName.shf)=="") {
		alert("������[��ķ�]��");
		FormName.shf.focus();
		return false;
	}
	if(!(isFloat(FormName.shf, "��ķ�"))) {
		return false;
	}
	if(	javaTrim(FormName.ysf)=="") {
		alert("������[�����]��");
		FormName.ysf.focus();
		return false;
	}
	if(!(isFloat(FormName.ysf, "�����"))) {
		return false;
	}
	if(	javaTrim(FormName.qtf)=="") {
		alert("������[������]��");
		FormName.qtf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtf, "������"))) {
		return false;
	}
 	if(	javaTrim(FormName.zdyxmyxq)=="") {
		alert("������[�Զ�����Ŀ��Ч��]��");
		FormName.zdyxmyxq.focus();
		return false;
	}
	if(!(isDatetime(FormName.zdyxmyxq, "�Զ�����Ŀ��Ч��"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxycl)) {
		alert("��ѡ��[�Ƿ���Ҫ����]��");
		FormName.sfxycl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxyyjd)) {
		alert("��ѡ��[�Ƿ���ҪԤ����]��");
		FormName.sfxyyjd[0].focus();
		return false;
	}

	
	
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
	if(	!radioChecked(FormName.shbz)) {
		alert("��ѡ��[��˽��]��");
		FormName.shbz[0].focus();
		return false;
	}
	if (FormName.shbz[1].checked)
	{
		if(	javaTrim(FormName.shyj)=="") {
			alert("������[������]��");
			FormName.shyj.focus();
			return false;
		}
	}
	if(	!radioChecked(FormName.sfbxg)) {
		alert("��ѡ��[�Ƿ��޸�]��");
		FormName.sfbxg[0].focus();
		return false;
	}
	if (FormName.sfbxg[1].checked)
	{
		if(FormName.xmmc.value!=FormName.yxmmc.value ) 
		{
			alert("��ѡ����[δ�޸�]��ȴ�ԡ���Ŀ���ơ��������޸ģ�");
			FormName.sfbxg[0].focus();
			return false;
		}
		if( parseFloat(FormName.bj.value)!=parseFloat(FormName.ybj.value) ) 
		{
			alert("��ѡ����[δ�޸�]��ȴ�ԡ�����Ԥ��ۡ��������޸ģ�");
			FormName.sfbxg[0].focus();
			return false;
		}
		if(   FormName.gycl.value!=FormName.ygycl.value) 
		{
			alert("��ѡ����[δ�޸�]��ȴ�ԡ����ղ��ϼ�顿�������޸ģ�");
			FormName.sfbxg[0].focus();
			return false;
		}
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
