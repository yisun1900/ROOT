<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ssfgs=null;
String ygbh=null;
String bianhao=null;
String yhmc=null;
String xzzwbm=null;
String zwbm=null;
String dwbh=null;
String lx=null;
String txbz=null;

double jbgz=0;
double gwgz=0;
double glgz=0;
double jtbt=0;
double dhbt=0;
double cb=0;
double buzhu=0;
double dxsf=0;
double khgz=0;
double jxfz=0;
double jxgz=0;
double khyj=0;
double bqyjze=0;
double cqts=0;
double sjts=0;
double bjts=0;
double kgts=0;
double sjkk=0;
double bjkk=0;
double cjkk=0;
double kgkk=0;
double qqkk=0;
double jbf=0;
double kbx=0;
double jf=0;
double kzbj=0;
double qtkk=0;
double yfgz=0;
double ksk=0;
double sfgz=0;

String lrr=null;
String lrsj=null;
String bz=null;
String khzq=null;
double jxgzjs=0;
double yjkhkk=0;
double cjts=0;
double jbts=0;
double sqyj=0;
double dixin=0;
double kbjf=0;
double kywx=0;

String wheressfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
String wherekhzq=cf.GB2Uni(request.getParameter("khzq"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select kywx,kbjf,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,lx,txbz,jbgz,gwgz,glgz,jtbt,dhbt,cb,buzhu,dixin,dxsf,khgz,jxfz,jxgz,khyj,bqyjze,sqyj,cqts,sjts,bjts,kgts,sjkk,bjkk,cjkk,kgkk,qqkk,jbf,kbx,jf,kzbj,qtkk,yfgz,ksk,sfgz,lrr,lrsj,bz,khzq,jxgzjs,yjkhkk,cjts,jbts ";
	ls_sql+=" from  rs_gzmxb";
	ls_sql+=" where  (ssfgs='"+wheressfgs+"') and  (ygbh="+whereygbh+") and  (khzq='"+wherekhzq+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kywx=rs.getDouble("kywx");
		kbjf=rs.getDouble("kbjf");
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		zwbm=cf.fillNull(rs.getString("zwbm"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		lx=cf.fillNull(rs.getString("lx"));
		txbz=cf.fillNull(rs.getString("txbz"));

		jbgz=rs.getDouble("jbgz");
		gwgz=rs.getDouble("gwgz");
		glgz=rs.getDouble("glgz");
		jtbt=rs.getDouble("jtbt");
		dhbt=rs.getDouble("dhbt");
		cb=rs.getDouble("cb");
		buzhu=rs.getDouble("buzhu");
		dixin=rs.getDouble("dixin");
		dxsf=rs.getDouble("dxsf");

		khgz=rs.getDouble("khgz");
		jxfz=rs.getDouble("jxfz");
		jxgz=rs.getDouble("jxgz");
		khyj=rs.getDouble("khyj");
		bqyjze=rs.getDouble("bqyjze");
		sqyj=rs.getDouble("sqyj");
		cqts=rs.getDouble("cqts");
		sjts=rs.getDouble("sjts");
		bjts=rs.getDouble("bjts");
		kgts=rs.getDouble("kgts");
		sjkk=rs.getDouble("sjkk");
		bjkk=rs.getDouble("bjkk");
		cjkk=rs.getDouble("cjkk");
		kgkk=rs.getDouble("kgkk");
		qqkk=rs.getDouble("qqkk");
		jbf=rs.getDouble("jbf");
		kbx=rs.getDouble("kbx");
		jf=rs.getDouble("jf");
		kzbj=rs.getDouble("kzbj");
		qtkk=rs.getDouble("qtkk");
		yfgz=rs.getDouble("yfgz");
		ksk=rs.getDouble("ksk");
		sfgz=rs.getDouble("sfgz");

		jxgzjs=rs.getDouble("jxgzjs");
		yjkhkk=rs.getDouble("yjkhkk");
		cjts=rs.getDouble("cjts");
		jbts=rs.getDouble("jbts");

		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		khzq=cf.fillNull(rs.getString("khzq"));
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
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_gzmxb.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">��������</span></td>
    <td><input type="text" name="khzq" size="20" maxlength="6"  value="<%=khzq%>" readonly>    </td>
    <td align="right"><span class="STYLE1">�ֹ�˾</span></td>
    <td>
	<select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
      </select>	</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">Ա�����</span></td>
    <td><input type="text" name="ygbh" size="20" maxlength="8"  value="<%=ygbh%>" readonly></td>
    <td align="right"><span class="STYLE1">ͣн��־</span></td>
    <td><select name="txbz" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectToken(out,"N+δͣн&Y+ͣн",txbz,false);
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">Ա�����</span></td>
    <td><input type="text" name="bianhao" size="20" maxlength="20"  value="<%=bianhao%>" readonly>    </td>
    <td align="right"><span class="STYLE1">Ա������</span></td>
    <td><input type="text" name="yhmc" size="20" maxlength="50"  value="<%=yhmc%>" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">����ְ��</span></td>
    <td><input type="text" name="xzzwbm" size="20" maxlength="30"  value="<%=xzzwbm%>" readonly>    </td>
    <td align="right"><span class="STYLE1">����</span></td>
    <td><select name="zwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select zwbm,zwmc from dm_zwbm where zwbm='"+zwbm+"'",zwbm);
%>
      </select>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">��������</span></td>
    <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%>
      </select>    </td>
    <td align="right"><span class="STYLE1">����</span></td>
    <td><select name="lx" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectToken(out,"1+�̶�����&2+��������",lx,false);
%>
      </select>    </td>
  </tr>

<tr bgcolor="#FFFFCC">
  <td colspan="4">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������</td>
  <td><input type="text" name="jbgz" size="20" maxlength="17"  value="<%=jbgz%>" ></td>
  <td align="right">��λ����</td>
  <td><input type="text" name="gwgz" size="20" maxlength="17"  value="<%=gwgz%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���乤��</td> 
  <td width="32%"><input type="text" name="glgz" size="20" maxlength="17"  value="<%=glgz%>" ></td>
  <td align="right" width="18%">��ͨ����</td> 
  <td width="32%"><input type="text" name="jtbt" size="20" maxlength="17"  value="<%=jtbt%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ͨѶ����</td> 
  <td width="32%"><input type="text" name="dhbt" size="20" maxlength="17"  value="<%=dhbt%>" ></td>
  <td align="right" width="18%">��������</td> 
  <td width="32%"><input type="text" name="cb" size="20" maxlength="17"  value="<%=cb%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"><input type="text" name="buzhu" size="20" maxlength="17"  value="<%=buzhu%>" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">��н</span></td>
  <td colspan="3"><input type="text" name="dixin" size="20" maxlength="17"  value="<%=dixin%>" readonly>
    <span class="STYLE1">��н=��������+��λ����+���乤��+��ͨ����+ͨѶ����+��������+��������<strong>+���˹���</strong></span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��н�ϸ�</td> 
  <td width="32%"> 
    <input type="text" name="dxsf" size="20" maxlength="17"  value="<%=dxsf%>" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4">&nbsp;</td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right">��Ч���ʻ���</td>
  <td><input type="text" name="jxgzjs" size="20" maxlength="17"  value="<%=jxgzjs%>" ></td>
  <td align="right">��Ч��ֵ</td>
  <td><input type="text" name="jxfz" size="20" maxlength="17"  value="<%=jxfz%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ч����</td> 
  <td width="32%"><input type="text" name="jxgz" size="20" maxlength="17"  value="<%=jxgz%>" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFCC">
  <td colspan="4">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">����ҵ��</span></td> 
  <td width="32%"> 
    <input type="text" name="khyj" size="20" maxlength="17"  value="<%=khyj%>" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">����ҵ���ܶ�</span></td>
  <td><input type="text" name="bqyjze" size="20" maxlength="17"  value="<%=bqyjze%>" readonly></td>
  <td align="right"><span class="STYLE1">����3��ҵ��</span></td>
  <td><input type="text" name="sqyj" size="20" maxlength="17"  value="<%=sqyj%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">ҵ�����˿ۿ�</span></td>
  <td><input type="text" name="yjkhkk" size="20" maxlength="17"  value="<%=yjkhkk%>" readonly></td>
  <td align="right"><span class="STYLE1">���˹���</span></td>
  <td><input type="text" name="khgz" size="20" maxlength="17"  value="<%=khgz%>" readonly></td>
</tr>

<tr bgcolor="#FFFFCC">
  <td colspan="4">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ʵ�ʳ�������</td> 
  <td width="32%"> 
    <input type="text" name="cqts" size="20" maxlength="9"  value="<%=cqts%>" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�¼�����</td>
  <td><input type="text" name="sjts" size="20" maxlength="9"  value="<%=sjts%>" ></td>
  <td align="right">�¼ٿۿ�</td>
  <td><input type="text" name="sjkk" size="20" maxlength="17"  value="<%=sjkk%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������</td>
  <td><input type="text" name="bjts" size="20" maxlength="9"  value="<%=bjts%>" ></td>
  <td align="right">���ٿۿ�</td>
  <td><input type="text" name="bjkk" size="20" maxlength="17"  value="<%=bjkk%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������</td>
  <td><input type="text" name="cjts" size="20" maxlength="9"  value="<%=cjts%>" ></td>
  <td align="right">���ٿۿ�</td>
  <td><input type="text" name="cjkk" size="20" maxlength="17"  value="<%=cjkk%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"><input type="text" name="kgts" size="20" maxlength="9"  value="<%=kgts%>" ></td>
  <td align="right" width="18%">�����ۿ�</td> 
  <td width="32%"><input type="text" name="kgkk" size="20" maxlength="17"  value="<%=kgkk%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">ȱ�ڿۿ�</span></td> 
  <td colspan="3"> 
    <input type="text" name="qqkk" size="20" maxlength="17"  value="<%=qqkk%>" readonly>
    <span class="STYLE1"> ȱ�ڿۿ�=�¼ٿۿ�+���ٿۿ�+���ٿۿ�+�����ۿ�</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ӱ�����</td>
  <td><input type="text" name="jbts" size="20" maxlength="9"  value="<%=jbts%>" ></td>
  <td align="right">�Ӱ��</td>
  <td><input type="text" name="jbf" size="20" maxlength="17"  value="<%=jbf%>" ></td>
</tr>

<tr bgcolor="#FFFFCC">
  <td colspan="4">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���籣</td> 
  <td width="32%"> 
    <input type="text" name="kbx" size="20" maxlength="17"  value="<%=kbx%>" >  </td>
  <td align="right" width="18%">��������</td> 
  <td width="32%"><input name="kywx" type="text" id="kywx"  value="<%=kywx%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����</td>
  <td><input type="text" name="jf" size="20" maxlength="17"  value="<%=jf%>" ></td>
  <td align="right">�۱����</td>
  <td><input type="text" name="kbjf" size="20" maxlength="17"  value="<%=kbjf%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"><input type="text" name="qtkk" size="20" maxlength="17"  value="<%=qtkk%>" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFCC">
  <td colspan="4">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">Ӧ������</span></td>
  <td colspan="3"><input type="text" name="yfgz" size="20" maxlength="17"  value="<%=yfgz%>" readonly>
    <BR>
    <span class="STYLE1">Ӧ������=(��������+��λ����+���乤��+��ͨ����+ͨѶ����+��������+��������)+��н�ϸ�+���˹���+ҵ�����˿ۿ�+ȱ�ڿۿ�+�Ӱ��+���籣+��������+����+�۱����+��������</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ʱ���</td> 
  <td width="32%"> 
    <input type="text" name="kzbj" size="20" maxlength="17"  value="<%=kzbj%>" >  </td>
  <td align="right" width="18%">�۸�˰</td> 
  <td width="32%"><input type="text" name="ksk" size="20" maxlength="17"  value="<%=ksk%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ʵ������</td> 
  <td width="32%"><input type="text" name="sfgz" size="20" maxlength="17"  value="<%=sfgz%>" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td> 
  <td width="32%"><input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" ></td>
  <td align="right" width="18%">¼��ʱ��</td> 
  <td width="32%"><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea></td>
  </tr>
<input type="hidden" name="wheressfgs"  value="<%=wheressfgs%>" >
<input type="hidden" name="whereygbh"  value="<%=whereygbh%>" >
<input type="hidden" name="wherekhzq"  value="<%=wherekhzq%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("������[Ա�����]��");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "Ա�����"))) {
		return false;
	}
	if(	javaTrim(FormName.bianhao)=="") {
		alert("������[Ա�����]��");
		FormName.bianhao.focus();
		return false;
	}
	if(	javaTrim(FormName.yhmc)=="") {
		alert("������[Ա������]��");
		FormName.yhmc.focus();
		return false;
	}
	if(	javaTrim(FormName.zwbm)=="") {
		alert("������[����]��");
		FormName.zwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[�������ű��]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.lx)=="") {
		alert("������[����]��");
		FormName.lx.focus();
		return false;
	}
	if(	javaTrim(FormName.txbz)=="") {
		alert("������[ͣн��־]��");
		FormName.txbz.focus();
		return false;
	}
	if(	javaTrim(FormName.jbgz)=="") {
		alert("������[��������]��");
		FormName.jbgz.focus();
		return false;
	}
	if(!(isFloat(FormName.jbgz, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.gwgz)=="") {
		alert("������[��λ����]��");
		FormName.gwgz.focus();
		return false;
	}
	if(!(isFloat(FormName.gwgz, "��λ����"))) {
		return false;
	}
	if(	javaTrim(FormName.glgz)=="") {
		alert("������[���乤��]��");
		FormName.glgz.focus();
		return false;
	}
	if(!(isFloat(FormName.glgz, "���乤��"))) {
		return false;
	}
	if(	javaTrim(FormName.jtbt)=="") {
		alert("������[��ͨ����]��");
		FormName.jtbt.focus();
		return false;
	}
	if(!(isFloat(FormName.jtbt, "��ͨ����"))) {
		return false;
	}
	if(	javaTrim(FormName.dhbt)=="") {
		alert("������[ͨѶ����]��");
		FormName.dhbt.focus();
		return false;
	}
	if(!(isFloat(FormName.dhbt, "ͨѶ����"))) {
		return false;
	}
	if(	javaTrim(FormName.cb)=="") {
		alert("������[��������]��");
		FormName.cb.focus();
		return false;
	}
	if(!(isFloat(FormName.cb, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.buzhu)=="") {
		alert("������[��������]��");
		FormName.buzhu.focus();
		return false;
	}
	if(!(isFloat(FormName.buzhu, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.dixin)=="") {
		alert("������[��н]��");
		FormName.dixin.focus();
		return false;
	}
	if(!(isFloat(FormName.dixin, "��н"))) {
		return false;
	}
	if(	javaTrim(FormName.dxsf)=="") {
		alert("������[��н�ϸ�]��");
		FormName.dxsf.focus();
		return false;
	}
	if(!(isFloat(FormName.dxsf, "��н�ϸ�"))) {
		return false;
	}
	if(	javaTrim(FormName.khgz)=="") {
		alert("������[���˹���]��");
		FormName.khgz.focus();
		return false;
	}
	if(!(isFloat(FormName.khgz, "���˹���"))) {
		return false;
	}
	if(	javaTrim(FormName.jxfz)=="") {
		alert("������[��Ч��ֵ]��");
		FormName.jxfz.focus();
		return false;
	}
	if(!(isFloat(FormName.jxfz, "��Ч��ֵ"))) {
		return false;
	}
	if(	javaTrim(FormName.jxgz)=="") {
		alert("������[��Ч����]��");
		FormName.jxgz.focus();
		return false;
	}
	if(!(isFloat(FormName.jxgz, "��Ч����"))) {
		return false;
	}
	if(	javaTrim(FormName.khyj)=="") {
		alert("������[����ҵ��]��");
		FormName.khyj.focus();
		return false;
	}
	if(!(isFloat(FormName.khyj, "����ҵ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sqyj)=="") {
		alert("������[����3��ҵ��]��");
		FormName.sqyj.focus();
		return false;
	}
	if(!(isFloat(FormName.sqyj, "����3��ҵ��"))) {
		return false;
	}
	if(	javaTrim(FormName.bqyjze)=="") {
		alert("������[����ҵ���ܶ�]��");
		FormName.bqyjze.focus();
		return false;
	}
	if(!(isFloat(FormName.bqyjze, "����ҵ���ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.cqts)=="") {
		alert("������[ʵ�ʳ�������]��");
		FormName.cqts.focus();
		return false;
	}
	if(!(isFloat(FormName.cqts, "ʵ�ʳ�������"))) {
		return false;
	}
	if(	javaTrim(FormName.sjts)=="") {
		alert("������[�¼�����]��");
		FormName.sjts.focus();
		return false;
	}
	if(!(isFloat(FormName.sjts, "�¼�����"))) {
		return false;
	}
	if(	javaTrim(FormName.bjts)=="") {
		alert("������[��������]��");
		FormName.bjts.focus();
		return false;
	}
	if(!(isFloat(FormName.bjts, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.kgts)=="") {
		alert("������[��������]��");
		FormName.kgts.focus();
		return false;
	}
	if(!(isFloat(FormName.kgts, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.sjkk)=="") {
		alert("������[�¼ٿۿ�]��");
		FormName.sjkk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjkk, "�¼ٿۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.bjkk)=="") {
		alert("������[���ٿۿ�]��");
		FormName.bjkk.focus();
		return false;
	}
	if(!(isFloat(FormName.bjkk, "���ٿۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.cjkk)=="") {
		alert("������[���ٿۿ�]��");
		FormName.cjkk.focus();
		return false;
	}
	if(!(isFloat(FormName.cjkk, "���ٿۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.kgkk)=="") {
		alert("������[�����ۿ�]��");
		FormName.kgkk.focus();
		return false;
	}
	if(!(isFloat(FormName.kgkk, "�����ۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.qqkk)=="") {
		alert("������[ȱ�ڿۿ�]��");
		FormName.qqkk.focus();
		return false;
	}
	if(!(isFloat(FormName.qqkk, "ȱ�ڿۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.jbf)=="") {
		alert("������[�Ӱ��]��");
		FormName.jbf.focus();
		return false;
	}
	if(!(isFloat(FormName.jbf, "�Ӱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.kbx)=="") {
		alert("������[�۱���]��");
		FormName.kbx.focus();
		return false;
	}
	if(!(isFloat(FormName.kbx, "�۱���"))) {
		return false;
	}

	if(	javaTrim(FormName.jf)=="") {
		alert("������[����]��");
		FormName.jf.focus();
		return false;
	}
	if(!(isFloat(FormName.jf, "����"))) {
		return false;
	}

	if(	javaTrim(FormName.kzbj)=="") {
		alert("������[���ʱ���]��");
		FormName.kzbj.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbj, "���ʱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.qtkk)=="") {
		alert("������[��������]��");
		FormName.qtkk.focus();
		return false;
	}
	if(!(isFloat(FormName.qtkk, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.yfgz)=="") {
		alert("������[Ӧ������]��");
		FormName.yfgz.focus();
		return false;
	}
	if(!(isFloat(FormName.yfgz, "Ӧ������"))) {
		return false;
	}
	if(	javaTrim(FormName.ksk)=="") {
		alert("������[�۸�˰]��");
		FormName.ksk.focus();
		return false;
	}
	if(!(isFloat(FormName.ksk, "�۸�˰"))) {
		return false;
	}
	if(	javaTrim(FormName.sfgz)=="") {
		alert("������[ʵ������]��");
		FormName.sfgz.focus();
		return false;
	}
	if(!(isFloat(FormName.sfgz, "ʵ������"))) {
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
	if(	javaTrim(FormName.khzq)=="") {
		alert("������[��������]��");
		FormName.khzq.focus();
		return false;
	}
	if(	javaTrim(FormName.jxgzjs)=="") {
		alert("������[��Ч���ʻ���]��");
		FormName.jxgzjs.focus();
		return false;
	}
	if(!(isFloat(FormName.jxgzjs, "��Ч���ʻ���"))) {
		return false;
	}
	if(	javaTrim(FormName.yjkhkk)=="") {
		alert("������[ҵ�����˿ۿ�]��");
		FormName.yjkhkk.focus();
		return false;
	}
	if(!(isFloat(FormName.yjkhkk, "ҵ�����˿ۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.cjts)=="") {
		alert("������[��������]��");
		FormName.cjts.focus();
		return false;
	}
	if(!(isFloat(FormName.cjts, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.jbts)=="") {
		alert("������[�Ӱ�����]��");
		FormName.jbts.focus();
		return false;
	}
	if(!(isFloat(FormName.jbts, "�Ӱ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.kbjf)=="") {
		alert("������[�۱����]��");
		FormName.kbjf.focus();
		return false;
	}
	if(!(isFloat(FormName.kbjf, "�۱����"))) {
		return false;
	}
	if(	javaTrim(FormName.kywx)=="") {
		alert("������[��������]��");
		FormName.kywx.focus();
		return false;
	}
	if(!(isFloat(FormName.kywx, "��������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
